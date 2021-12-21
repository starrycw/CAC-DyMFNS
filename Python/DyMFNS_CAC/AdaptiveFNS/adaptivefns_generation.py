# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/21
# @Author  : c

def adaptivefns_adder(in1, in2, flag):
    '''
    6输入2输出的AdaptiveFNS加法器。

    in1, in2为输入值。
    flag为对应TSV的故障标志位，标志位为0代表无故障，为1代表有故障。

    :param in1:
    :param in2:
    :param flag:
    :return:
    '''
    assert flag in (0, 1)
    assert isinstance(in1, int)
    assert isinstance(in2, int)
    assert in1 >= 0
    assert in2 >= 0

    if flag == 0:
        out1 = in1 + in2
        out2 = in1
    elif flag == 1:
        out1 = in1
        out2 = in2
    else:
        assert False

    return out1, out2


def generate_adaptivefns(n, tuple_flags):
    '''
    输入数系长度以及故障标志元组，得到AdaptiveFNS。

    返回AdaptiveFNS元组。注意：第一个加法器的输入ns1作为数系值元组的第一个元素，因此返回的数系值元组长度比TSV数目多1个。

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

    ns_1 = 1
    ns_2 = 0
    list_out1.append(ns_1)
    list_out2.append(ns_2)

    for idx_main in range(0, n):
        flag_i = tuple_flags[idx_main]
        ns_1, ns_2 = adaptivefns_adder(in1=ns_1, in2=ns_2, flag=flag_i)
        list_out1.append(ns_1)
        list_out2.append(ns_2)

    assert len(list_out1) == n + 1

    return tuple(list_out1)