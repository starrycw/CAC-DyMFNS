# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/21
# @Author  : c

import matplotlib.pyplot as plt
import DyMFNS.dymfns_codec
import AdaptiveFNS.adaptivefns_codec


def get_max_data_len_dymfns(codeword_len, flag_tuple):
    '''
    返回DyMFNS在码字长度为codeword_len，故障标志为flag_tuple的情况下，编码器可以接受的最大数据位宽。

    :param codeword_len:
    :param flag_tuple:
    :return:
    '''
    assert codeword_len > 0
    assert isinstance(codeword_len, int)
    assert isinstance(flag_tuple, tuple)
    assert len(flag_tuple) == codeword_len
    codec01 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=codeword_len, tuple_flags=flag_tuple)
    max_len = codec01.attr_get_max_data_len()
    return max_len

def get_max_data_len_adaptivefns(codeword_len, flag_tuple):
    '''
    返回AdaptiveFNS在码字长度为codeword_len，故障标志为flag_tuple的情况下，编码器可以接受的最大数据位宽。

    :param codeword_len:
    :param flag_tuple:
    :return:
    '''
    assert codeword_len > 0
    assert isinstance(codeword_len, int)
    assert isinstance(flag_tuple, tuple)
    assert len(flag_tuple) == codeword_len
    codec01 = AdaptiveFNS.adaptivefns_codec.Codec_AdaptiveFNS(n=codeword_len, tuple_flags=flag_tuple)
    max_len = codec01.attr_get_max_data_len()
    return max_len

def get_min_codeword_len_dymfns_0fault(data_len):
    '''
    返回DyMFNS在数据长度为data_len，且无故障的情况下，最短的码字长度。

    :param codeword_len:

    :return:
    '''
    assert data_len > 0
    assert isinstance(data_len, int)

    for temp_len in range(1, 10*data_len):
        codec01 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=temp_len, tuple_flags=temp_len*(0, ))
        max_len = codec01.attr_get_max_data_len()
        if max_len >= data_len:
            return temp_len
    assert False

def get_min_codeword_len_adaptivefns_0fault(data_len):
    '''
    返回AdaptiveMFNS在数据长度为data_len，且无故障的情况下，最短的码字长度。

    :param codeword_len:

    :return:
    '''
    assert data_len > 0
    assert isinstance(data_len, int)

    for temp_len in range(1, 10*data_len):
        codec01 = AdaptiveFNS.adaptivefns_codec.Codec_AdaptiveFNS(n=temp_len, tuple_flags=temp_len*(0, ))
        max_len = codec01.attr_get_max_data_len()
        if max_len >= data_len:
            return temp_len
    assert False

# for i in range(1, 50):
#     a = get_min_codeword_len_dymfns_0fault(data_len=i)
#     b = get_min_codeword_len_adaptivefns_0fault(data_len=i)
#     print(a,b)
# a = get_max_data_len_adaptivefns(15, (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0))
# b = get_max_data_len_dymfns(15, (0,0,0,0,0,0,1,0,0,0,0,1,0,0,0))
# print(a,b)


