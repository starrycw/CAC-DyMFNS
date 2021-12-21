# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/15
# @Author  : c

import copy
import math

import DyMFNS.dymfns_generation


class Codec_DyMFNS:
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

        ns1, ns2 = DyMFNS.dymfns_generation.generate_dymfns_with_segmentations(n=n, tuple_flags=tuple_flags)
        self._ns1 = copy.deepcopy(ns1) # q_i
        self._ns2 = copy.deepcopy(ns2) # p_i

        self._limitation_max_value = self._get_max_value_limitation()
        self._limitation_max_data_len = self._get_max_len_of_raw_data()

    def _get_max_value_limitation(self):
        # 可编码的最大值
        sum_value = 0
        for idx_temp in range(0, self.attr_get_n()):
            if self.attr_get_fault_flag_i(idx=idx_temp) == 0:
                sum_value = sum_value + self.attr_get_ns2_i(idx=idx_temp)
            else:
                assert self.attr_get_fault_flag_i(idx=idx_temp) == 1
        assert sum_value == 2*self.attr_get_ns2_i(idx=-1) - 1
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

    def attr_get_ns1_i(self, idx):
        '''
        返回q_{idx}。

        :param idx:
        :return:
        '''
        return self._ns1[idx]

    def attr_get_ns2_i(self, idx):
        '''
        返回p_{idx}。

        :param idx:
        :return:
        '''
        return self._ns2[idx]

    def attr_get_ns1_all(self):
        '''
        返回q_i元组。

        :return:
        '''
        return copy.deepcopy(self._ns1)

    def attr_get_ns2_all(self):
        '''
        返回p_i元组。

        :return:
        '''
        return copy.deepcopy(self._ns2)

    def encode(self, value):
        '''
        编码一个值（value），返回码字构成的元组，其中元组内idx=0对应的是码字的MSB。

        :param value:
        :return:
        '''
        assert isinstance(value, int)
        assert 0 <= value <= self.attr_get_max_value()
        codeword_msb_to_lsb = []

        for idx_main in range(self.attr_get_n()-1, -1, -1):
            # 若这一位故障标志为1，则编码为0
            if self.attr_get_fault_flag_i(idx=idx_main) == 1:
                bit = 0
            # 若剩余值大于等于ns1，那么编码为1
            elif value >= self.attr_get_ns1_i(idx=idx_main):
                bit = 1
            # 若剩余值大于等于ns2，那么编码为0
            elif value < self.attr_get_ns2_i(idx=idx_main):
                bit = 0
            # 若剩余值在ns1和ns2之间，编码为上一位
            else:
                bit = codeword_msb_to_lsb[-1]

            # 若编码为1，则剩余值减去该位数系值
            if bit == 1:
                value = value - self.attr_get_ns2_i(idx=idx_main)

            codeword_msb_to_lsb.append(bit)
        assert len(codeword_msb_to_lsb) == self.attr_get_n()
        assert value == 0 # 应当无余数残留
        return tuple(codeword_msb_to_lsb)

    def decode(self, codeword):
        '''
        解码一个码字（codeword, 由左到右应当是msb到lsb），返回码字代表的数值。

        :param codeword:
        :return:
        '''
        assert isinstance(codeword, tuple) or isinstance(codeword, list)
        assert len(codeword) == self.attr_get_n()
        sum_value = 0

        for idx_main in range(0, self.attr_get_n()):
            c_i = codeword[idx_main]
            assert c_i in (0, 1)
            d_i = self.attr_get_ns2_i( idx=(self.attr_get_n() - idx_main - 1) )
            sum_value = c_i * d_i + sum_value

        return sum_value