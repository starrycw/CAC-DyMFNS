# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/21
# @Author  : c
import copy

import DyMFNS.dymfns_codec
import AdaptiveFNS.adaptivefns_codec
import cac_main.cac_overhead

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


def _reparability_dymfns(n_f, len_codeword, data_to_be_transmitted_len, echo_more=False):
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
        if echo_more:
            print("{}: {} ({})".format(current_flag_tuple, max_data_len, data_to_be_transmitted_len))
        if max_data_len >= data_to_be_transmitted_len:
            cnt_sat = cnt_sat + 1

        current_flag_tuple = _traverse_fault_case_get_next(n_f=n_f, current_tuple=current_flag_tuple)

    reparability = cnt_sat / cnt_all
    return reparability, cnt_sat, cnt_all

def _reparability_adaptivefns(n_f, len_codeword, data_to_be_transmitted_len, echo_more = False):
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
        if echo_more:
            print("{}: {} ({})".format(current_flag_tuple, max_data_len, data_to_be_transmitted_len))
        if max_data_len >= data_to_be_transmitted_len:
            cnt_sat = cnt_sat + 1

        current_flag_tuple = _traverse_fault_case_get_next(n_f=n_f, current_tuple=current_flag_tuple)

    reparability = cnt_sat / cnt_all
    return reparability, cnt_sat, cnt_all


def get_reparabiilty_dymfns_localsr(n_f, n_tsv_signal, n_tsv_redundant, echo_more = False):
    '''
    给定故障数目n_f，非冗余TSV数n_tsv_signal，以及冗余TSV数目n_tsv_redundant，获得修复率。
    编码为DyMFNS，修复方式为普通的局部修复（参照FNS局部修复论文）。

    :param n_f:
    :param n_tsv_signal:
    :param n_tsv_redundant:
    :return:
    '''

    assert isinstance(n_f, int)
    assert isinstance(n_tsv_signal, int)
    assert isinstance(n_tsv_redundant, int)
    assert n_f > 0
    assert n_tsv_signal > 0
    assert n_tsv_redundant >= 0

    n_tsv_all = n_tsv_signal + n_tsv_redundant
    codec02 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=n_tsv_signal, tuple_flags=n_tsv_signal * (0,))
    len_data_required = codec02.attr_get_max_data_len()
    return _reparability_dymfns(n_f=n_f, len_codeword=n_tsv_all, data_to_be_transmitted_len=len_data_required, echo_more=echo_more)


def get_reparabiilty_adaptivefns_localsr(n_f, n_tsv_signal, n_tsv_redundant, echo_more = False):
    '''
    给定故障数目n_f，非冗余TSV数n_tsv_signal，以及冗余TSV数目n_tsv_redundant，获得修复率。
    编码为AdaptiveFNS，修复方式为普通的局部修复（参照FNS局部修复论文）。

    :param n_f:
    :param n_tsv_signal:
    :param n_tsv_redundant:
    :return:
    '''

    assert isinstance(n_f, int)
    assert isinstance(n_tsv_signal, int)
    assert isinstance(n_tsv_redundant, int)
    assert n_f > 0
    assert n_tsv_signal > 0
    assert n_tsv_redundant >= 0

    n_tsv_all = n_tsv_signal + n_tsv_redundant
    codec02 = AdaptiveFNS.adaptivefns_codec.Codec_AdaptiveFNS(n=n_tsv_signal, tuple_flags=n_tsv_signal * (0,))
    len_data_required = codec02.attr_get_max_data_len()
    return _reparability_adaptivefns(n_f=n_f, len_codeword=n_tsv_all, data_to_be_transmitted_len=len_data_required, echo_more=echo_more)



