#include <stdio.h>

int calculateWeightedAverage(int a, int b) {
    int average = (a + b) / 2;
    return average;
}

void ex1() {
    int grade1, grade2;

    printf("Enter the 1st grade of the student: ");
    scanf("%d", &grade1);
    printf("Enter the 2nd grade of the student: ");
    scanf("%d", &grade2);

    float finalAverage = calculateWeightedAverage(grade1, grade2);

    char* status;
    if (finalAverage >= 6) {
        status = "Approved";
    } else {
        status = "Failed";
    }

    printf("The student is: %s\n", status);
    printf("The student's final average is: %.2f\n", finalAverage);
}

void ex2() {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);

    char* classType;

    if (num >= 28 && num <= 30) {
        classType = "A";
    } else if (num >= 35 && num <= 100) {
        classType = "B";
    } else if (num >= 100 && num <= 600) {
        classType = "C";
    } else {
        classType = "No class";
    }

    printf("Your number fits into class: %s\n", classType);
}

void ex3() {
    double a, b, c;
    printf("Enter the length of the first side: ");
    scanf("%lf", &a);
    printf("Enter the length of the second side: ");
    scanf("%lf", &b);
    printf("Enter the length of the third side: ");
    scanf("%lf", &c);

    if ((a + b > c) && (a + c > b) && (b + c > a)) {
        if (a == b && b == c) {
            printf("The sides form an equilateral triangle.\n");
        } else if (a == b || b == c || a == c) {
            printf("The sides form an isosceles triangle.\n");
        } else {
            printf("The sides form a scalene triangle.\n");
        }
    } else {
        printf("The provided measurements do not form a triangle.\n");
    }
}

void ex4() {
    char operation;
    double num1, num2, result;

    printf("Enter the first number: ");
    scanf("%lf", &num1);
    printf("Enter the second number: ");
    scanf("%lf", &num2);
    printf("Enter the operation (+, -, *, /): ");
    scanf(" %c", &operation);

    switch (operation) {
        case '+':
            result = num1 + num2;
            printf("Result: %.2f\n", result);
            break;
        case '-':
            result = num1 - num2;
            printf("Result: %.2f\n", result);
            break;
        case '*':
            result = num1 * num2;
            printf("Result: %.2f\n", result);
            break;
        case '/':
            if (num2 != 0) {
                result = num1 / num2;
                printf("Result: %.2f\n", result);
            } else {
                printf("Error: Division by zero is not allowed.\n");
            }
            break;
        default:
            printf("Invalid operation. Please choose +, -, *, or /.\n");
            break;
    }
}

int main() {
    char choice;

    printf("Choose the exercise:\n");
    printf("1 - Weighted Average  2 - Class Verification  3 - Triangle Measurement  4 - Calculator\n");
    scanf(" %c", &choice);  

    switch (choice) {
        case '1':
            ex1();
            break;
        case '2':
            ex2();
            break;
        case '3':
            ex3();
            break;
        case '4':
            ex4();
            break;
        default:
            printf("Invalid choice, please select from the listed options.\n");
            break;
    }

    return 0;
}
