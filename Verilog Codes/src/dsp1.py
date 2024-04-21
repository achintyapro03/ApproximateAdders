import numpy as np
from scipy.fft import dct, idct
import matplotlib.pyplot as plt

list = []
with open("in.txt","r") as f:
    line = f.readline()
    while line!="":
        list_128 = []
        for i in range(128):
            list_128.append(int(line[:-1], 2))
            line = f.readline()
        list.append(list_128)
list = np.array(list,dtype="int")

quant_table = np.array([
    [16,  11,  10,  16,  24, 40, 51, 61],
    [12,  12,  14,  19,  26, 58, 60, 55],
    [14,  13,  16,  24, 40, 57, 69, 56],
    [14,  17, 22,  29, 51, 87, 80, 62],
    [18,  22, 37, 56, 68, 109, 103, 77],
    [24, 35, 55, 64, 81, 104, 113, 92],
    [49, 64, 78, 87, 103, 121, 120, 101],
    [72, 92, 95, 98, 112, 100, 103, 99]
])

quant_table = quant_table * 1000
pixels = np.zeros((128, 128))

for i in range(16):
    for j in range(16):
        inp_list = np.array(list[i*8:(i+1)*8,j*8:(j+1)*8])

        dct_signal = dct(dct(inp_list.T).T)

        divided = dct_signal/quant_table

        quantized = np.round(divided).astype(np.int64)
        recovered = quantized * quant_table

        idct_signal = np.round(idct(idct(recovered.T).T)).astype(np.int64)

        for p in range(8):
            for q in range(8):
                pixels[8 * i + p][8 * j + q] = idct_signal[p][q]

        pixels = pixels.astype(np.int64)


fig, axes = plt.subplots(1, 2, figsize=(10, 5))  # Creating a figure with two subplots side by side

# Displaying the first image on the left subplot
axes[0].imshow(np.array(list), cmap="gray")
axes[0].set_title('First Image')

# Displaying the second image on the right subplot
axes[1].imshow(pixels, cmap="gray")
axes[1].set_title('Second Image')

plt.show()