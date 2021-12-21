# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/21
# @Author  : c

import random
import DyMFNS.dymfns_codec


def check_cac_transition(codeword1, codeword2, rule='4c-free'):
    '''
    输入相邻的两个码字，检查该跳变是否符合串扰抑制要求。

    :param codeword1:
    :param codeword2:
    :param rule:
    :return:
    '''
    assert len(codeword1) == len(codeword2)

    if rule == '4c-free':
        for idx in range(1, len(codeword1) - 1):
            diff1 = codeword1[idx - 1] - codeword2[idx - 1]
            diff2 = codeword1[idx] - codeword2[idx]
            diff3 = codeword1[idx + 1] - codeword2[idx + 1]
            if diff3 == diff1:
                if (diff2 == 1) and (diff1 == -1):
                    return False
                if (diff2 == -1) and (diff1 == 1):
                    return False
        return True
    else:
        assert False

def simu_dymfns_traverse_all_fault_cases(n, n_data, rule='4c-free'):
    '''
    指定TSV数目n，遍历所有的TSV故障情况（不包括全部故障的情况）。其中，每种故障情况下随机生成n_data个数值并编码为DyMFNS码字，检查码字之间的跳变是否符合要求。

    :param n: TSV数目
    :param n_data: 每种故障情况下生成随机数的数目

    :return:
    '''

    cnt_sat = 0
    cnt_all = 0
    vec_max = pow(2, n)
    for vec_value in range(0, vec_max-1):
        vec_bin = bin(vec_value)[2:]
        vec_tuple = tuple(str.zfill(vec_bin, n))
        # print(len(vec_tuple), pi_len, latch_len)
        assert len(vec_tuple) == n
        list_flags = []
        for temp_i in vec_tuple:
            if temp_i == '0':
                list_flags.append(0)
            elif temp_i == '1':
                list_flags.append(1)
            else:
                assert False

        tuple_flags = tuple(list_flags)
        codec01 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=n, tuple_flags=tuple_flags)
        codeword_last = codec01.attr_get_n()*(0, )

        raw_value_list = []
        decode_value_list = []
        for i in range(0, n_data):
            value_random = random.randint(0, codec01.attr_get_max_value())
            raw_value_list.append(value_random)
            codeword = codec01.encode(value=value_random)
            sat = check_cac_transition(codeword1=codeword, codeword2=codeword_last, rule=rule)
            cnt_all = cnt_all + 1
            if sat:
                cnt_sat = cnt_sat + 1
            assert sat
            v_decode = codec01.decode(codeword=codeword)
            decode_value_list.append(v_decode)
            assert v_decode == value_random
            codeword_last = codeword

        print("# flags={}, ns1={}, ns2={}, max value={}".format(vec_tuple,
                                                                codec01.attr_get_ns1_all(),
                                                                codec01.attr_get_ns2_all(),
                                                                codec01.attr_get_max_value()))
        print(">>> enc: {}".format(raw_value_list))
        print(">>> dec: {}".format(decode_value_list))

    print("# cnt_all={}, cnt_sat={}".format(cnt_all, cnt_sat))