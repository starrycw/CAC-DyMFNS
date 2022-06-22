`ifndef __AdaptiveFNS_HEADER__
    `define __AdaptiveFNS_HEADER__
    
    // AdaptiveFNS AdderµÄÊä³öÎ»¿í
    // idx=0, Adder 1 --- OUT_A: 1, 1-bit; OUT_B: 1, 1-bit.
    `define AFNS_ADDER_OUTA_BLEN_1 1
    `define AFNS_ADDER_OUTB_BLEN_1 1
    // idx=1, Adder 2 --- OUT_A: 2, 2-bit; OUT_B: 1, 1-bit.
    `define AFNS_ADDER_OUTA_BLEN_2 2
    `define AFNS_ADDER_OUTB_BLEN_2 1
    // idx=2, Adder 3 --- OUT_A: 3, 2-bit; OUT_B: 2, 2-bit.
    `define AFNS_ADDER_OUTA_BLEN_3 2
    `define AFNS_ADDER_OUTB_BLEN_3 2
    // idx=3, Adder 4 --- OUT_A: 5, 3-bit; OUT_B: 3, 2-bit.
    `define AFNS_ADDER_OUTA_BLEN_4 3
    `define AFNS_ADDER_OUTB_BLEN_4 2
    // idx=4, Adder 5 --- OUT_A: 8, 4-bit; OUT_B: 5, 3-bit.
    `define AFNS_ADDER_OUTA_BLEN_5 4
    `define AFNS_ADDER_OUTB_BLEN_5 3
    // idx=5, Adder 6 --- OUT_A: 13, 4-bit; OUT_B: 8, 4-bit.
    `define AFNS_ADDER_OUTA_BLEN_6 4
    `define AFNS_ADDER_OUTB_BLEN_6 4
    // idx=6, Adder 7 --- OUT_A: 21, 5-bit; OUT_B: 13, 4-bit.
    `define AFNS_ADDER_OUTA_BLEN_7 5
    `define AFNS_ADDER_OUTB_BLEN_7 4
    // idx=7, Adder 8 --- OUT_A: 34, 6-bit; OUT_B: 21, 5-bit.
    `define AFNS_ADDER_OUTA_BLEN_8 6
    `define AFNS_ADDER_OUTB_BLEN_8 5
    // idx=8, Adder 9 --- OUT_A: 55, 6-bit; OUT_B: 34, 6-bit.
    `define AFNS_ADDER_OUTA_BLEN_9 6
    `define AFNS_ADDER_OUTB_BLEN_9 6
    // idx=9, Adder 10 --- OUT_A: 89, 7-bit; OUT_B: 55, 6-bit.
    `define AFNS_ADDER_OUTA_BLEN_10 7
    `define AFNS_ADDER_OUTB_BLEN_10 6
    // idx=10, Adder 11 --- OUT_A: 144, 8-bit; OUT_B: 89, 7-bit.
    `define AFNS_ADDER_OUTA_BLEN_11 8
    `define AFNS_ADDER_OUTB_BLEN_11 7
    // idx=11, Adder 12 --- OUT_A: 233, 8-bit; OUT_B: 144, 8-bit.
    `define AFNS_ADDER_OUTA_BLEN_12 8
    `define AFNS_ADDER_OUTB_BLEN_12 8
    // idx=12, Adder 13 --- OUT_A: 377, 9-bit; OUT_B: 233, 8-bit.
    `define AFNS_ADDER_OUTA_BLEN_13 9
    `define AFNS_ADDER_OUTB_BLEN_13 8
    // idx=13, Adder 14 --- OUT_A: 610, 10-bit; OUT_B: 377, 9-bit.
    `define AFNS_ADDER_OUTA_BLEN_14 10
    `define AFNS_ADDER_OUTB_BLEN_14 9
    // idx=14, Adder 15 --- OUT_A: 987, 10-bit; OUT_B: 610, 10-bit.
    `define AFNS_ADDER_OUTA_BLEN_15 10
    `define AFNS_ADDER_OUTB_BLEN_15 10
    // idx=15, Adder 16 --- OUT_A: 1597, 11-bit; OUT_B: 987, 10-bit.
    `define AFNS_ADDER_OUTA_BLEN_16 11
    `define AFNS_ADDER_OUTB_BLEN_16 10
    // idx=16, Adder 17 --- OUT_A: 2584, 12-bit; OUT_B: 1597, 11-bit.
    `define AFNS_ADDER_OUTA_BLEN_17 12
    `define AFNS_ADDER_OUTB_BLEN_17 11
    // idx=17, Adder 18 --- OUT_A: 4181, 13-bit; OUT_B: 2584, 12-bit.
    `define AFNS_ADDER_OUTA_BLEN_18 13
    `define AFNS_ADDER_OUTB_BLEN_18 12
    // idx=18, Adder 19 --- OUT_A: 6765, 13-bit; OUT_B: 4181, 13-bit.
    `define AFNS_ADDER_OUTA_BLEN_19 13
    `define AFNS_ADDER_OUTB_BLEN_19 13
    // idx=19, Adder 20 --- OUT_A: 10946, 14-bit; OUT_B: 6765, 13-bit.
    `define AFNS_ADDER_OUTA_BLEN_20 14
    `define AFNS_ADDER_OUTB_BLEN_20 13
    // idx=20, Adder 21 --- OUT_A: 17711, 15-bit; OUT_B: 10946, 14-bit.
    `define AFNS_ADDER_OUTA_BLEN_21 15
    `define AFNS_ADDER_OUTB_BLEN_21 14
    // idx=21, Adder 22 --- OUT_A: 28657, 15-bit; OUT_B: 17711, 15-bit.
    `define AFNS_ADDER_OUTA_BLEN_22 15
    `define AFNS_ADDER_OUTB_BLEN_22 15
    // idx=22, Adder 23 --- OUT_A: 46368, 16-bit; OUT_B: 28657, 15-bit.
    `define AFNS_ADDER_OUTA_BLEN_23 16
    `define AFNS_ADDER_OUTB_BLEN_23 15
    // idx=23, Adder 24 --- OUT_A: 75025, 17-bit; OUT_B: 46368, 16-bit.
    `define AFNS_ADDER_OUTA_BLEN_24 17
    `define AFNS_ADDER_OUTB_BLEN_24 16
    // idx=24, Adder 25 --- OUT_A: 121393, 17-bit; OUT_B: 75025, 17-bit.
    `define AFNS_ADDER_OUTA_BLEN_25 17
    `define AFNS_ADDER_OUTB_BLEN_25 17
    
    
`endif