def _traverse_fault_case_get_next_mxn(n_f, current_tuple, n_row, n_col):
    '''
    输入故障数量n_f，当前的故障标志元组current_tuple（ 例如((0, 0, 0, 0), (0, 0, 0, 0), (0, 1, 1, 1)) ），行数n_row，列数n_col，返回下一个故障标志列表。
    若已无更多列表，则返回None。
    其它细节参见_traverse_fault_case_get_next方法。

    :param n_f:
    :param current_tuple:
    :param n_row:
    :param n_col:
    :return:
    '''
    assert isinstance(n_f, int)
    assert isinstance(n_row, int)
    assert isinstance(n_col, int)
    assert isinstance(current_tuple, tuple)
    assert n_f > 0
    assert n_row > 1
    assert n_col > 1

    current_list_1row = [] # 一维化的列表
    cnt_f_current = 0

    assert len(current_tuple) == n_row
    for temp_i in current_tuple:
        assert isinstance(temp_i, tuple)
        assert len(temp_i) == n_col
        for temp_j in temp_i:
            assert temp_j in (0, 1)
            current_list_1row.append(temp_j)
            if temp_j == 1:
                cnt_f_current = cnt_f_current + 1

    assert cnt_f_current == n_f

    next_tuple_1row = _traverse_fault_case_get_next(n_f=n_f, current_tuple=tuple(current_list_1row))
    if next_tuple_1row is None:
        return None
    else:
        next_list = []
        temp_idx_row = 0
        temp_idx_col = 0
        for temp_ii in next_tuple_1row:
            if temp_idx_col == 0:
                temp_list_row_i = []

            temp_list_row_i.append(temp_ii)
            if temp_idx_col < n_col - 1:
                temp_idx_col = temp_idx_col + 1
            elif temp_idx_col == n_col - 1:
                temp_idx_col = 0
                temp_idx_row = temp_idx_row + 1
                next_list.append(tuple(temp_list_row_i))
            else:
                assert False

        next_tuple = tuple(next_list)
        assert len(next_tuple) == n_row
        for temp_i in next_tuple:
            assert len(temp_i) == n_col

        return next_tuple

def globalsr_get_data_port_flags_of_codec(tsv_flag_tuple, Codec_Class):
    '''
    获得全局修复方法的remapping mechanism中data port的可用标志位元组（每个元素对应一个group，元素仍为元组，包含该group内从MSB到LSB的port是否是Available的，若Available则为0）

    返回：标志位元组， 无故障情况下每个活动的group可传输数据位宽，无故障情况下活动的group数目

    :param tsv_flag_tuple:
    :param Codec_Class:
    :return:
    '''
    assert Codec_Class in (DyMFNS.dymfns_codec.Codec_DyMFNS, AdaptiveFNS.adaptivefns_codec.Codec_AdaptiveFNS)
    assert isinstance(tsv_flag_tuple, tuple)
    n_row_tsv = len(tsv_flag_tuple) # TSV阵列的行数
    n_col_tsv = len(tsv_flag_tuple[0]) # TSV阵列的列数
    for temp_i in tsv_flag_tuple:
        assert isinstance(temp_i, tuple)
        assert len(temp_i) == n_col_tsv

    codec00 = Codec_Class(n=n_col_tsv, tuple_flags=n_col_tsv*(0, ))
    n_col_dataport = codec00.attr_get_max_data_len() # 每个codec的dataport的位宽，即remapping示意图中的列数
    n_row_dataport = n_row_tsv # codec数目，即remapping示意图中的行数
    zerofaultcase_data_len_each_group = n_col_dataport - 1 # 无故障情况下，每组传输的数据长度
    zerofaultcase_occupied_group_n = n_row_dataport - 1 # 无故障情况下，用于传输数据的组数
    list_dataport_flag = []

    for row_i in tsv_flag_tuple:
        if 0 in row_i:
            codec_i = Codec_Class(n=n_col_tsv, tuple_flags=row_i)
            max_data_len_i = codec_i.attr_get_max_data_len()
        else:
            max_data_len_i = 0
        assert max_data_len_i <= n_col_dataport
        temp_list_i = []
        n_unavailable = n_col_dataport - max_data_len_i
        for temp_iii in range(0, n_unavailable):
            temp_list_i.append(1)
        for temp_iii in range(n_unavailable, n_col_dataport):
            temp_list_i.append(0)

        assert len(temp_list_i) == n_col_dataport
        list_dataport_flag.append(tuple(temp_list_i))

    return tuple(list_dataport_flag), zerofaultcase_data_len_each_group, zerofaultcase_occupied_group_n

