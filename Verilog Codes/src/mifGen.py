from PIL import Image
import numpy as np

image_path = "../../f1.jpg" 
image = Image.open(image_path)

gray_image = image.convert("L")

gray_array = np.array(gray_image)

gray_values = gray_array.flatten()

output_file = "out.txt"
with open(output_file, "w") as file:
    for value in gray_values:
        file.write(f"{bin(value)[2:]}\n")

print(f"Grayscale pixel values saved to {output_file}.")
