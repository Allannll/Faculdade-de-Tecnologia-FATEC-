#include <stdio.h>

unsigned long long calculateFactorial(int n) {
    if (n < 0) {
        return 0;
    }
    unsigned long long factorial = 1;
    for (int i = 1; i <= n; i++) {
        factorial *= i;
    }
    return factorial;
}

void ex1() {
    int x, number, sumOfEvens = 0;
    
    printf("Enter the number of values (x): ");
    scanf("%d", &x);

    for (int i = 0; i < x; i++) {
        printf("Enter number %d: ", i + 1);
        scanf("%d", &number);

        if (number % 2 == 0) {
            sumOfEvens += number;
        }
    }

    printf("The sum of the even numbers is: %d\n", sumOfEvens);
}

void ex2() {
    int n;
    double temperature, sumOfTemperatures = 0.0;

    printf("Enter the number of temperatures (N): ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("The number of temperatures must be greater than zero.\n");
        return;
    }

    for (int i = 0; i < n; i++) {
        printf("Enter temperature %d: ", i + 1);
        scanf("%lf", &temperature);
        sumOfTemperatures += temperature;
    }

    double averageTemperature = sumOfTemperatures / n;

    printf("The average temperature is: %.2f\n", averageTemperature);
}

void ex3() {
    int n;
    double temperature, sumOfTemperatures = 0.0;

    printf("Enter the number of temperatures (N): ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("The number of temperatures must be greater than zero.\n");
        return;
    }

    for (int i = 0; i < n; i++) {
        printf("Enter temperature %d: ", i + 1);
        scanf("%lf", &temperature);
        sumOfTemperatures += temperature;
    }

    double averageTemperature = sumOfTemperatures / n;

    printf("The average temperature is: %.2f\n", averageTemperature);
}

void ex4() {
    int n;
    
    printf("Enter a number to calculate the factorial: ");
    scanf("%d", &n);
    
    unsigned long long result = calculateFactorial(n);
    printf("The factorial of %d is: %llu\n", n, result);
}

int main() {
    int choice;
    
    printf("Choose an exercise:\n");
    printf("1 - Sum of even numbers\n");
    printf("2 - Average of temperatures\n");
    printf("3 - Average of temperatures\n");
    printf("4 - Calculate factorial\n");
    scanf("%d", &choice);
    
    switch (choice) {
        case 1:
            ex1();
            break;
        case 2:
            ex2();
            break;
        case 3:
            ex3();
            break;
        case 4:
            ex4();
            break;
        default:
            printf("Invalid choice.\n");
            break;
    }

    return 0;
}