def globalsr_remapping_if_sat(dataport_flag_tuple):
    '''
    输入一个dataport flag元组，检查remapping mechanism能否完成映射。

    :param dataport_flag_tuple:
    :return:
    '''
    assert isinstance(dataport_flag_tuple, tuple)
    n_row_dp = len(dataport_flag_tuple)
    n_col_dp = len(dataport_flag_tuple[0])

    for temp_idx_i in range(0, n_row_dp - 1): # 最后一行为冗余
        assert len(dataport_flag_tuple[temp_idx_i]) == n_col_dp
        for temp_idx_j in range(0, n_col_dp - 1): # 最后一列为冗余
            assert dataport_flag_tuple[temp_idx_i][temp_idx_j] in (0, 1)
            if dataport_flag_tuple[temp_idx_i][temp_idx_j] == 1:
                # 如果[temp_idx_i][temp_idx_j]位置不可用，则进行检查
                cnt_fault = 0 # 统计故障数
                cnt_redundant = n_row_dp + n_col_dp - 2 - temp_idx_i - temp_idx_j # 冗余数
                for temp_sub_i in range(temp_idx_i, n_row_dp):
                    for temp_sub_j in range(temp_idx_j, n_col_dp):
                        if (dataport_flag_tuple[temp_sub_i][temp_sub_j] == 1) and ( (temp_sub_i, temp_sub_j) != (n_row_dp, n_col_dp) ):
                            cnt_fault = cnt_fault + 1
                if cnt_fault > cnt_redundant:
                    return False
    return True


def get_reparability_mxn_globalsr(Codec_Class, n_f, n_row_tsv, n_col_tsv, if_echo_details = False):
    assert isinstance(n_f, int)
    assert isinstance(n_row_tsv, int)
    assert isinstance(n_col_tsv, int)
    assert 0 < n_f < (n_row_tsv * n_col_tsv)
    assert n_row_tsv > 1
    assert n_col_tsv > 1

    # get init fault flag tuple
    temp_init_tuple_1row = ( (n_row_tsv * n_col_tsv - n_f) * (0, ) ) + ( n_f * (1, ) )
    temp_init_list = []
    temp_idx_row = 0
    temp_idx_col = 0
    for temp_ii in temp_init_tuple_1row:
        if temp_idx_col == 0:
            temp_list_row_i = []

        temp_list_row_i.append(temp_ii)

        if temp_idx_col < n_col_tsv - 1:
            temp_idx_col = temp_idx_col + 1
        elif temp_idx_col == n_col_tsv - 1:
            temp_idx_col = 0
            temp_idx_row = temp_idx_row + 1
            temp_init_list.append(tuple(temp_list_row_i))
        else:
            assert False

    init_fault_tuple = tuple(temp_init_list)
    assert len(init_fault_tuple) == n_row_tsv
    for temp_i in init_fault_tuple:
        assert len(temp_i) == n_col_tsv

    # start
    print("Init fault tuple: {}".format(init_fault_tuple))
    current_f_tuple = copy.deepcopy(init_fault_tuple)
    cnt_case_all = 0
    cnt_case_sat = 0
    data_len_each_group_0fault_last = None
    n_group_enabled_0fault_last = None
    while current_f_tuple is not None:
        cnt_case_all = cnt_case_all + 1
        current_dp_flag_tuple, data_len_each_group_0fault, n_group_enabled_0fault = globalsr_get_data_port_flags_of_codec(tsv_flag_tuple=current_f_tuple, Codec_Class=Codec_Class)
        if_sat = globalsr_remapping_if_sat(dataport_flag_tuple=current_dp_flag_tuple)

        if data_len_each_group_0fault_last is not None:
            assert data_len_each_group_0fault == data_len_each_group_0fault_last
            assert n_group_enabled_0fault == n_group_enabled_0fault_last
        data_len_each_group_0fault_last = data_len_each_group_0fault
        n_group_enabled_0fault_last = n_group_enabled_0fault

        if if_sat is True:
            cnt_case_sat = cnt_case_sat + 1
            if if_echo_details:
                print("FLAGS: {}, NO. {} :".format(current_f_tuple, cnt_case_all))
                print("------->SAT! Remapping flags: {}".format(current_dp_flag_tuple))
        else:
            assert if_sat is False
            if if_echo_details:
                print("FLAGS: {}, NO. {} :".format(current_f_tuple, cnt_case_all))
                print("------->UNSAT! Remapping flags: {}".format(current_dp_flag_tuple))

        current_f_tuple = _traverse_fault_case_get_next_mxn(n_f=n_f, current_tuple=current_f_tuple, n_row=n_row_tsv, n_col=n_col_tsv)

    print("Done! \nData len in 0-fault case: {} groups x {} bits".format(n_group_enabled_0fault_last, data_len_each_group_0fault_last))
    print(cnt_case_sat / cnt_case_all, cnt_case_sat, cnt_case_all, '\n')
    return cnt_case_sat / cnt_case_all, cnt_case_sat, cnt_case_all


























