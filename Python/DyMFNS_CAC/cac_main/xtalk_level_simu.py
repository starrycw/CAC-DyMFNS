# -*- coding: utf-8 -*-
# @Time    : 2022/05/15
# @Author  : c
import copy
import random
import DyMFNS.dymfns_codec
import cac_main.cac_xtalk_level

def generate_flags_random(n, nf_config):
    '''
    随机生成故障标志位元组。n为长度。nf_config为一个元组，元素为表示故障数目的整数。
    生成随机故障标志位时，首先从nf_config中随机选择故障数目，然后随机分配故障的位置。
    :param n: int
    :param nf_config: tuple
    :return:
    '''

    nf = random.choice(nf_config)
    assert isinstance(nf, int)
    assert 0 <= nf <= n
    list_temp = list(range(0, n))
    flag_list = n * [0]
    random_idx = random.sample(list_temp, nf)
    if len(random_idx) > 0:
        for i in random_idx:
            flag_list[i] = 1
    return tuple(flag_list)



# 9X9阵列 row by row 100000
def simu_9X9_dymfns_rowbyrow_faultfree(n_gendata = 100000):
    Xtalk_simu = cac_main.cac_xtalk_level.Array_Xtalk_Calculator(n_row=9, n_col=9)
    Codec01 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=9, tuple_flags=(0, 0, 0, 0, 0, 0, 0, 0, 0), codeword_mode="lsb to msb")
    datain_lenmax = Codec01.attr_get_max_data_len()
    datain_max = (2 ** datain_lenmax) - 1
    cw_tuple_old = 9 * ( (0, 0, 0, 0, 0, 0, 0, 0, 0), )
    flags_shield = 9 * ( (0, 0, 0, 0, 0, 0, 0, 0, 0), )
    cnt_xtalk = {0: 0,
                 0.25: 0,
                 0.5: 0,
                 0.75: 0,
                 1: 0,
                 1.25: 0,
                 1.5: 0,
                 1.75: 0,
                 2: 0,
                 2.25: 0,
                 2.5: 0,
                 2.75: 0,
                 3: 0,
                 3.25: 0,
                 3.5: 0,
                 3.75: 0,
                 4: 0,
                 4.25: 0,
                 4.5: 0,
                 4.75: 0,
                 5: 0,
                 5.25: 0,
                 5.5: 0,
                 5.75: 0,
                 6: 0,
                 6.25: 0,
                 6.5: 0,
                 6.75: 0,
                 7: 0,
                 7.25: 0,
                 7.5: 0,
                 7.75: 0,
                 8: 0,
                 8.25: 0,
                 8.5: 0,
                 8.75: 0,
                 9: 0,
                 9.25: 0,
                 9.5: 0,
                 9.75: 0,
                 10: 0,
                 'None': 0}

    for round_i in range(0, n_gendata):
        cw_list = []
        for row_i in range(0, 9):
            datain = random.randint(0, datain_max)
            cw_row = Codec01.encode(value=datain)
            cw_list.append(tuple(cw_row))
            cw_tuple_new = tuple(cw_list)
        result_xtalk = Xtalk_simu.calc_xtalk_level(array_cw01=cw_tuple_old, array_cw02=cw_tuple_new, array_shield=flags_shield)
        result_dict = Xtalk_simu.xtalk_level_cnt(cw_xtalk_tuple=result_xtalk)
        for iii in (0, 0.25, 0.5, 0.75,
                                1, 1.25, 1.5, 1.75,
                                2, 2.25, 2.5, 2.75,
                                3, 3.25, 3.5, 3.75,
                                4, 4.25, 4.5, 4.75,
                                5, 5.25, 5.5, 5.75,
                                6, 6.25, 6.5, 6.75,
                                7, 7.25, 7.5, 7.75,
                                8, 8.25, 8.5, 8.75,
                                9, 9.25, 9.5, 9.75,
                                10, 'None'):
            cnt_xtalk[iii] = cnt_xtalk[iii] + result_dict[iii]
        cw_tuple_old = copy.deepcopy(cw_tuple_new)
    return copy.deepcopy(cnt_xtalk)

