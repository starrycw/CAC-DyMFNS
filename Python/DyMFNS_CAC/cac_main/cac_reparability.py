# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/21
# @Author  : c

def _traverse_fault_case_get_next(n_f, current_tuple):
    '''
    用于遍历n故障的所有情况。遍历时，应当自行创建一个初始故障元组，其中所有故障位都位于元组的尾部。
    之后重复利用本函数获得新故障元组，直至所有故障位被移至首部。

    :param n_f:
    :param current_tuple:
    :return:
    '''
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
        #todo:...




