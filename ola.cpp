#include <iostream>
#include <cmath>

constexpr int N = 8; // Size of the input array

// Function to perform 1D DCT
void dct_1d(double input[], double output[])
{
    for (int k = 0; k < N; ++k)
    {
        double sum = 0.0;
        for (int n = 0; n < N; ++n)
        {
            double coef = (n == 0) ? std::sqrt(1.0 / N) : std::sqrt(2.0 / N);
            sum += input[n] * std::cos(M_PI * (2 * n + 1) * k / (2.0 * N));
        }
        output[k] = sum;
    }
}

// Function to print array elements
void print_array(double arr[])
{
    for (int i = 0; i < N; ++i)
    {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
}

int main()
{
    double input[N] = {1, 2, 3, 4, 5, 6, 7, 8};
    double output[N];

    std::cout << "Input array:" << std::endl;
    print_array(input);

    dct_1d(input, output);

    std::cout << "DCT Output array:" << std::endl;
    print_array(output);

    return 0;
}