# 9X9阵列 row by row 100000
# 100个case，每个case中每行随机0~5个故障
def simu_9X9_dymfns_rowbyrow_randomfault01(n_gendata=1000, n_cases=100):
    Xtalk_simu = cac_main.cac_xtalk_level.Array_Xtalk_Calculator(n_row=9, n_col=9)
    cnt_xtalk = {0: 0,
                 0.25: 0,
                 0.5: 0,
                 0.75: 0,
                 1: 0,
                 1.25: 0,
                 1.5: 0,
                 1.75: 0,
                 2: 0,
                 2.25: 0,
                 2.5: 0,
                 2.75: 0,
                 3: 0,
                 3.25: 0,
                 3.5: 0,
                 3.75: 0,
                 4: 0,
                 4.25: 0,
                 4.5: 0,
                 4.75: 0,
                 5: 0,
                 5.25: 0,
                 5.5: 0,
                 5.75: 0,
                 6: 0,
                 6.25: 0,
                 6.5: 0,
                 6.75: 0,
                 7: 0,
                 7.25: 0,
                 7.5: 0,
                 7.75: 0,
                 8: 0,
                 8.25: 0,
                 8.5: 0,
                 8.75: 0,
                 9: 0,
                 9.25: 0,
                 9.5: 0,
                 9.75: 0,
                 10: 0,
                 'None': 0}


    for case_i in range(0, n_cases):
        print("Case {}...".format(case_i))
        nf_config = (0, 1, 2, 3, 4, 5)
        Codec_list = []
        datain_max_list = []
        flag_shield_list = []
        for row_idx in range(0, 9):
            flags_row_i = generate_flags_random(n=9, nf_config=nf_config)
            # print(flags_row_i)
            Codec_row_i = DyMFNS.dymfns_codec.Codec_DyMFNS(n=9, tuple_flags=flags_row_i, codeword_mode="lsb to msb")
            datain_lenmax_row_i = Codec_row_i.attr_get_max_data_len()
            datain_max_row_i = (2 ** datain_lenmax_row_i) - 1
            Codec_list.append(Codec_row_i)
            datain_max_list.append(datain_max_row_i)
            flag_shield_list.append(tuple(flags_row_i))

        cw_tuple_old = 9 * ( (0, 0, 0, 0, 0, 0, 0, 0, 0), )
        flags_shield = tuple(flag_shield_list)
        for round_i in range(0, n_gendata):
            cw_list = []
            for row_i in range(0, 9):
                datain = random.randint(0, datain_max_list[row_i])
                cw_row = Codec_list[row_i].encode(value=datain)
                cw_list.append(tuple(cw_row))
                cw_tuple_new = tuple(cw_list)
                # print(cw_tuple_old)
                # print(cw_tuple_new)
            result_xtalk = Xtalk_simu.calc_xtalk_level(array_cw01=cw_tuple_old, array_cw02=cw_tuple_new,
                                                       array_shield=flags_shield)
            result_dict = Xtalk_simu.xtalk_level_cnt(cw_xtalk_tuple=result_xtalk)
            for iii in (0, 0.25, 0.5, 0.75,
                        1, 1.25, 1.5, 1.75,
                        2, 2.25, 2.5, 2.75,
                        3, 3.25, 3.5, 3.75,
                        4, 4.25, 4.5, 4.75,
                        5, 5.25, 5.5, 5.75,
                        6, 6.25, 6.5, 6.75,
                        7, 7.25, 7.5, 7.75,
                        8, 8.25, 8.5, 8.75,
                        9, 9.25, 9.5, 9.75,
                        10, 'None'):
                cnt_xtalk[iii] = cnt_xtalk[iii] + result_dict[iii]
            if cnt_xtalk[8.25] > 0:
                print("*******")
                print("Shielding Flags:{}".format(flags_shield))
                print("CW01: {}".format(cw_tuple_old))
                print("CW02: {}".format(cw_tuple_new))
                assert False
            cw_tuple_old = copy.deepcopy(cw_tuple_new)

    return copy.deepcopy(cnt_xtalk)


# 整数转为二进制元组
def int_to_bin_tuple(value, n_len):
    bin_list = [0 for i in range(n_len)]
    i = -1
    while value != 0:
        bin_list[i] = value % 2
        value = value >> 1
        i = i - 1
    return tuple(bin_list)

