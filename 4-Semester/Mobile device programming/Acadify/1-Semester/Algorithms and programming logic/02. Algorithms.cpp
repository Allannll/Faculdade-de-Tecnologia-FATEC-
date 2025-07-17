#include <iostream>
#include <math.h>
#include <string>

// Function to calculate factorial
float factorial(int number) {
    int fatorial = 1;
    for (int i = 1; i <= number; i++) {
        fatorial *= i;
    }
    return fatorial;
}

int main() {
    int choice = 0;
    
    while (true) {
        std::cout << "Select an exercise:\n"
                  << "1 - Calculate average (4 grades)\n"
                  << "2 - Calculate average (2 grades)\n"
                  << "3 - Find the smallest number\n"
                  << "4 - Find the largest number\n"
                  << "5 - Operations with two numbers\n"
                  << "6 - Series calculator\n"
                  << "7 - Leap year detector\n"
                  << "8 - IMC and statistics collection\n"
                  << "9 - Travel time between cities\n"
                  << "10 - Multiplication table\n"
                  << "Enter your choice: ";
        std::cin >> choice;

        if (choice == 1) {
            float nota1, nota2, nota3, nota4;
            std::cout << "Enter 4 grades: ";
            std::cin >> nota1 >> nota2 >> nota3 >> nota4;
            float med = (nota1 + nota2 + nota3 + nota4) / 4;
            std::cout << "Average: " << med << std::endl;
            if (med < 7) {
                std::cout << "You failed!" << std::endl;
            } else {
                std::cout << "You passed!" << std::endl;
            }
        } 
        else if (choice == 2) {
            float nota1, nota2;
            std::cout << "Enter 2 grades: ";
            std::cin >> nota1 >> nota2;
            float med = (nota1 + nota2) / 2;
            std::cout << "Average: " << med << std::endl;
            if (med >= 7) {
                std::cout << "Approved" << std::endl;
            } else if (med >= 3) {
                std::cout << "Exam" << std::endl;
            } else {
                std::cout << "Failed" << std::endl;
            }
        }
        else if (choice == 3) {
            float num1, num2;
            std::cout << "Enter 2 numbers: ";
            std::cin >> num1 >> num2;
            if (num1 < num2) {
                std::cout << num1 << " is the smallest" << std::endl;
            } else {
                std::cout << num2 << " is the smallest" << std::endl;
            }
        }
        else if (choice == 4) {
            float num1, num2, num3;
            std::cout << "Enter 3 numbers: ";
            std::cin >> num1 >> num2 >> num3;
            if (num1 > num2 && num1 > num3) {
                std::cout << num1 << " is the largest" << std::endl;
            } else if (num2 > num3) {
                std::cout << num2 << " is the largest" << std::endl;
            } else {
                std::cout << num3 << " is the largest" << std::endl;
            }
        }
        else if (choice == 5) {
            float num1, num2;
            std::cout << "Enter 2 numbers: ";
            std::cin >> num1 >> num2;
            int select;
            std::cout << "Choose an operation: \n"
                      << "[1] Average [2] Difference [3] Product [4] Division [5] Power [6] Square Root [7] Cube Root: ";
            std::cin >> select;
            switch (select) {
                case 1:
                    std::cout << "Average: " << (num1 + num2) / 2 << std::endl;
                    break;
                case 2:
                    std::cout << "Difference: " << fabs(num1 - num2) << std::endl;
                    break;
                case 3:
                    std::cout << "Product: " << num1 * num2 << std::endl;
                    break;
                case 4:
                    try {
                        if (num2 == 0) {
                            throw 505;
                        }
                        std::cout << "Division: " << num1 / num2 << std::endl;
                    } catch (...) {
                        std::cout << "Cannot divide by zero!" << std::endl;
                    }
                    break;
                case 5:
                    std::cout << "Power: " << pow(num1, num2) << std::endl;
                    break;
                case 6:
                    std::cout << "Square Root: " << sqrt(num1) << " and " << sqrt(num2) << std::endl;
                    break;
                case 7:
                    std::cout << "Cube Root: " << cbrt(num1) << " and " << cbrt(num2) << std::endl;
                    break;
                default:
                    std::cout << "Invalid option" << std::endl;
                    break;
            }
        }
        else if (choice == 6) {
            float acc = 0;
            float div = 19;
            int fat_alvo = 10;
            for (int num = fat_alvo; num > 0; num--, div -= 2) {
                acc += factorial(num) / div;
            }
            std::cout << "Result: " << acc << std::endl;
        }
        else if (choice == 7) {
            int ano;
            std::cout << "Enter a year: ";
            std::cin >> ano;
            if (ano % 4 == 0 && ano % 100 != 0 || ano % 400 == 0) {
                std::cout << "This year has " << 24 * 365.25 << " hours" << std::endl;
            } else {
                std::cout << "This year has " << 24 * 366 << " hours" << std::endl;
            }
        }
        else if (choice == 8) {
            int total_pacientes = 0;
            int total_homens = 0;
            int mulheres_jovens = 0;
            int total_idosos = 0;
            float percentual_meninas = 0;
            int rodando = 1;

            while (rodando == 1) {
                int idade;
                std::string sexo;
                float peso, altura;
                int acompanhante;
                std::cout << "Enter patient's age: ";
                std::cin >> idade;
                std::cout << "Enter patient's sex [F] Female [M] Male: ";
                std::cin >> sexo;
                std::cout << "Enter patient's weight: ";
                std::cin >> peso;
                std::cout << "Enter patient's height: ";
                std::cin >> altura;
                std::cout << "Does the patient have a companion? [1] Yes [0] No: ";
                std::cin >> acompanhante;

                total_pacientes += 1;
                if (sexo[0] == 'M' || sexo[0] == 'm') {
                    total_homens += 1;
                }
                if (sexo[0] == 'F' || sexo[0] == 'f') {
                    if (idade < 20 && acompanhante == 0) {
                        mulheres_jovens += 1;
                    }
                }
                if (idade >= 60) {
                    total_idosos += 1;
                }

                std::cout << "Add another patient? [1] Yes [0] No: ";
                std::cin >> rodando;
            }

            std::cout << "Total patients: " << total_pacientes << std::endl;
            std::cout << "Total males: " << total_homens << std::endl;
            std::cout << "Total elderly: " << total_idosos << std::endl;
        }
        else if (choice == 9) {
            float cidade1, cidade2;
            std::cout << "Enter mileage for the first city: ";
            std::cin >> cidade1;
            std::cout << "Enter mileage for the second city: ";
            std::cin >> cidade2;
            for (int vel = 20; vel <= 80; vel += 10) {
                std::cout << "Time at " << vel << " km/h: " << abs(cidade1 - cidade2) / vel << " hours" << std::endl;
            }
        }
        else if (choice == 10) {
            float mult;
            std::cout << "Enter a number for the multiplication table: ";
            std::cin >> mult;
            for (int i = 0; i <= 10; i++) {
                std::cout << mult << " x " << i << " = " << mult * i << std::endl;
            }
        }
        else {
            std::cout << "Invalid option, please try again." << std::endl;
        }

        std::cout << "Do you want to continue? [1] Yes [0] No: ";
        std::cin >> choice;
        if (choice == 0) break;
    }

    return 0;
}
