#include <iostream>
#include <cmath>

bool is_valid(int positions[5][5]) {
    for(int i = 0; i < 5; i++) {
        for(int j = 0; j < 5; j++) {
            if (positions[i][j] > 0) {
                for (int x = 1; x < 5; x++) {
                    for (int y = 1; y < 5; y++) {
                        if (positions[i - x][j - y] > 0 || positions[i + x][j + y] > 0) {
                            return true;
                        }
                    }
                }
            }
        }
    }
    return false;
}

void exercise_1() {
    int first_positions[5][5] = {{0, 0, 0, 0, 0}, 
                                  {0, 1, 0, 0, 0}, 
                                  {0, 0, 0, 0, 1},
                                  {0, 0, 0, 0, 0},
                                  {0, 1, 0, 0, 0}};
  
    int second_positions[5][5] = {{0, 0, 0, 0, 0}, 
                                   {0, 1, 0, 0, 0}, 
                                   {0, 0, 0, 0, 1},
                                   {0, 0, 0, 0, 0},
                                   {0, 0, 1, 0, 0}};
  
    if (is_valid(first_positions)) {
        std::cout << "There are attack positions on the first board\n";
    } else {
        std::cout << "No attack positions on the first board\n";
    }
  
    if (is_valid(second_positions)) {
        std::cout << "There are attack positions on the second board\n";
    } else {
        std::cout << "No attack positions on the second board\n";
    }
}

void exercise_2() {
    int vet[15] = {15, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1};
  
    for (int i = 0; i < 14; i++) {
        if (vet[i] > vet[i+1]) {
            int temp = vet[i];
            vet[i] = vet[i+1];
            vet[i+1] = temp;
        }
    }
  
    for (int j = 0; j < 15; j++) {
        std::cout << vet[j] << std::endl;
    }
}

void exercise_3() {
    int experimento[50] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 
                           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};
  
    bool resultado = true;
  
    for (int i = 0; i < 25; i++) {
        int pos_1 = experimento[i];
        int pos_2 = experimento[i+25];
        int erro_pos = pos_1 - pos_2;
        
        if (abs(erro_pos) > 1) {
            resultado = false;
        }
    }
  
    if (resultado) {
        std::cout << "The result was conclusive!\n";
    } else {
        std::cout << "The result was inconclusive!\n";
    }
}

int main() {
    int option;
  
    do {
        std::cout << "Select an exercise:\n";
        std::cout << "1 - Attack positions validation\n";
        std::cout << "2 - Sorting an array\n";
        std::cout << "3 - Experimental result conclusion\n";
        std::cout << "0 - Exit\n";
        std::cin >> option;
      
        switch(option) {
            case 1:
                exercise_1();
                break;
            case 2:
                exercise_2();
                break;
            case 3:
                exercise_3();
                break;
            case 0:
                std::cout << "Exiting...\n";
                break;
            default:
                std::cout << "Invalid option, please try again.\n";
        }
      
    } while (option != 0);
  
    return 0;
}
