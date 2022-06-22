`ifndef __DyMFNS_HEADER__
    `define __DyMFNS_HEADER__
    
    // DyMFNS Adder的输出位宽
    // idx=0, Adder 1 --- OUT_A(max): 1, 1-bit; OUT_B(max): 1, 1-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_1 1
    `define DYMFNS_ADDER_OUTB_BLEN_1 1
    // idx=1, Adder 2 --- OUT_A(max): 2, 2-bit; OUT_B(max): 2, 2-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_2 2
    `define DYMFNS_ADDER_OUTB_BLEN_2 2
    // idx=2, Adder 3 --- OUT_A(max): 3, 2-bit; OUT_B(max): 3, 2-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_3 2
    `define DYMFNS_ADDER_OUTB_BLEN_3 2
    // idx=3, Adder 4 --- OUT_A(max): 5, 3-bit; OUT_B(max): 5, 3-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_4 3
    `define DYMFNS_ADDER_OUTB_BLEN_4 3
    // idx=4, Adder 5 --- OUT_A(max): 8, 4-bit; OUT_B(max): 8, 4-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_5 4
    `define DYMFNS_ADDER_OUTB_BLEN_5 4
    // idx=5, Adder 6 --- OUT_A(max): 13, 4-bit; OUT_B(max): 13, 4-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_6 4
    `define DYMFNS_ADDER_OUTB_BLEN_6 4
    // idx=6, Adder 7 --- OUT_A(max): 21, 5-bit; OUT_B(max): 21, 5-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_7 5
    `define DYMFNS_ADDER_OUTB_BLEN_7 5
    // idx=7, Adder 8 --- OUT_A(max): 34, 6-bit; OUT_B(max): 34, 6-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_8 6
    `define DYMFNS_ADDER_OUTB_BLEN_8 6
    // idx=8, Adder 9 --- OUT_A(max): 55, 6-bit; OUT_B(max): 55, 6-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_9 6
    `define DYMFNS_ADDER_OUTB_BLEN_9 6
    // idx=9, Adder 10 --- OUT_A(max): 89, 7-bit; OUT_B(max): 89, 7-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_10 7
    `define DYMFNS_ADDER_OUTB_BLEN_10 7
    // idx=10, Adder 11 --- OUT_A(max): 144, 8-bit; OUT_B(max): 144, 8-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_11 8
    `define DYMFNS_ADDER_OUTB_BLEN_11 8
    // idx=11, Adder 12 --- OUT_A(max): 233, 8-bit; OUT_B(max): 233, 8-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_12 8
    `define DYMFNS_ADDER_OUTB_BLEN_12 8
    // idx=12, Adder 13 --- OUT_A(max): 377, 9-bit; OUT_B(max): 377, 9-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_13 9
    `define DYMFNS_ADDER_OUTB_BLEN_13 9
    // idx=13, Adder 14 --- OUT_A(max): 610, 10-bit; OUT_B(max): 610, 10-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_14 10
    `define DYMFNS_ADDER_OUTB_BLEN_14 10
    // idx=14, Adder 15 --- OUT_A(max): 987, 10-bit; OUT_B(max): 987, 10-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_15 10
    `define DYMFNS_ADDER_OUTB_BLEN_15 10
    // idx=15, Adder 16 --- OUT_A(max): 1597, 11-bit; OUT_B(max): 1597, 11-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_16 11
    `define DYMFNS_ADDER_OUTB_BLEN_16 11
    // idx=16, Adder 17 --- OUT_A(max): 2584, 12-bit; OUT_B(max): 2584, 12-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_17 12
    `define DYMFNS_ADDER_OUTB_BLEN_17 12
    // idx=17, Adder 18 --- OUT_A(max): 4181, 13-bit; OUT_B(max): 4181, 13-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_18 13
    `define DYMFNS_ADDER_OUTB_BLEN_18 13
    // idx=18, Adder 19 --- OUT_A(max): 6765, 13-bit; OUT_B(max): 6765, 13-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_19 13
    `define DYMFNS_ADDER_OUTB_BLEN_19 13
    // idx=19, Adder 20 --- OUT_A(max): 10946, 14-bit; OUT_B(max): 10946, 14-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_20 14
    `define DYMFNS_ADDER_OUTB_BLEN_20 14
    // idx=20, Adder 21 --- OUT_A(max): 17711, 15-bit; OUT_B(max): 17711, 15-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_21 15
    `define DYMFNS_ADDER_OUTB_BLEN_21 15
    // idx=21, Adder 22 --- OUT_A(max): 28657, 15-bit; OUT_B(max): 28657, 15-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_22 15
    `define DYMFNS_ADDER_OUTB_BLEN_22 15
    // idx=22, Adder 23 --- OUT_A(max): 46368, 16-bit; OUT_B(max): 46368, 16-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_23 16
    `define DYMFNS_ADDER_OUTB_BLEN_23 16
    // idx=23, Adder 24 --- OUT_A(max): 75025, 17-bit; OUT_B(max): 75025, 17-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_24 17
    `define DYMFNS_ADDER_OUTB_BLEN_24 17
    // idx=24, Adder 25 --- OUT_A(max): 121393, 17-bit; OUT_B(max): 121393, 17-bit.
    `define DYMFNS_ADDER_OUTA_BLEN_25 17
    `define DYMFNS_ADDER_OUTB_BLEN_25 17
    
    
    // DyMFNS Codec的原始数据端口位宽
    // codeword length = 1, max data that can be represented = 1, raw data len = 1
    `define DYMFNS_CODEC_RAWDATALEN_1 1
    // codeword length = 2, max data that can be represented = 3, raw data len = 2
    `define DYMFNS_CODEC_RAWDATALEN_2 2
    // codeword length = 3, max data that can be represented = 5, raw data len = 2
    `define DYMFNS_CODEC_RAWDATALEN_3 2
    // codeword length = 4, max data that can be represented = 9, raw data len = 3
    `define DYMFNS_CODEC_RAWDATALEN_4 3
    // codeword length = 5, max data that can be represented = 15, raw data len = 4
    `define DYMFNS_CODEC_RAWDATALEN_5 4
    // codeword length = 6, max data that can be represented = 25, raw data len = 4
    `define DYMFNS_CODEC_RAWDATALEN_6 4
    // codeword length = 7, max data that can be represented = 41, raw data len = 5
    `define DYMFNS_CODEC_RAWDATALEN_7 5
    // codeword length = 8, max data that can be represented = 67, raw data len = 6
    `define DYMFNS_CODEC_RAWDATALEN_8 6
    // codeword length = 9, max data that can be represented = 109, raw data len = 6
    `define DYMFNS_CODEC_RAWDATALEN_9 6
    // codeword length = 10, max data that can be represented = 177, raw data len = 7
    `define DYMFNS_CODEC_RAWDATALEN_10 7
    // codeword length = 11, max data that can be represented = 287, raw data len = 8
    `define DYMFNS_CODEC_RAWDATALEN_11 8
    // codeword length = 12, max data that can be represented = 465, raw data len = 8
    `define DYMFNS_CODEC_RAWDATALEN_12 8
    // codeword length = 13, max data that can be represented = 753, raw data len = 9
    `define DYMFNS_CODEC_RAWDATALEN_13 9
    // codeword length = 14, max data that can be represented = 1219, raw data len = 10
    `define DYMFNS_CODEC_RAWDATALEN_14 10
    // codeword length = 15, max data that can be represented = 1973, raw data len = 10
    `define DYMFNS_CODEC_RAWDATALEN_15 10
    // codeword length = 16, max data that can be represented = 3193, raw data len = 11
    `define DYMFNS_CODEC_RAWDATALEN_16 11
    // codeword length = 17, max data that can be represented = 5167, raw data len = 12
    `define DYMFNS_CODEC_RAWDATALEN_17 12
    // codeword length = 18, max data that can be represented = 8361, raw data len = 13
    `define DYMFNS_CODEC_RAWDATALEN_18 13
    // codeword length = 19, max data that can be represented = 13529, raw data len = 13
    `define DYMFNS_CODEC_RAWDATALEN_19 13
    // codeword length = 20, max data that can be represented = 21891, raw data len = 14
    `define DYMFNS_CODEC_RAWDATALEN_20 14
    // codeword length = 21, max data that can be represented = 35421, raw data len = 15
    `define DYMFNS_CODEC_RAWDATALEN_21 15
    // codeword length = 22, max data that can be represented = 57313, raw data len = 15
    `define DYMFNS_CODEC_RAWDATALEN_22 15
    // codeword length = 23, max data that can be represented = 92735, raw data len = 16
    `define DYMFNS_CODEC_RAWDATALEN_23 16
    // codeword length = 24, max data that can be represented = 150049, raw data len = 17
    `define DYMFNS_CODEC_RAWDATALEN_24 17
    // codeword length = 25, max data that can be represented = 242785, raw data len = 17
    `define DYMFNS_CODEC_RAWDATALEN_25 17
    
    
    // res
    // codeword length = 1, max data that can be represented = 1, res data len = 1
    `define DYMFNS_CODEC_RESLEN_1 1
    // codeword length = 2, max data that can be represented = 3, res data len = 2
    `define DYMFNS_CODEC_RESLEN_2 2
    // codeword length = 3, max data that can be represented = 5, res data len = 3
    `define DYMFNS_CODEC_RESLEN_3 3
    // codeword length = 4, max data that can be represented = 9, res data len = 4
    `define DYMFNS_CODEC_RESLEN_4 4
    // codeword length = 5, max data that can be represented = 15, res data len = 4
    `define DYMFNS_CODEC_RESLEN_5 4
    // codeword length = 6, max data that can be represented = 25, res data len = 5
    `define DYMFNS_CODEC_RESLEN_6 5
    // codeword length = 7, max data that can be represented = 41, res data len = 6
    `define DYMFNS_CODEC_RESLEN_7 6
    // codeword length = 8, max data that can be represented = 67, res data len = 7
    `define DYMFNS_CODEC_RESLEN_8 7
    // codeword length = 9, max data that can be represented = 109, res data len = 7
    `define DYMFNS_CODEC_RESLEN_9 7
    // codeword length = 10, max data that can be represented = 177, res data len = 8
    `define DYMFNS_CODEC_RESLEN_10 8
    // codeword length = 11, max data that can be represented = 287, res data len = 9
    `define DYMFNS_CODEC_RESLEN_11 9
    // codeword length = 12, max data that can be represented = 465, res data len = 9
    `define DYMFNS_CODEC_RESLEN_12 9
    // codeword length = 13, max data that can be represented = 753, res data len = 10
    `define DYMFNS_CODEC_RESLEN_13 10
    // codeword length = 14, max data that can be represented = 1219, res data len = 11
    `define DYMFNS_CODEC_RESLEN_14 11
    // codeword length = 15, max data that can be represented = 1973, res data len = 11
    `define DYMFNS_CODEC_RESLEN_15 11
    // codeword length = 16, max data that can be represented = 3193, res data len = 12
    `define DYMFNS_CODEC_RESLEN_16 12
    // codeword length = 17, max data that can be represented = 5167, res data len = 13
    `define DYMFNS_CODEC_RESLEN_17 13
    // codeword length = 18, max data that can be represented = 8361, res data len = 14
    `define DYMFNS_CODEC_RESLEN_18 14
    // codeword length = 19, max data that can be represented = 13529, res data len = 14
    `define DYMFNS_CODEC_RESLEN_19 14
    // codeword length = 20, max data that can be represented = 21891, res data len = 15
    `define DYMFNS_CODEC_RESLEN_20 15
    // codeword length = 21, max data that can be represented = 35421, res data len = 16
    `define DYMFNS_CODEC_RESLEN_21 16
    // codeword length = 22, max data that can be represented = 57313, res data len = 16
    `define DYMFNS_CODEC_RESLEN_22 16
    // codeword length = 23, max data that can be represented = 92735, res data len = 17
    `define DYMFNS_CODEC_RESLEN_23 17
    // codeword length = 24, max data that can be represented = 150049, res data len = 18
    `define DYMFNS_CODEC_RESLEN_24 18
    // codeword length = 25, max data that can be represented = 242785, res data len = 18
    `define DYMFNS_CODEC_RESLEN_25 18
    
    
    
`endif