import random
import DyMFNS.dymfns_codec

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


codec01 = DyMFNS.dymfns_codec.Codec_DyMFNS(n=15, tuple_flags=(1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1))

codeword_last = codec01.attr_get_n()*(0, )
cnt_sat = 0
cnt_all = 0

for i in range(0, 100):
    value_random = random.randint(0, codec01.attr_get_max_value())
    codeword = codec01.encode(value=value_random)
    sat = check_cac(codeword1=codeword, codeword2=codeword_last)
    print("value={}, sat={}, \n                        codeword={}".format(value_random, sat, codeword))
    cnt_all = cnt_all + 1
    if sat:
        cnt_sat = cnt_sat + 1
    assert sat
    codeword_last = codeword
print('\n \n')
print("# cnt_all={}, cnt_sat={}".format(cnt_all, cnt_sat))
print("# ns1={}".format(codec01.attr_get_ns1_all()))
print("# ns2={}".format(codec01.attr_get_ns2_all()))
print("# max value={}".format(codec01.attr_get_max_value()))

