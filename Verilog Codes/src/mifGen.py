from PIL import Image
import numpy as np

image_path = "f1.jpg" 
image = Image.open(image_path)

# gray_image = image.convert("L")


rgb_values = list(image.getdata())

# Separate the RGB values into three lists
red_values = []
green_values = []
blue_values = []

for r, g, b in rgb_values:
    red_values.append(r)
    green_values.append(g)
    blue_values.append(b)

length = 12
# with open(output_file, "w") as file:
#     for i in range(0, 128 * 128):
#         s = str(bin(i)[2:])
#         l = len(s)
#         for i in range(0, length - l):
#             s = "0" + s
#         file.write(f"{s}\n")

with open("red.txt", "w") as file:
    for value in red_values:
        s = str(bin(value)[2:])
        l = len(s)
        for i in range(0, length - l):
            s = "0" + s
        file.write(f"{s}\n")

with open("green.txt", "w") as file:
    for value in green_values:
        s = str(bin(value)[2:])
        l = len(s)
        for i in range(0, length - l):
            s = "0" + s
        file.write(f"{s}\n")

with open("blue.txt", "w") as file:
    for value in blue_values:
        s = str(bin(value)[2:])
        l = len(s)
        for i in range(0, length - l):
            s = "0" + s
        file.write(f"{s}\n")



# merged_image = Image.new('RGB', image.size)
# merged_image_pixels = []

# for r, g, b in zip(red_values, green_values, blue_values):
#     merged_image_pixels.append((r, g, b))

# merged_image.putdata(merged_image_pixels)

# merged_image.show()

print(f"pixel values saved .")
