import math

import DyMFNS.dymfns_codec as dymfns
# DyMFNS编解码
import cac_main.cac_xtalk_level as xtalk_calc
import cac_main.xtalk_level_simu as xtalk_simu
import cac_main.cac_overhead as cac_oh




# for i in range(3, 201):
#     flag_tuple = i * (0, )
#     datalen_afns = cac_oh.get_max_data_len_adaptivefns(codeword_len=i, flag_tuple=flag_tuple)
#     datalen_dymfns = cac_oh.get_max_data_len_dymfns(codeword_len=i, flag_tuple=flag_tuple)
#     print("{}\t{}\t{}".format(i, (i-datalen_afns)/datalen_afns, (i-datalen_dymfns)/datalen_dymfns))


# #故障位于中心处
# nf = 4
# assert nf >= 1
# for i in range(10, 101):
#     flag_list = i * [0]
#     f_idx_mid = math.ceil((i - 1) / 2)
#     flag_list[f_idx_mid] = 1
#     nnn = math.floor( (nf - 1) / 2 )
#     f_idx_nnn = 0
#     for iii in range(0, nnn):
#         f_idx_nnn = f_idx_nnn + 1
#         flag_list[f_idx_mid - f_idx_nnn] = 1
#         flag_list[f_idx_mid + f_idx_nnn] = 1
#     if nf % 2 == 0:
#         flag_list[f_idx_mid - f_idx_nnn - 1] = 1
#
#     flag_tuple = tuple(flag_list)
#     datalen_afns = cac_oh.get_max_data_len_adaptivefns(codeword_len=i, flag_tuple=flag_tuple)
#     datalen_dymfns = cac_oh.get_max_data_len_dymfns(codeword_len=i, flag_tuple=flag_tuple)
#     # print(flag_tuple)
#     # print("[{}] - {} - {}".format(i, datalen_afns, datalen_dymfns))
#     print("{}\t{}\t{}".format(i, datalen_afns, datalen_dymfns))


# # 故障位于中心处，相隔1位
# nf = 7
# assert nf >= 1
# for i in range(15, 101):
#     flag_list = i * [0]
#     f_idx_mid = math.ceil((i - 1) / 2)
#     flag_list[f_idx_mid] = 1
#     nnn = math.floor( (nf - 1) / 2 )
#     f_idx_nnn = 0
#     for iii in range(0, nnn):
#         f_idx_nnn = f_idx_nnn + 2
#         flag_list[f_idx_mid - f_idx_nnn] = 1
#         flag_list[f_idx_mid + f_idx_nnn] = 1
#     if nf % 2 == 0:
#         flag_list[f_idx_mid - f_idx_nnn - 2] = 1
#
#     flag_tuple = tuple(flag_list)
#     datalen_afns = cac_oh.get_max_data_len_adaptivefns(codeword_len=i, flag_tuple=flag_tuple)
#     datalen_dymfns = cac_oh.get_max_data_len_dymfns(codeword_len=i, flag_tuple=flag_tuple)
#     # print(flag_tuple)
#     # print("[{}] - {} - {}".format(i, datalen_afns, datalen_dymfns))
#     print("{}\t{}\t{}".format(i, datalen_afns, datalen_dymfns))



# 故障位于MSB处，相隔2位
nf = 15
assert nf >= 1
for i in range(45, 201):
    flag_list = i * [0]
    nnn = i - 3
    for iii in range(0, nf):
        flag_list[nnn] = 1
        nnn = nnn - 3



    flag_tuple = tuple(flag_list)
    datalen_afns = cac_oh.get_max_data_len_adaptivefns(codeword_len=i, flag_tuple=flag_tuple)
    datalen_dymfns = cac_oh.get_max_data_len_dymfns(codeword_len=i, flag_tuple=flag_tuple)
    # print(flag_tuple)
    # print("[{}] - {} - {}".format(i, datalen_afns, datalen_dymfns))
    print("{}\t{}\t{}".format(i, (i-datalen_afns)/datalen_afns, (i-datalen_dymfns)/datalen_dymfns))



# # 故障位于MSB处
# nf = 10
# assert nf >= 1
# for i in range(15, 201):
#     flag_list = i * [0]
#     nnn = i - 1
#     for iii in range(0, nf):
#         flag_list[nnn] = 1
#         nnn = nnn - 1
#
#
#
#     flag_tuple = tuple(flag_list)
#     datalen_afns = cac_oh.get_max_data_len_adaptivefns(codeword_len=i, flag_tuple=flag_tuple)
#     datalen_dymfns = cac_oh.get_max_data_len_dymfns(codeword_len=i, flag_tuple=flag_tuple)
#     # print(flag_tuple)
#     # print("[{}] - {} - {}".format(i, datalen_afns, datalen_dymfns))
#     print("{}\t{}\t{}".format(i, (i-datalen_afns)/datalen_afns, (i-datalen_dymfns)/datalen_dymfns))