# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/21
# @Author  : c

import DyMFNS.dymfns_codec
import AdaptiveFNS.adaptivefns_codec

def _traverse_fault_case_get_next(n_f, current_tuple):
    '''
    用于遍历n故障的所有情况。遍历时，应当自行创建一个初始故障元组，其中所有故障位都位于元组的尾部。
    之后重复利用本函数获得新故障元组，直至所有故障位被移至首部。

    :param n_f:
    :param current_tuple:
    :return:
    '''
    # #########################
    # 例子：
    # current = (0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1)
    # nf = 5
    # save_tuple = []
    # cnt = 0
    # while current is not None:
    #     print(current)
    #     cnt = cnt + 1
    #     save_tuple.append(current)
    #     current = _traverse_fault_case_get_next(n_f=nf, current_tuple=current)
    #     if current in save_tuple:
    #         assert False
    # print(cnt)
    # #########################
    assert isinstance(current_tuple, tuple)
    temp_n_f = 0
    list_f_idx = []
    temp_idx = 0
    for temp_i in current_tuple:
        assert temp_i in (0, 1)
        if temp_i == 1:
            temp_n_f = temp_n_f + 1
            list_f_idx.append(temp_idx)
        temp_idx = temp_idx + 1
    assert temp_n_f == n_f
    assert temp_idx == len(current_tuple)

    # 对于n故障cases，若当前case的前n个位均故障，则这是最后一个case。
    is_last_case = True
    for temp_idx in range(0, n_f):
        if current_tuple[temp_idx] == 0:
            is_last_case = False

    # 若当前已是最后一个case，那么就返回None
    if is_last_case:
        return None

    else:
        # 获取首个可以直接向左移动一位的fault idx。
        idx_f_move = -1
        for idx_f_i in range(0, n_f):
            if (idx_f_move == -1) and (list_f_idx[idx_f_i] > idx_f_i):
                idx_f_move = idx_f_i

        # 将首个可以直接向左移动一位的fault左移一位，并将它前面的fault位置重置
        new_list_f_idx = []
        for temp_ii in range(0, n_f):
            if temp_ii < idx_f_move:
                new_list_f_idx.append(list_f_idx[idx_f_move] - idx_f_move + temp_ii - 1)
            elif temp_ii == idx_f_move:
                new_list_f_idx.append(list_f_idx[idx_f_move] - 1)
            else:
                new_list_f_idx.append(list_f_idx[temp_ii])

        new_list_flag = []
        for temp_ii in range(0, len(current_tuple)):
            if temp_ii in new_list_f_idx:
                new_list_flag.append(1)
            else:
                new_list_flag.append(0)

        return tuple(new_list_flag)


def get_reparability_dymfns(n_f, len_codeword, data_to_be_transmitted_len):
    '''
    获得dymfns的修复率。

    :param n_f: 故障数
    :param len_codeword: 码字长度，即TSV数目
    :param data_to_be_transmitted_len: 需要传输的数据长度。若某个case下可传输的数据长度不低于该值，则视为“可修复”。
    :return: reparability, cnt_sat, cnt_all
    '''

    assert isinstance(n_f, int)
    assert isinstance(len_codeword, int)
    assert isinstance(data_to_be_transmitted_len, int)
    assert n_f > 0
    assert len_codeword > n_f
    assert data_to_be_transmitted_len > 0

    temp_flag_list_a = len_codeword*[0]
    for temp_i in range(0, n_f):
        temp_flag_list_a[-1-temp_i] = 1
    current_flag_tuple = tuple(temp_flag_list_a)

    cnt_all = 0
    cnt_sat = 0

    while current_flag_tuple is not None:
        cnt_all = cnt_all + 1
        codec01 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=len_codeword, tuple_flags=current_flag_tuple)
        max_data_len = codec01.attr_get_max_data_len()
        print("{}: {}".format(current_flag_tuple, max_data_len))
        if max_data_len >= data_to_be_transmitted_len:
            cnt_sat = cnt_sat + 1

        current_flag_tuple = _traverse_fault_case_get_next(n_f=n_f, current_tuple=current_flag_tuple)

    reparability = cnt_sat / cnt_all
    return reparability, cnt_sat, cnt_all

def get_reparability_adaptivefns(n_f, len_codeword, data_to_be_transmitted_len):
    '''
    获得AdaptiveFNS的修复率。

    :param n_f: 故障数
    :param len_codeword: 码字长度，即TSV数目
    :param data_to_be_transmitted_len: 需要传输的数据长度。若某个case下可传输的数据长度不低于该值，则视为“可修复”。
    :return: reparability, cnt_sat, cnt_all
    '''

    assert isinstance(n_f, int)
    assert isinstance(len_codeword, int)
    assert isinstance(data_to_be_transmitted_len, int)
    assert n_f > 0
    assert len_codeword > n_f
    assert data_to_be_transmitted_len > 0

    temp_flag_list_a = len_codeword*[0]
    for temp_i in range(0, n_f):
        temp_flag_list_a[-1-temp_i] = 1
    current_flag_tuple = tuple(temp_flag_list_a)

    cnt_all = 0
    cnt_sat = 0

    while current_flag_tuple is not None:
        cnt_all = cnt_all + 1
        codec01 = AdaptiveFNS.adaptivefns_codec.Codec_AdaptiveFNS(n=len_codeword, tuple_flags=current_flag_tuple)
        max_data_len = codec01.attr_get_max_data_len()
        print("{}: {}".format(current_flag_tuple, max_data_len))
        if max_data_len >= data_to_be_transmitted_len:
            cnt_sat = cnt_sat + 1

        current_flag_tuple = _traverse_fault_case_get_next(n_f=n_f, current_tuple=current_flag_tuple)

    reparability = cnt_sat / cnt_all
    return reparability, cnt_sat, cnt_all



nf = 3
n_redundant = 1
len_cw_all = 15
len_cw_without_redundant = len_cw_all - n_redundant
codec02 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=len_cw_without_redundant, tuple_flags=len_cw_without_redundant*(0, ))
len_data_required = codec02.attr_get_max_data_len()
print(get_reparability_dymfns(n_f=nf, len_codeword=len_cw_all, data_to_be_transmitted_len=len_data_required))
print(len_data_required)






