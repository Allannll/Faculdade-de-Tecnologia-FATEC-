#include <stdio.h>
#include <float.h>

void ex1() {
    double weight, height;
    double maxWeight = -DBL_MAX;
    double minWeight = DBL_MAX;
    double maxHeight = -DBL_MAX;
    double minHeight = DBL_MAX;
    double maxIMC = -DBL_MAX;
    double minIMC = DBL_MAX;
    double sumWeights = 0.0, sumHeights = 0.0, sumIMCs = 0.0;
    int count = 0;

    char continueInput;

    do {
        printf("Enter the person's weight (kg): ");
        scanf("%lf", &weight);
        printf("Enter the person's height (m): ");
        scanf("%lf", &height);

        double imc = weight / (height * height);

        maxWeight = (weight > maxWeight) ? weight : maxWeight;
        minWeight = (weight < minWeight) ? weight : minWeight;
        maxHeight = (height > maxHeight) ? height : maxHeight;
        minHeight = (height < minHeight) ? height : minHeight;
        maxIMC = (imc > maxIMC) ? imc : maxIMC;
        minIMC = (imc < minIMC) ? imc : minIMC;

        sumWeights += weight;
        sumHeights += height;
        sumIMCs += imc;
        count++;

        printf("Do you want to enter data for another person? (y/n): ");
        scanf(" %c", &continueInput);

    } while (continueInput == 'y' || continueInput == 'Y');

    double avgWeights = (count > 0) ? sumWeights / count : 0;
    double avgHeights = (count > 0) ? sumHeights / count : 0;
    double avgIMCs = (count > 0) ? sumIMCs / count : 0;

    printf("\nResults:\n");
    printf("Max Weight: %.2f kg\n", maxWeight);
    printf("Min Weight: %.2f kg\n", minWeight);
    printf("Max Height: %.2f m\n", maxHeight);
    printf("Min Height: %.2f m\n", minHeight);
    printf("Max IMC: %.2f\n", maxIMC);
    printf("Min IMC: %.2f\n", minIMC);
    printf("Average Weight: %.2f kg\n", avgWeights);
    printf("Average Height: %.2f m\n", avgHeights);
    printf("Average IMC: %.2f\n", avgIMCs);
}

void ex2() {
    int number;
    unsigned long long factorial = 1;

    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    if (number < 0) {
        printf("Factorial is not defined for negative numbers.\n");
    } else {
        int counter = number;

        while (counter > 1) {
            factorial *= counter;
            counter--;
        }

        printf("The factorial of %d is: %llu\n", number, factorial);
    }
}

int main() {
    int choice;

    printf("Choose an exercise:\n");
    printf("1 - Calculate weight, height, and IMC statistics\n");
    printf("2 - Calculate factorial\n");
    scanf("%d", &choice);

    switch (choice) {
        case 1:
            ex1();
            break;
        case 2:
            ex2();
            break;
        default:
            printf("Invalid choice.\n");
            break;
    }

    return 0;
}