# 9X9阵列 未编码随机数 100000
def simu_9X9_uncoded_faultfree(n_datain=100000):
    Xtalk_simu = cac_main.cac_xtalk_level.Array_Xtalk_Calculator(n_row=9, n_col=9)
    datain_lenmax = 9
    datain_max = (2 ** datain_lenmax) - 1
    cw_tuple_old = 9 * ( (0, 0, 0, 0, 0, 0, 0, 0, 0), )
    flags_shield = 9 * ( (0, 0, 0, 0, 0, 0, 0, 0, 0), )
    cnt_xtalk = {0: 0,
                 0.25: 0,
                 0.5: 0,
                 0.75: 0,
                 1: 0,
                 1.25: 0,
                 1.5: 0,
                 1.75: 0,
                 2: 0,
                 2.25: 0,
                 2.5: 0,
                 2.75: 0,
                 3: 0,
                 3.25: 0,
                 3.5: 0,
                 3.75: 0,
                 4: 0,
                 4.25: 0,
                 4.5: 0,
                 4.75: 0,
                 5: 0,
                 5.25: 0,
                 5.5: 0,
                 5.75: 0,
                 6: 0,
                 6.25: 0,
                 6.5: 0,
                 6.75: 0,
                 7: 0,
                 7.25: 0,
                 7.5: 0,
                 7.75: 0,
                 8: 0,
                 8.25: 0,
                 8.5: 0,
                 8.75: 0,
                 9: 0,
                 9.25: 0,
                 9.5: 0,
                 9.75: 0,
                 10: 0,
                 'None': 0}

    for round_i in range(0, n_datain):
        cw_list = []
        for row_i in range(0, 9):
            datain = random.randint(0, datain_max)
            cw_row = int_to_bin_tuple(value=datain, n_len=9)
            cw_list.append(tuple(cw_row))
            cw_tuple_new = tuple(cw_list)
        result_xtalk = Xtalk_simu.calc_xtalk_level(array_cw01=cw_tuple_old, array_cw02=cw_tuple_new, array_shield=flags_shield)
        result_dict = Xtalk_simu.xtalk_level_cnt(cw_xtalk_tuple=result_xtalk)
        for iii in (0, 0.25, 0.5, 0.75,
                                1, 1.25, 1.5, 1.75,
                                2, 2.25, 2.5, 2.75,
                                3, 3.25, 3.5, 3.75,
                                4, 4.25, 4.5, 4.75,
                                5, 5.25, 5.5, 5.75,
                                6, 6.25, 6.5, 6.75,
                                7, 7.25, 7.5, 7.75,
                                8, 8.25, 8.5, 8.75,
                                9, 9.25, 9.5, 9.75,
                                10, 'None'):
            cnt_xtalk[iii] = cnt_xtalk[iii] + result_dict[iii]
        cw_tuple_old = copy.deepcopy(cw_tuple_new)
    return copy.deepcopy(cnt_xtalk)

