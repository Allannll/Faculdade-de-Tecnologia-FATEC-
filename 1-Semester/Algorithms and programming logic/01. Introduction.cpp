#include <iostream>
#include <cmath>
#include <iomanip>

int main() {
    int choice;

    do {
        std::cout << "Select an option:\n";
        std::cout << "1- Subtraction\n";
        std::cout << "2- Multiplication\n";
        std::cout << "3- Division\n";
        std::cout << "4- Weighted Average\n";
        std::cout << "5- Product Price with Discount\n";
        std::cout << "6- Salary with Commission\n";
        std::cout << "7- Weight Adjustment\n";
        std::cout << "8- Weight in Grams\n";
        std::cout << "9- Trapezoid Area\n";
        std::cout << "10- Salary in Minimum Wages\n";
        std::cout << "11- Age Calculation\n";
        std::cout << "12- Remaining Salary after Bills\n";
        std::cout << "13- Hypotenuse Calculation\n";
        std::cout << "14- Sphere Properties\n";
        std::cout << "15- Triangle Angle Calculation\n";
        std::cout << "16- Currency Conversion\n";
        std::cout << "0- Exit\n";
        std::cout << "Your choice: ";
        std::cin >> choice;

        switch (choice) {
            case 1: {
                int num1, num2;
                std::cout << "Enter first number: ";
                std::cin >> num1;
                std::cout << "Enter second number: ";
                std::cin >> num2;
                std::cout << "Result: " << num1 - num2 << "\n";
                break;
            }
            case 2: {
                int num1, num2, num3;
                std::cout << "Enter three numbers: ";
                std::cin >> num1 >> num2 >> num3;
                std::cout << "Result: " << num1 * num2 * num3 << "\n";
                break;
            }
            case 3: {
                float num1, num2;
                std::cout << "Enter numerator: ";
                std::cin >> num1;
                std::cout << "Enter denominator: ";
                std::cin >> num2;
                if (num2 != 0)
                    std::cout << "Result: " << num1 / num2 << "\n";
                else
                    std::cout << "Denominator cannot be zero.\n";
                break;
            }
            case 4: {
                float grade1, grade2;
                std::cout << "Enter first grade: ";
                std::cin >> grade1;
                std::cout << "Enter second grade: ";
                std::cin >> grade2;
                std::cout << "Weighted Average: " << (2 * grade1 + 3 * grade2) / 5 << "\n";
                break;
            }
            case 5: {
                float price;
                std::cout << "Enter product price: ";
                std::cin >> price;
                std::cout << "Price after discount: " << price * 0.9 << "\n";
                break;
            }
            case 6: {
                float salary, productPrice, sales, newSalary;
                std::cout << "Enter salary: ";
                std::cin >> salary;
                std::cout << "Enter product price: ";
                std::cin >> productPrice;
                std::cout << "Enter units sold: ";
                std::cin >> sales;
                newSalary = salary + productPrice * sales * 0.04;
                std::cout << "New Salary: " << newSalary << "\n";
                break;
            }
            case 7: {
                float weight;
                std::cout << "Enter your weight: ";
                std::cin >> weight;
                std::cout << "Weight after gaining 15%: " << weight * 1.15 << "\n";
                std::cout << "Weight after losing 20%: " << weight * 0.8 << "\n";
                break;
            }
            case 8: {
                float weight;
                std::cout << "Enter your weight in kg: ";
                std::cin >> weight;
                std::cout << "Weight in grams: " << weight * 1000 << "\n";
                break;
            }
            case 9: {
                float base1, base2, height;
                std::cout << "Enter smaller base: ";
                std::cin >> base1;
                std::cout << "Enter larger base: ";
                std::cin >> base2;
                std::cout << "Enter height: ";
                std::cin >> height;
                std::cout << "Trapezoid area: " << (base1 + base2) * height / 2 << "\n";
                break;
            }
            case 10: {
                float minSalary, salary;
                std::cout << "Enter minimum salary: ";
                std::cin >> minSalary;
                std::cout << "Enter your salary: ";
                std::cin >> salary;
                std::cout << "Salary in minimum wages: " << salary / minSalary << "\n";
                break;
            }
            case 11: {
                float birthYear, currentYear;
                std::cout << "Enter year of birth: ";
                std::cin >> birthYear;
                std::cout << "Enter current year: ";
                std::cin >> currentYear;
                float age = currentYear - birthYear;
                std::cout << "Age: " << age << " years\n";
                break;
            }
            case 12: {
                float salary, bill1, bill2;
                std::cout << "Enter your salary: ";
                std::cin >> salary;
                std::cout << "Enter first bill: ";
                std::cin >> bill1;
                std::cout << "Enter second bill: ";
                std::cin >> bill2;
                float total = bill1 * 1.02 + bill2 * 1.02;
                std::cout << "Remaining salary: " << salary - total << "\n";
                break;
            }
            case 13: {
                float side1, side2;
                std::cout << "Enter two sides of a triangle: ";
                std::cin >> side1 >> side2;
                std::cout << "Hypotenuse: " << std::sqrt(side1 * side1 + side2 * side2) << "\n";
                break;
            }
            case 14: {
                float radius;
                const float PI = 3.14159;
                std::cout << "Enter radius: ";
                std::cin >> radius;
                std::cout << "Sphere Circumference: " << 2 * PI * radius << "\n";
                std::cout << "Sphere Area: " << 4 * PI * radius * radius << "\n";
                std::cout << "Sphere Volume: " << (4.0 / 3.0) * PI * std::pow(radius, 3) << "\n";
                break;
            }
            case 15: {
                float angle1, angle2;
                std::cout << "Enter two angles of a triangle: ";
                std::cin >> angle1 >> angle2;
                std::cout << "Third angle: " << 180 - (angle1 + angle2) << " degrees\n";
                break;
            }
            case 16: {
                float amount;
                std::cout << "Enter amount in BRL: ";
                std::cin >> amount;
                std::cout << "In USD: " << std::fixed << std::setprecision(2) << amount / 1.8 << "\n";
                std::cout << "In GBP: " << amount / 3.57 << "\n";
                std::cout << "In DEM: " << amount / 2.0 << "\n";
                break;
            }
            case 0:
                std::cout << "Exiting...\n";
                break;
            default:
                std::cout << "Invalid option.\n";
        }
    } while (choice != 0);

    return 0;
}
