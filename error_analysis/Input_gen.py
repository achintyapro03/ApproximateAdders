import random

def generate_random_binary():
    return ''.join(random.choice('01') for _ in range(8))

def generate_combinations(num_combinations):
    combinations = []
    for i in range(num_combinations):
        A1 = generate_random_binary()
        B1 = generate_random_binary()
        A2 = A1
        B2 = B1
        A3 = A1
        B3 = B1
        delay = 10  # Random delay value
        combinations.append(f"A1 = 8'b {A1}; B1 = 8'b {B1};\n"
                            f"A2 = 8'b {A2}; B2 = 8'b {B2};\n"
                            f"A3 = 8'b {A3}; B3 = 8'b {B3}; #{delay};")
    return combinations

def write_to_txt(filename, data):
    with open(filename, 'w') as txtfile:
        for line in data:
            txtfile.write(line + '\n')

def main():
    num_combinations = 1000
    combinations = generate_combinations(num_combinations)
    filename = 'combinations.txt'
    write_to_txt(filename, combinations)
    print(f"Combinations have been written to '{filename}'.")

if __name__ == "__main__":
    main()
