# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/15
# @Author  : c

def dymfns_adder(in1, in2, flag_left, flag_mid, flag_right, flag_notlsb):
    '''
    6输入2输出的DyMFNS加法器。

    in1, in2为输入值。
    flag_left, flag_mid, flag_right分别为左侧、自身以及右侧对应TSV的故障标志位，标志位为0代表无故障，为1代表有故障。
    flag_notlsb为标志位，指示当前是否是第一个无故障TSV对应的加法器。0表示是，1表示不是。

    :param in1:
    :param in2:
    :param flag_left:
    :param flag_mid:
    :param flag_right:
    :param flag_notlsb:
    :return:
    '''
    for temp_i in (flag_left, flag_mid, flag_right, flag_notlsb):
        assert temp_i in (0, 1)
    for temp_i in (in1, in2):
        assert isinstance(temp_i, int)
        assert temp_i >= 0

    if flag_mid == 1:
        out1 = in1
        out2 = in2
    elif (flag_left == 1) and (flag_notlsb == 1):
        out1 = 2*in1
        out2 = 2*in2
    elif flag_right == 1:
        out1 = in1 + in2
        out2 = in1 + in2
    else:
        out1 = in1 + in2
        out2 = in1

    return out1, out2


def generate_dymfns_with_segmentations(n, tuple_flags):
    '''
    输入数系长度以及故障标志元组，得到Dy-MFNS with Segmentation Numbers。

    返回两个元组，分别为q_i和p_i（p_i为数系值）。

    :param n:
    :param tuple_flags:
    :return:
    '''

    assert isinstance(n, int)
    assert n > 0
    assert isinstance(tuple_flags, tuple)
    assert len(tuple_flags) == n
    for temp_i in tuple_flags:
        assert temp_i in (0, 1)

    list_out1 = []
    list_out2 = []
    flag_notlsb = 0
    tuple_flags_extend = tuple_flags + (1,)

    ns_1 = 1
    ns_2 = 0

    for idx_main in range(0, n):
        if idx_main > 0:
            flag_left = tuple_flags_extend[idx_main - 1]
        else:
            assert idx_main == 0
            flag_left = 0
        flag_mid = tuple_flags_extend[idx_main]
        flag_right = tuple_flags_extend[idx_main + 1]

        ns_1, ns_2 = dymfns_adder(in1=ns_1, in2=ns_2, flag_left=flag_left,
                                  flag_mid=flag_mid, flag_right=flag_right, flag_notlsb=flag_notlsb)
        list_out1.append(ns_1)
        list_out2.append(ns_2)

        if (flag_mid == 0):
            flag_notlsb = 1

    return tuple(list_out1), tuple(list_out2)