# 3x9阵列，包含3个3x3编码组，每组包括2个屏蔽线
def simu_3X9_dymfns_3x3group_randomfault01(n_datain=1000, n_cases=100):
    Xtalk_simu = cac_main.cac_xtalk_level.Array_Xtalk_Calculator(n_row=3, n_col=9)
    cnt_xtalk = {0: 0,
                 0.25: 0,
                 0.5: 0,
                 0.75: 0,
                 1: 0,
                 1.25: 0,
                 1.5: 0,
                 1.75: 0,
                 2: 0,
                 2.25: 0,
                 2.5: 0,
                 2.75: 0,
                 3: 0,
                 3.25: 0,
                 3.5: 0,
                 3.75: 0,
                 4: 0,
                 4.25: 0,
                 4.5: 0,
                 4.75: 0,
                 5: 0,
                 5.25: 0,
                 5.5: 0,
                 5.75: 0,
                 6: 0,
                 6.25: 0,
                 6.5: 0,
                 6.75: 0,
                 7: 0,
                 7.25: 0,
                 7.5: 0,
                 7.75: 0,
                 8: 0,
                 8.25: 0,
                 8.5: 0,
                 8.75: 0,
                 9: 0,
                 9.25: 0,
                 9.5: 0,
                 9.75: 0,
                 10: 0,
                 'None': 0}

    for case_i in range(0, n_cases):
        print("Case {}...".format(case_i))
        nf_config = (0, 1, 2, 3, 4, 5)
        Codec_list = []
        datain_max_list = []
        flag_shield_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
                            [0, 0, 0, 0, 0, 0, 0, 0, 0]]
        for group_idx in range(0, 3):
            flags_group_i = generate_flags_random(n=7, nf_config=nf_config)
            Codec_group_i = DyMFNS.dymfns_codec.Codec_DyMFNS(n=7, tuple_flags=flags_group_i, codeword_mode='lsb to msb')
            datain_len_group_i = Codec_group_i.attr_get_max_data_len()
            datain_max_group_i = (2 ** datain_len_group_i) - 1
            Codec_list.append(Codec_group_i)
            datain_max_list.append(datain_max_group_i)
            flag_shield_list[0][3 * group_idx] = flags_group_i[0]
            flag_shield_list[1][3 * group_idx] = 1
            flag_shield_list[2][3 * group_idx] = flags_group_i[1]
            flag_shield_list[2][3 * group_idx + 1] = flags_group_i[2]
            flag_shield_list[1][3 * group_idx + 1] = flags_group_i[3]
            flag_shield_list[0][3 * group_idx + 1] = flags_group_i[4]
            flag_shield_list[0][3 * group_idx + 2] = flags_group_i[5]
            flag_shield_list[1][3 * group_idx + 2] = 1
            flag_shield_list[2][3 * group_idx + 2] = flags_group_i[6]

        cw_tuple_old = 3 * ((0, 0, 0, 0, 0, 0, 0, 0, 0), )
        flag_shield_list_temp=[tuple(flag_shield_list[0]), tuple(flag_shield_list[1]), tuple(flag_shield_list[2])]
        flags_shield = tuple(flag_shield_list_temp)

        for round_i in range(0, n_datain):
            cw_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0]]

            for group_idx in range(0, 3):
                datain = random.randint(0, datain_max_list[group_idx])
                cw_group = Codec_list[group_idx].encode(value=datain)
                cw_list[0][3 * group_idx] = cw_group[0]
                cw_list[1][3 * group_idx] = 0
                cw_list[2][3 * group_idx] = cw_group[1]
                cw_list[2][3 * group_idx + 1] = cw_group[2]
                cw_list[1][3 * group_idx + 1] = cw_group[3]
                cw_list[0][3 * group_idx + 1] = cw_group[4]
                cw_list[0][3 * group_idx + 2] = cw_group[5]
                cw_list[1][3 * group_idx + 2] = 0
                cw_list[2][3 * group_idx + 2] = cw_group[6]
            cw_tuple_new = (tuple(cw_list[0]), tuple(cw_list[1]), tuple(cw_list[2]))

            result_xtalk = Xtalk_simu.calc_xtalk_level(array_cw01=cw_tuple_old, array_cw02=cw_tuple_new,
                                                       array_shield=flags_shield)
            result_dict = Xtalk_simu.xtalk_level_cnt(cw_xtalk_tuple=result_xtalk)
            for iii in (0, 0.25, 0.5, 0.75,
                        1, 1.25, 1.5, 1.75,
                        2, 2.25, 2.5, 2.75,
                        3, 3.25, 3.5, 3.75,
                        4, 4.25, 4.5, 4.75,
                        5, 5.25, 5.5, 5.75,
                        6, 6.25, 6.5, 6.75,
                        7, 7.25, 7.5, 7.75,
                        8, 8.25, 8.5, 8.75,
                        9, 9.25, 9.5, 9.75,
                        10, 'None'):
                cnt_xtalk[iii] = cnt_xtalk[iii] + result_dict[iii]
            if cnt_xtalk[8.25] > 0:
                print("*******")
                print("Shielding Flags:{}".format(flags_shield))
                print("CW01: {}".format(cw_tuple_old))
                print("CW02: {}".format(cw_tuple_new))
                assert False
            cw_tuple_old = copy.deepcopy(cw_tuple_new)

    return copy.deepcopy(cnt_xtalk)

