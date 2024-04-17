import random

def generate_test_cases(num_bits, num_cases, filename):
    with open(filename, 'w') as file:
        for i in range(num_cases):
            max_value = 2**(num_bits - 1)
            
            A = random.randint(0, max_value)
            B = random.randint(0, max_value)
            
            A_str = f"{num_bits}'b{A:{num_bits}b}"
            B_str = f"{num_bits}'b{B:{num_bits}b}"
            
            file.write(f"\tA = {A_str}; B = {B_str}; #10;\n")

    print(f"Test cases written to {filename}")

generate_test_cases(int(input("Enter number of bits : ")), int(input("Enter number of test cases : ")), 'test_cases.txt')
