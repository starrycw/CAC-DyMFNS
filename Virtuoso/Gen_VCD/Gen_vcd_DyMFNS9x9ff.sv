`timescale 1ns / 1ps  
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/28 
// Design Name: 
// Module Name: Gen_vcd_DyMFNS9x9ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generating VCD files for Virtuoso ADE. 
//              For BER simulation of 9x9 array with row-by-row DyMFNS encoding.
//              Edit the first line (`timescale) and delay (#1) to change the frequency.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "Header_DyMFNS.vh"

module Gen_vcd_DyMFNS9x9ff(

);

    reg clkMain;
    reg [80 : 0] dataGenRandom;

    reg [80 : 0] dsend; // Uncoded data to be transmitted
    reg [80 : 0] dref; // Uncoded data for BER check

    reg [80 : 0] Mdsend; // DyMFNS codewords to be transmitted
    reg [80 : 0] Mdref; // DyMFNS codewords for BER check

    wire [53 : 0] encoderDataIn;
    wire [80 : 0] encoderCodewordOut;
    reg [80 : 0] encoderCodewordOutReg;

    // Encoder
    assign encoderDataIn[53 : 0] = dataGenRandom[53 : 0];

    DyMFNS_Encoder_9x9_FaultFree enc_main (
        .rawDataIn(encoderDataIn),
        .codewordOut(encoderCodewordOut)
    );

    // encoderCodewordOutReg update
    always @(*) begin
        encoderCodewordOutReg =  encoderCodewordOut;
    end

    // Random data generation
    integer i, j, check_i, check_j, check_idx, check_cnterr;

    initial begin
        clkMain = 0;
        dataGenRandom = 0;

        #0.5; /////////////////////////////////////////////////
        clkMain = 1;

        #0.5; /////////////////////////////////////////////////
        for (i=0; i < 10001; i++) begin
            #0.5; /////////////////////////////////////////////
            clkMain = 0;

            for (j=0; j < 81; j++) begin
                dataGenRandom[j] <= {$random} % 2;
            end

            #0.5; //////////////////////////////////////////////
            clkMain = 1;

            // Check CAC codewords
            check_cnterr = 0;
            for (check_i=0; check_i < 9; check_i++) begin
                for (check_j=1; check_j < 8; check_j++) begin
                    check_idx = 9 * check_i + check_j;
                    if ( (encoderCodewordOutReg[check_idx + 1] == 1) && (encoderCodewordOutReg[check_idx] == 0) && (encoderCodewordOutReg[check_idx - 1] == 1) ) begin
                        check_cnterr = check_cnterr + 1;
                    end
                    if ( (encoderCodewordOutReg[check_idx + 1] == 0) && (encoderCodewordOutReg[check_idx] == 1) && (encoderCodewordOutReg[check_idx - 1] == 0) ) begin
                        check_cnterr = check_cnterr + 1;
                    end
                end
            end 
            $display("ERR: %d", check_cnterr);
        end

        # 0.5;
        $finish();
    end


    // Output generation
    initial begin
        dsend <= 0;
        dref <= 0;
        Mdsend <= 0;
        Mdref <= 0;
    end

    always @(negedge clkMain) begin
        dsend <= dataGenRandom;
        dref <= dataGenRandom;

        Mdsend <= encoderCodewordOut;
        Mdref <= encoderCodewordOut;
    end


endmodule