# 3x9阵列，包含3个3x3编码组，每组包括2个屏蔽线
def simu_3X9_dymfns_3x3group_faultfree(n_datain=100000):
    Xtalk_simu = cac_main.cac_xtalk_level.Array_Xtalk_Calculator(n_row=3, n_col=9)
    cnt_xtalk = {0: 0,
                 0.25: 0,
                 0.5: 0,
                 0.75: 0,
                 1: 0,
                 1.25: 0,
                 1.5: 0,
                 1.75: 0,
                 2: 0,
                 2.25: 0,
                 2.5: 0,
                 2.75: 0,
                 3: 0,
                 3.25: 0,
                 3.5: 0,
                 3.75: 0,
                 4: 0,
                 4.25: 0,
                 4.5: 0,
                 4.75: 0,
                 5: 0,
                 5.25: 0,
                 5.5: 0,
                 5.75: 0,
                 6: 0,
                 6.25: 0,
                 6.5: 0,
                 6.75: 0,
                 7: 0,
                 7.25: 0,
                 7.5: 0,
                 7.75: 0,
                 8: 0,
                 8.25: 0,
                 8.5: 0,
                 8.75: 0,
                 9: 0,
                 9.25: 0,
                 9.5: 0,
                 9.75: 0,
                 10: 0,
                 'None': 0}

    for case_i in range(0, 1):
        print("Case {}...".format(case_i))
        nf_config = (0, )
        Codec_list = []
        datain_max_list = []
        flag_shield_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
                            [0, 0, 0, 0, 0, 0, 0, 0, 0],
                            [0, 0, 0, 0, 0, 0, 0, 0, 0]]
        for group_idx in range(0, 3):
            flags_group_i = generate_flags_random(n=7, nf_config=nf_config)
            Codec_group_i = DyMFNS.dymfns_codec.Codec_DyMFNS(n=7, tuple_flags=flags_group_i, codeword_mode='lsb to msb')
            datain_len_group_i = Codec_group_i.attr_get_max_data_len()
            datain_max_group_i = (2 ** datain_len_group_i) - 1
            Codec_list.append(Codec_group_i)
            datain_max_list.append(datain_max_group_i)
            flag_shield_list[0][3 * group_idx] = flags_group_i[0]
            flag_shield_list[1][3 * group_idx] = 1
            flag_shield_list[2][3 * group_idx] = flags_group_i[1]
            flag_shield_list[2][3 * group_idx + 1] = flags_group_i[2]
            flag_shield_list[1][3 * group_idx + 1] = flags_group_i[3]
            flag_shield_list[0][3 * group_idx + 1] = flags_group_i[4]
            flag_shield_list[0][3 * group_idx + 2] = flags_group_i[5]
            flag_shield_list[1][3 * group_idx + 2] = 1
            flag_shield_list[2][3 * group_idx + 2] = flags_group_i[6]

        cw_tuple_old = 3 * ((0, 0, 0, 0, 0, 0, 0, 0, 0), )
        flag_shield_list_temp=[tuple(flag_shield_list[0]), tuple(flag_shield_list[1]), tuple(flag_shield_list[2])]
        flags_shield = tuple(flag_shield_list_temp)

        for round_i in range(0, n_datain):
            cw_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0]]

            for group_idx in range(0, 3):
                datain = random.randint(0, datain_max_list[group_idx])
                cw_group = Codec_list[group_idx].encode(value=datain)
                cw_list[0][3 * group_idx] = cw_group[0]
                cw_list[1][3 * group_idx] = 0
                cw_list[2][3 * group_idx] = cw_group[1]
                cw_list[2][3 * group_idx + 1] = cw_group[2]
                cw_list[1][3 * group_idx + 1] = cw_group[3]
                cw_list[0][3 * group_idx + 1] = cw_group[4]
                cw_list[0][3 * group_idx + 2] = cw_group[5]
                cw_list[1][3 * group_idx + 2] = 0
                cw_list[2][3 * group_idx + 2] = cw_group[6]
            cw_tuple_new = (tuple(cw_list[0]), tuple(cw_list[1]), tuple(cw_list[2]))

            result_xtalk = Xtalk_simu.calc_xtalk_level(array_cw01=cw_tuple_old, array_cw02=cw_tuple_new,
                                                       array_shield=flags_shield)
            result_dict = Xtalk_simu.xtalk_level_cnt(cw_xtalk_tuple=result_xtalk)
            for iii in (0, 0.25, 0.5, 0.75,
                        1, 1.25, 1.5, 1.75,
                        2, 2.25, 2.5, 2.75,
                        3, 3.25, 3.5, 3.75,
                        4, 4.25, 4.5, 4.75,
                        5, 5.25, 5.5, 5.75,
                        6, 6.25, 6.5, 6.75,
                        7, 7.25, 7.5, 7.75,
                        8, 8.25, 8.5, 8.75,
                        9, 9.25, 9.5, 9.75,
                        10, 'None'):
                cnt_xtalk[iii] = cnt_xtalk[iii] + result_dict[iii]
            if cnt_xtalk[8.25] > 0:
                print("*******")
                print("Shielding Flags:{}".format(flags_shield))
                print("CW01: {}".format(cw_tuple_old))
                print("CW02: {}".format(cw_tuple_new))
                assert False
            cw_tuple_old = copy.deepcopy(cw_tuple_new)

    return copy.deepcopy(cnt_xtalk)

