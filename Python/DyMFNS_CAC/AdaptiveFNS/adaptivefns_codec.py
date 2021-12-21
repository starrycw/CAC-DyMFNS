# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/21
# @Author  : c

import copy
import math

import AdaptiveFNS.adaptivefns_generation


class Codec_AdaptiveFNS:
    def __init__(self, n, tuple_flags):
        '''
        n为码字长度。
        tuple_flags为故障标志位元组。

        :param n:
        :param tuple_flags:
        '''
        assert isinstance(n, int)
        assert n > 0
        self._n = n # 码字长度

        assert isinstance(tuple_flags, tuple)
        for temp_i in tuple_flags:
            assert temp_i in (0, 1)
        self._flags = copy.deepcopy(tuple_flags) # 故障标志位元组

        ns = AdaptiveFNS.adaptivefns_generation.generate_adaptivefns(n=n, tuple_flags=tuple_flags)
        self._ns = copy.deepcopy(ns)

        self._limitation_max_value = self._get_max_value_limitation()
        self._limitation_max_data_len = self._get_max_len_of_raw_data()

    def _get_max_value_limitation(self):
        # 可编码的最大值
        sum_value = 0
        for idx_temp in range(0, self.attr_get_n()):
            if self.attr_get_fault_flag_i(idx=idx_temp) == 0:
                sum_value = sum_value + self.attr_get_ns_i(idx=idx_temp)
            else:
                assert self.attr_get_fault_flag_i(idx=idx_temp) == 1

        return sum_value

    def _get_max_len_of_raw_data(self):
        max_value = self._get_max_value_limitation()
        max_len = math.floor( math.log2(max_value) )
        return max_len

    def attr_get_max_value(self):
        '''
        返回可编码的最大值。

        :return:
        '''
        return self._limitation_max_value

    def attr_get_max_data_len(self):
        '''
        返回允许输入数据的最大二进制长度

        :return:
        '''
        return self._limitation_max_data_len

    def attr_get_n(self):
        '''
        返回码字长度。

        :return:
        '''
        return self._n

    def attr_get_fault_flag_i(self, idx):
        '''
        返回索引为idx的TSV的故障标志位。

        :param idx:
        :return:
        '''
        return self._flags[idx]

    def attr_get_ns_i(self, idx):
        '''
        返回索引为idx的数系值。

        :param idx:
        :return:
        '''
        return self._ns[idx]


