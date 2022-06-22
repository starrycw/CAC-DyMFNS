`ifndef __FNSCodec_HEADER__
    `define __FNSCodec_HEADER__
    
    //FNS value 
    `define FNSCodec_NSV01 1    
    `define FNSCodec_NSV02 1    
    `define FNSCodec_NSV03 2    
    `define FNSCodec_NSV04 3    
    `define FNSCodec_NSV05 5    
    `define FNSCodec_NSV06 8    
    `define FNSCodec_NSV07 13   
    `define FNSCodec_NSV08 21   
    `define FNSCodec_NSV09 34
    `define FNSCodec_NSV10 55
    `define FNSCodec_NSV11 89
    `define FNSCodec_NSV12 144
    `define FNSCodec_NSV13 233
    `define FNSCodec_NSV14 377
    `define FNSCodec_NSV15 610
    `define FNSCodec_NSV16 987
    `define FNSCodec_NSV17 1597
    `define FNSCodec_NSV18 2584
    `define FNSCodec_NSV19 4181
    `define FNSCodec_NSV20 6765

  
    
    //FNS Len (eg: FNS03[`FNS_NSLEN03-1 : 0])
    `define FNSCodec_NSLEN01 1
    `define FNSCodec_NSLEN02 1
    `define FNSCodec_NSLEN03 2
    `define FNSCodec_NSLEN04 2
    `define FNSCodec_NSLEN05 3
    `define FNSCodec_NSLEN06 4
    `define FNSCodec_NSLEN07 4
    `define FNSCodec_NSLEN08 5
    `define FNSCodec_NSLEN09 6
    `define FNSCodec_NSLEN10 6
    `define FNSCodec_NSLEN11 7
    `define FNSCodec_NSLEN12 8
    `define FNSCodec_NSLEN13 8
    `define FNSCodec_NSLEN14 9
    `define FNSCodec_NSLEN15 10
    `define FNSCodec_NSLEN16 10
    `define FNSCodec_NSLEN17 11
    `define FNSCodec_NSLEN18 12
    `define FNSCodec_NSLEN19 13
    `define FNSCodec_NSLEN20 13
   
    //binary code len (eg: data[`FNSCodec_DataWidth03-1 : 0] can be coded as 3bits FNS-CAC codewords)    
    `define FNSCodec_DataWidth01 1
    `define FNSCodec_DataWidth02 1
    `define FNSCodec_DataWidth03 2
    `define FNSCodec_DataWidth04 3
    `define FNSCodec_DataWidth05 3
    `define FNSCodec_DataWidth06 4
    `define FNSCodec_DataWidth07 5
    `define FNSCodec_DataWidth08 5
    `define FNSCodec_DataWidth09 6
    `define FNSCodec_DataWidth10 7
    `define FNSCodec_DataWidth11 7
    `define FNSCodec_DataWidth12 8
    `define FNSCodec_DataWidth13 9
    `define FNSCodec_DataWidth14 9
    `define FNSCodec_DataWidth15 10
    `define FNSCodec_DataWidth16 11
    `define FNSCodec_DataWidth17 12
    `define FNSCodec_DataWidth18 12
    `define FNSCodec_DataWidth19 13
    `define FNSCodec_DataWidth20 14

    //res value len (eg: res[`FNSCodec_ResWidth03-1 : 0] defines the res value wire between encoder4(ns=3) and encoder3(ns=2))
    `define FNSCodec_ResWidth01 1
    `define FNSCodec_ResWidth02 2
    `define FNSCodec_ResWidth03 3
    `define FNSCodec_ResWidth04 3
    `define FNSCodec_ResWidth05 4
    `define FNSCodec_ResWidth06 5
    `define FNSCodec_ResWidth07 6
    `define FNSCodec_ResWidth08 6
    `define FNSCodec_ResWidth09 7
    `define FNSCodec_ResWidth10 8
    `define FNSCodec_ResWidth11 8
    `define FNSCodec_ResWidth12 9
    `define FNSCodec_ResWidth13 10
    `define FNSCodec_ResWidth14 10
    `define FNSCodec_ResWidth15 11
    `define FNSCodec_ResWidth16 12
    `define FNSCodec_ResWidth17 13
    `define FNSCodec_ResWidth18 13
    `define FNSCodec_ResWidth19 14
    `define FNSCodec_ResWidth20 15



    
`endif