# 3x9阵列，包含3个3x3编码组，每组包括2个屏蔽线
def simu_3X9_uncoded_3x3group_faultfree(n_datain=100000):
    Xtalk_simu = cac_main.cac_xtalk_level.Array_Xtalk_Calculator(n_row=3, n_col=9)
    cnt_xtalk = {0: 0,
                 0.25: 0,
                 0.5: 0,
                 0.75: 0,
                 1: 0,
                 1.25: 0,
                 1.5: 0,
                 1.75: 0,
                 2: 0,
                 2.25: 0,
                 2.5: 0,
                 2.75: 0,
                 3: 0,
                 3.25: 0,
                 3.5: 0,
                 3.75: 0,
                 4: 0,
                 4.25: 0,
                 4.5: 0,
                 4.75: 0,
                 5: 0,
                 5.25: 0,
                 5.5: 0,
                 5.75: 0,
                 6: 0,
                 6.25: 0,
                 6.5: 0,
                 6.75: 0,
                 7: 0,
                 7.25: 0,
                 7.5: 0,
                 7.75: 0,
                 8: 0,
                 8.25: 0,
                 8.5: 0,
                 8.75: 0,
                 9: 0,
                 9.25: 0,
                 9.5: 0,
                 9.75: 0,
                 10: 0,
                 'None': 0}

    for case_i in range(0, 1):
        print("Case {}...".format(case_i))

        cw_tuple_old = 3 * ((0, 0, 0, 0, 0, 0, 0, 0, 0), )
        flags_shield = ((0, 0, 0, 0, 0, 0, 0, 0, 0),
                        (1, 0, 1, 1, 0, 1, 1, 0, 1),
                        (0, 0, 0, 0, 0, 0, 0, 0, 0))

        for round_i in range(0, n_datain):
            cw_list = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0]]

            for group_idx in range(0, 3):
                datain = random.randint(0, (2 ** 7 - 1))
                cw_group = int_to_bin_tuple(value=datain, n_len=7)
                cw_list[0][3 * group_idx] = cw_group[0]
                cw_list[1][3 * group_idx] = 0
                cw_list[2][3 * group_idx] = cw_group[1]
                cw_list[2][3 * group_idx + 1] = cw_group[2]
                cw_list[1][3 * group_idx + 1] = cw_group[3]
                cw_list[0][3 * group_idx + 1] = cw_group[4]
                cw_list[0][3 * group_idx + 2] = cw_group[5]
                cw_list[1][3 * group_idx + 2] = 0
                cw_list[2][3 * group_idx + 2] = cw_group[6]
            cw_tuple_new = (tuple(cw_list[0]), tuple(cw_list[1]), tuple(cw_list[2]))

            result_xtalk = Xtalk_simu.calc_xtalk_level(array_cw01=cw_tuple_old, array_cw02=cw_tuple_new,
                                                       array_shield=flags_shield)
            result_dict = Xtalk_simu.xtalk_level_cnt(cw_xtalk_tuple=result_xtalk)
            for iii in (0, 0.25, 0.5, 0.75,
                        1, 1.25, 1.5, 1.75,
                        2, 2.25, 2.5, 2.75,
                        3, 3.25, 3.5, 3.75,
                        4, 4.25, 4.5, 4.75,
                        5, 5.25, 5.5, 5.75,
                        6, 6.25, 6.5, 6.75,
                        7, 7.25, 7.5, 7.75,
                        8, 8.25, 8.5, 8.75,
                        9, 9.25, 9.5, 9.75,
                        10, 'None'):
                cnt_xtalk[iii] = cnt_xtalk[iii] + result_dict[iii]
            if cnt_xtalk[8.25] > 0:
                print("*******")
                print("Shielding Flags:{}".format(flags_shield))
                print("CW01: {}".format(cw_tuple_old))
                print("CW02: {}".format(cw_tuple_new))
                assert False
            cw_tuple_old = copy.deepcopy(cw_tuple_new)

    return copy.deepcopy(cnt_xtalk)
