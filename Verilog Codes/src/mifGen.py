from PIL import Image
import numpy as np

image_path = "f1.jpg" 
image = Image.open(image_path)

gray_image = image.convert("L")

gray_array = np.array(gray_image)

gray_values = gray_array.flatten()

output_file = "in.txt"
length = 12
# with open(output_file, "w") as file:
#     for i in range(0, 128 * 128):
#         s = str(bin(i)[2:])
#         l = len(s)
#         for i in range(0, length - l):
#             s = "0" + s
#         file.write(f"{s}\n")

with open(output_file, "w") as file:
    for value in gray_values:
        s = str(bin(value)[2:])
        l = len(s)
        for i in range(0, length - l):
            s = "0" + s
        file.write(f"{s}\n")

print(f"Grayscale pixel values saved to {output_file}.")
