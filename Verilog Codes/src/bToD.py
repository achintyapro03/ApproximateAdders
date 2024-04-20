def binary_to_decimal(binary_string):
    decimal_numbers = []
    for i in range(0, len(binary_string), 16):
        chunk = binary_string[i:i+16]
        decimal_numbers.append(int(chunk, 2))
    return decimal_numbers

# Example usage:
binary_string = input("Enter string : ")
decimal_numbers = binary_to_decimal(binary_string)
print(decimal_numbers)
