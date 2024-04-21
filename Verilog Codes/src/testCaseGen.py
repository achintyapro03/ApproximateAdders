import math
import numpy as np

def myTrunc(li):
    mask = li < -1

    li[mask] = np.floor(li[mask])
    li[~mask] = np.trunc(li[~mask])

    return li

print(myTrunc(np.array([1.4232, -10.32323, -0.52323, -1.23232, -0.9423232, 10.233])))