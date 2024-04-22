import numpy as np
from scipy.fft import dct, idct
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from PIL import Image

red = np.zeros((128, 128), dtype=float)

with open('outRed.txt', 'r') as file:
    data = file.read()
    numbers = data.split()
    red = np.array(numbers, dtype=float).reshape(128, 128)


green = np.zeros((128, 128), dtype=float)

with open('outGreen.txt', 'r') as file:
    data = file.read()
    numbers = data.split()
    green = np.array(numbers, dtype=float).reshape(128, 128)


blue = np.zeros((128, 128), dtype=float)

with open('outBlue.txt', 'r') as file:
    data = file.read()
    numbers = data.split()
    blue = np.array(numbers, dtype=float).reshape(128, 128)

inpImg = mpimg.imread('f1.jpg')

# quant_table = np.array([
#     [16,  11,  10,  16,  24, 40, 51, 61],
#     [12,  12,  14,  19,  26, 58, 60, 55],
#     [14,  13,  16,  24, 40, 57, 69, 56],
#     [14,  17, 22,  29, 51, 87, 80, 62],
#     [18,  22, 37, 56, 68, 109, 103, 77],
#     [24, 35, 55, 64, 81, 104, 113, 92],
#     [49, 64, 78, 87, 103, 121, 120, 101],
#     [72, 92, 95, 98, 112, 100, 103, 99]
# ])

quant_table = np.array([    
    [6,  4,  4,  6,  10, 16, 20, 24],
    [5,  5,  6,  8,  10, 23, 24, 22],
    [6,  5,  6,  10, 16, 23, 28, 22],
    [6,  7,  9,  12, 20, 35, 32, 25],
    [7,  9,  15, 22, 27, 44, 41, 31],
    [10, 14, 22, 26, 32, 42, 45, 37],
    [20, 26, 31, 35, 41, 48, 48, 40],
    [29, 37, 38, 39, 45, 40, 41, 40]
])
quant_table = quant_table

idct_matrix = np.array([[0.35341683395063966, 0.4902357603574083, 0.46171452375250455, 0.41585984518107744, 0.35341683395063506, 0.2774638687951855, 0.19150988579907113, 0.0973885117086323], 
               [0.3534168339506351, -0.09738851170863172, -0.461714523752504, 0.2774638687951856, 0.35341683395063517, -0.4158598451810763, -0.19150988579907113, 0.49023576035740796], 
               [0.35341683395063744, -0.41585984518107694, 0.19150988579907188, 0.09738851170863226, -0.3534168339506352, 0.4902357603574081, -0.4617145237525051, 0.2774638687951858], 
               [0.35341683395063384, -0.27746386879518603, -0.19150988579907066, 0.4902357603574086, -0.3534168339506347, -0.09738851170863276, 0.46171452375250516, -0.41585984518107666],
               [0.3534168339506327, 0.09738851170863301, -0.46171452375250477, -0.2774638687951865, 0.3534168339506353, 0.4158598451810778, -0.19150988579907122, -0.49023576035740796], 
               [0.3534168339506375, 0.2774638687951857, -0.19150988579907083, -0.4902357603574077, -0.3534168339506347, 0.09738851170863252, 0.4617145237525044, 0.4158598451810766], 
               [0.3534168339506283, 0.41585984518107677, 0.1915098857990716, -0.09738851170863214, -0.35341683395063506, -0.4902357603574081, -0.4617145237525046, -0.2774638687951849], 
               [0.35341683395063334, -0.49023576035740785, 0.4617145237525045, -0.41585984518107694, 0.3534168339506349, -0.277463868795186, 0.19150988579907086, -0.09738851170863201]
               ])

pixelsRed = np.zeros((128, 128))
pixelsGreen = np.zeros((128, 128))
pixelsBlue = np.zeros((128, 128))

inpArray = [red, green, blue]
outArray = [pixelsRed, pixelsGreen, pixelsBlue]

for k in range(3):
    for i in range(16):
        for j in range(16):
            dct_signal = np.array(inpArray[k][i*8:(i+1)*8,j*8:(j+1)*8])

            divided = dct_signal/quant_table

            quantized = np.round(divided).astype(np.int64)
            recovered = quantized * quant_table 

            idct_signal = np.round(np.dot(idct_matrix, (np.dot(idct_matrix, recovered.T).T))).astype(np.int64)


            for p in range(8):
                for q in range(8):
                    outArray[k][8 * i + p][8 * j + q] = idct_signal[p][q]

            outArray[k] = outArray[k].astype(np.int64)    

rgb_image = np.stack((outArray[0], outArray[1], outArray[2]), axis=-1)

fig, axes = plt.subplots(1, 2)

axes[0].imshow(inpImg)
axes[0].set_title('Input Image')

axes[1].imshow(rgb_image)
axes[1].set_title('Compressed Image')

# Show the plot
plt.show()