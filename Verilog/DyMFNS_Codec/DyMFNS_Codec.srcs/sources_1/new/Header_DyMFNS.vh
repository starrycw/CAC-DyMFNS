`ifndef __DyMFNS_HEADER__
    `define __DyMFNS_HEADER__
    
    // DyMFNS AdderµÄÊä³öÎ»¿í
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
    
`endif