# !/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2021/12/29
# @Author  : c

import cac_main.cac_validation
import AdaptiveFNS.adaptivefns_generation
import cac_main.cac_overhead
import cac_main.cac_reparability
import DyMFNS.dymfns_codec
import AdaptiveFNS.adaptivefns_codec

############################################################################
#（1）遍历故障情况，在每种故障情况下随机生成数据，测试DyMFNS能否避免101和010之间的跳变。

# cac_main.cac_validation.simu_dymfns_traverse_all_fault_cases(n=10, n_data=100, rule='4c-free')


############################################################################
#（2）获得对某个长度的数据进行编码后所需的的码字长度。

# for i in range(1, 50):
#     a = cac_main.cac_overhead.get_min_codeword_len_dymfns_0fault(data_len=i)
#     b = cac_main.cac_overhead.get_min_codeword_len_adaptivefns_0fault(data_len=i)
#     print(i, ' --> ', a, b)

############################################################################
#（3）获得某个长度的码字所能编码的数据长度（十进制转二进制后向下取整），可指定故障标志位。

# for i in range(1, 50):
#     a = cac_main.cac_overhead.get_max_data_len_dymfns(codeword_len=i, flag_tuple=i * (0,))
#     b = cac_main.cac_overhead.get_max_data_len_adaptivefns(codeword_len=i, flag_tuple=i * (0,))
#     print(i, ' <-- ', a, b)

############################################################################
# （4）计算在全局修复方案（原始数据全局路由+分组编解码）中的修复率。

# nf = 8 # 故障TSV数
# nrow = 3 # TSV行数
# ncol = 7 # TSV列数
# r1, sat1, all1 = cac_main.cac_reparability.get_reparability_mxn_globalsr(Codec_Class=DyMFNS.dymfns_codec.Codec_DyMFNS, n_f=nf, n_row_tsv=nrow, n_col_tsv=ncol, if_echo_details=False)
# r2, sat2, all2 = cac_main.cac_reparability.get_reparability_mxn_globalsr(Codec_Class=AdaptiveFNS.adaptivefns_codec.Codec_AdaptiveFNS, n_f=nf, n_row_tsv=nrow, n_col_tsv=ncol, if_echo_details=False)
# print("\n### Finished!")
# print('DyMFNS: reparability={}, sat={}, all={}'.format(r1, sat1, all1) )
# print('AdaptiveFNS: reparability={}, sat={}, all={}'.format(r2, sat2, all2))

############################################################################
# （5）计算在局部修复方案中的修复率。

# n_r = 0 # 冗余TSV数目
# for temp_data_len in range(3, 19): # 数据长度
#     min_cw_len_dymfns = cac_main.cac_overhead.get_min_codeword_len_dymfns_0fault(data_len=temp_data_len)
#     min_cw_len_adaptivefns = cac_main.cac_overhead.get_min_codeword_len_adaptivefns_0fault(data_len=temp_data_len)
#     print("\n####### DATA LEN: {}".format(temp_data_len))
#     print("####### 无故障下可传输数据长度： DyMFNS={}, AdaptiveFNS={}。在存在故障的情况下，若仍可以传输相同长度的数据，则视为可修复。".format(min_cw_len_dymfns, min_cw_len_adaptivefns))
#     for temp_j in range(1, 3): # 故障TSV数目
#         aa = cac_main.cac_reparability.get_reparabiilty_dymfns_localsr(n_f=temp_j, n_tsv_signal=min_cw_len_dymfns, n_tsv_redundant=n_r, echo_more=False)
#         bb = cac_main.cac_reparability.get_reparabiilty_adaptivefns_localsr(n_f=temp_j, n_tsv_signal=min_cw_len_adaptivefns, n_tsv_redundant=n_r, echo_more=False)
#         print("{}故障修复率： DyMFNS={}, AdaptiveFNS={}".format(temp_j, aa[0], bb[0]))







