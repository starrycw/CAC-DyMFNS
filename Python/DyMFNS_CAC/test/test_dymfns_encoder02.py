import random
import DyMFNS.dymfns_codec

def simu_all_fault_cases(n, n_data):

    def check_cac(codeword1, codeword2):
        assert len(codeword1) == len(codeword2)
        for idx in range(1, len(codeword1)-1):
            diff1 = codeword1[idx-1] - codeword2[idx-1]
            diff2 = codeword1[idx] - codeword2[idx]
            diff3 = codeword1[idx+1] - codeword2[idx+1]
            if diff3 == diff1:
                if (diff2 == 1) and (diff1 == -1):
                    return False
                if (diff2 == -1) and (diff1 == 1):
                    return False
        return True

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

        for i in range(0, n_data):
            value_random = random.randint(0, codec01.attr_get_max_value())
            codeword = codec01.encode(value=value_random)
            sat = check_cac(codeword1=codeword, codeword2=codeword_last)
            cnt_all = cnt_all + 1
            if sat:
                cnt_sat = cnt_sat + 1
            assert sat
            codeword_last = codeword

        print("# flags={}, ns1={}, ns2={}, max value={}".format(vec_tuple,
                                                                codec01.attr_get_ns1_all(),
                                                                codec01.attr_get_ns2_all(),
                                                                codec01.attr_get_max_value()))

    print("# cnt_all={}, cnt_sat={}".format(cnt_all, cnt_sat))


simu_all_fault_cases(n=10, n_data=1000)