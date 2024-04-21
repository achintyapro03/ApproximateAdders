import math
import numpy as np

def myTrunc(li):
    mask = li < -1

    li[mask] = np.floor(li[mask])
    li[~mask] = np.trunc(li[~mask])

    return li


# dct_array = eval(input("Enter DCT List: "))
def read_inputfile(filename):
    list = []
    with open(filename,"r") as f:
        line = f.readline()
        while line!="":
            list_128 = []
            for i in range(128):
                list_128.append(int(line[:-1], 2))
                line = f.readline()
            # print(len(list_128))
            list.append(list_128)
    list = np.array(list,dtype="int")
    # print(list.shape)
    return list

def two_dct(data_list):
    single_answer = []
    # print(len(data_list))
    for i in range(8):
        input_list = data_list[i][:8]
        # print(input_list)
        input_list = list(input_list)
        single_answer.append(oned_dct(input_list))
        if(i==1):
            print(single_answer[i])
    return single_answer
def two_dprint(data_list):
    for i in range(len(data_list)):
        for j in range(len(data_list[i])):
            print(int(data_list[i][j]),end=" ")
        print()
def oned_dct(dct_array = [100,102,103,103,103,104,103,104]):
    # dct_array = [100,102,103,103,103,104,103,104]
    s1 = []
    # print(type(dct_array))
    s1.extend([dct_array[0]+dct_array[7],dct_array[0]-dct_array[7]])
    s1.extend([dct_array[4]+dct_array[1],dct_array[4]-dct_array[1]])
    s1.extend([dct_array[6]+dct_array[2],dct_array[6]-dct_array[2]])
    s1.extend([dct_array[5]+dct_array[3],dct_array[5]-dct_array[3]])

    # print(s1)
    # print(s1)
    c0 = 0.35369
    c1 = 0.49040
    c2 = 0.46198
    c3 = 0.41582
    c4 = 0.35369
    c5 = 0.27799
    c6 = 0.19162
    c7 = 0.09789
    s2 = []
    s2.append(s1[1]*c1 + s1[3]*c7)
    s2.append(s1[1]*c7-s1[3]*c1)
    s2.append(s1[5]*c3 + s1[7]*c5)
    s2.append(s1[5]*c5-s1[7]*c3)
    s2.append(s1[1]*c5 + s1[3]*c3)
    s2.append(s1[1]*c3-s1[3]*c5)
    s2.append(s1[5]*c7 + s1[7]*c1)
    s2.append(s1[5]*c1-s1[7]*c7)
    s2.append(s1[0]+s1[2])
    s2.append(s1[0]-s1[2])
    s2.append(s1[4]+s1[6])
    s2.append(s1[4]-s1[6])


    # for i in range(len(s2)):
    #     s2[i] = math.trunc(s2[i])
    # print(s2)
    print("kk", end=" .. ")
    print(s2)
    s2 = myTrunc(np.array(s2))
    print(s2)
    s3 = []
    s3.append((s2[8]+s2[10])*c4)
    s3.append(s2[0]+s2[2])
    s3.append(s2[9]*c2+s2[11]*c6)
    s3.append(s2[5]-s2[6])
    s3.append((s2[8]-s2[10])*c4)
    s3.append(s2[4]-s2[7])
    s3.append(s2[9]*c6-s2[11]*c2)
    s3.append(s2[1]-s2[3])
    s3 = myTrunc(np.array(s3))
    # print(s3)

    return s3
# s1_dct = []
# for i in range(8):
#     list = eval(input("Enter List: "))
#     return_list = oned_dct()
#     s1_dct.append(return_list)
returned_list = read_inputfile("in.txt")
# print(returned_list[0].shape)
val1 = (returned_list.shape[0]//8)-1
val2 = (returned_list.shape[1]//8)-1
# print(returned_list.shape[1]//8)
val1 = int(input("Enter row index: "))
val2 = int(input("Enter column index: "))
for i in range(val1,val1+1):
    for j in range(val2,val2+1):
        input_list = returned_list[i*8:(i+1)*8,j*8:(j+1)*8]
        print()
        print("Input List")
        print(input_list)
        stage2_rl = two_dct(input_list)
        # print(type(returned_list))
        stage2_rl = np.transpose(stage2_rl)
        # print(stage2_rl)
        stage3_rl = two_dct(stage2_rl)
        stage3_rl = np.transpose(stage3_rl)
        print()
        print("Output List")
        two_dprint(stage3_rl)
        print()

    


