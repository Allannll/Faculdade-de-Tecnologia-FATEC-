#include <iostream>
#include <cmath>
using namespace std;

void ex1() {
    int grade1, grade2, grade3, grade4, finalGrade;
    cout << "Enter your first grade: ";
    cin >> grade1;
    cout << "Enter your second grade: ";
    cin >> grade2;
    cout << "Enter your third grade: ";
    cin >> grade3;
    cout << "Enter your fourth grade: ";
    cin >> grade4;
    finalGrade = (grade1 + grade2 + grade3 + grade4) / 4;
    cout << "Final grade: " << finalGrade << "." << endl;
}

void ex2() {
    int grade1, grade2, finalGrade;
    cout << "Enter your first grade: ";
    cin >> grade1;
    cout << "Enter your second grade: ";
    cin >> grade2;
    finalGrade = (grade1 + grade2) / 2;
    if (finalGrade <= 3) {
        cout << "Your grade is: " << finalGrade << "\n Status: Failed" << endl;
    } else if (finalGrade <= 7) {
        cout << "Your grade is: " << finalGrade << "\n Status: Exam" << endl;
    } else {
        cout << "Your grade is: " << finalGrade << "\n Status: Passed" << endl;
    }
}

void ex3() {
    int num1, num2;
    cout << "Enter the first number: ";
    cin >> num1;
    cout << "Enter the second number: ";
    cin >> num2;
    cout << "The smaller number is: " << (num1 < num2 ? num1 : num2) << endl;
}

void ex4() {
    int num1, num2, num3;
    cout << "Enter the first number: ";
    cin >> num1;
    cout << "Enter the second number: ";
    cin >> num2;
    cout << "Enter the third number: ";
    cin >> num3;
    int largest = (num1 >= num2 && num1 >= num3) ? num1 : (num2 >= num1 && num2 >= num3) ? num2 : num3;
    cout << "The largest number is: " << largest << endl;
}

void ex5() {
    float num1, num2;
    int choice;
    cout << "Enter the first number: ";
    cin >> num1;
    cout << "Enter the second number: ";
    cin >> num2;
    cout << "Choose an option:" << endl;
    cout << "1. Average of the numbers" << endl;
    cout << "2. Difference between the largest and smallest" << endl;
    cout << "3. Product of the numbers" << endl;
    cout << "4. Division of the first by the second" << endl;
    cin >> choice;
    switch (choice) {
        case 1: cout << "The average is: " << (num1 + num2) / 2 << endl; break;
        case 2: cout << "The difference is: " << abs(num1 - num2) << endl; break;
        case 3: cout << "The product is: " << num1 * num2 << endl; break;
        case 4: 
            if (num2 != 0) {
                cout << "The division is: " << num1 / num2 << endl;
            } else {
                cout << "Division by zero is not allowed." << endl;
            }
            break;
        default: cout << "Invalid option." << endl; break;
    }
}

void ex6() {
    double num1, num2;
    int choice;
    cout << "Enter the first number: ";
    cin >> num1;
    cout << "Enter the second number: ";
    cin >> num2;
    cout << "Choose an option:" << endl;
    cout << "1. First number raised to the second" << endl;
    cout << "2. Square root of each number" << endl;
    cout << "3. Cube root of each number" << endl;
    cin >> choice;
    switch (choice) {
        case 1: cout << "The result is: " << pow(num1, num2) << endl; break;
        case 2: 
            cout << "Square root of first number: " << sqrt(num1) << endl;
            cout << "Square root of second number: " << sqrt(num2) << endl;
            break;
        case 3: 
            cout << "Cube root of first number: " << cbrt(num1) << endl;
            cout << "Cube root of second number: " << cbrt(num2) << endl;
            break;
        default: cout << "Invalid option." << endl; break;
    }
}

void ex7() {
    float salary, newSalary, increase;
    cout << "Enter your salary: ";
    cin >> salary;
    if (salary <= 500) {
        increase = (30.0 / 100) * salary;
        newSalary = salary + increase;
        cout << "Your new salary is: " << newSalary << "\n Your increase was: " << increase << endl;
    } else {
        cout << "You are not eligible for an increase." << endl;
    }
}

void ex8() {
    float salary, newSalary;
    cout << "Enter your salary: ";
    cin >> salary;
    if (salary <= 300) {
        newSalary = salary + (35.0 / 100) * salary;
    } else {
        newSalary = salary + (15.0 / 100) * salary;
    }
    cout << "Your new salary is: " << newSalary << endl;
}

void ex9() {
    float salary, credit;
    cout << "Enter your salary: ";
    cin >> salary;
    if (salary >= 400) {
        credit = (30.0 / 100) * salary;
    } else if (salary <= 300) {
        credit = (25.0 / 100) * salary;
    } else if (salary <= 200) {
        credit = (20.0 / 100) * salary;
    } else {
        credit = (10.0 / 100) * salary;
    }
    cout << "Your credit is: " << credit << endl;
}

void ex10() {
    float factoryCost, consumerPrice;
    cout << "Enter the factory cost of the car: $ ";
    cin >> factoryCost;
    if (factoryCost <= 12000) {
        consumerPrice = factoryCost;
    } else if (factoryCost <= 25000) {
        consumerPrice = factoryCost + (factoryCost * 0.15) + (factoryCost * 0.05);
    } else {
        consumerPrice = factoryCost + (factoryCost * 0.20) + (factoryCost * 0.05);
    }
    cout << "The consumer price of the car is: $ " << consumerPrice << endl;
}

int main() {
    int choice;
    do {
        cout << "Select an exercise:" << endl;
        cout << "1- Grade calculation" << endl;
        cout << "2- Final grade and status" << endl;
        cout << "3- Smaller number" << endl;
        cout << "4- Largest number" << endl;
        cout << "5- Arithmetic operations" << endl;
        cout << "6- Power, square root, cube root" << endl;
        cout << "7- Salary increase (up to 500)" << endl;
        cout << "8- Salary increase based on thresholds" << endl;
        cout << "9- Credit based on salary" << endl;
        cout << "10- Car price calculation" << endl;
        cout << "0- Exit" << endl;
        cin >> choice;

        switch (choice) {
            case 1: ex1(); break;
            case 2: ex2(); break;
            case 3: ex3(); break;
            case 4: ex4(); break;
            case 5: ex5(); break;
            case 6: ex6(); break;
            case 7: ex7(); break;
            case 8: ex8(); break;
            case 9: ex9(); break;
            case 10: ex10(); break;
            case 0: cout << "Exiting program..." << endl; break;
            default: cout << "Invalid option." << endl; break;
        }
    } while (choice != 0);
    
    return 0;
}
