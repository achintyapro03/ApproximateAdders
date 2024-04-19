import numpy as np
import matplotlib.pyplot as plt


file_path = 'compare.txt' 

with open(file_path, 'r') as file:
    pixel_values = [int(line.strip()) for line in file]

print(pixel_values)

image = np.reshape(pixel_values, (8, 8))

print(image)

plt.imshow(image, cmap='gray')
plt.title('Grayscale Image')
plt.show()
