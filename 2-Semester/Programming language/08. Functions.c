#include <stdio.h>
#include <math.h>

#define lines 3
#define columns 3


    double CalculateDelta(double A, double B, double C){
        return B*B-4*A*C;
    }

    double Roots(double A, double B, double delta, double *x1, double *x2 ){
        *x1 =  (-B + sqrt(delta))/(2*A);
        *x2 =  (-B-sqrt(delta))/(2*A);
    }
     

    double CalculateVx(double A, double B){
        return -(B/(2*A));
    }

    double CalculateVy(double A, double delta){
        return -(delta / (4*A));
    }

        void mainEx1(){

        double A, B, C;

        printf("Enter the values of A, B e C: ");
        scanf("%lf %lf %lf", &A, &B, &C);

        double delta = CalculateDelta(A, B, C);
        double x1, x2;  
        Roots(A, B, C, &x1, &x2);
        double vx = CalculateVx(A, B);
        double vy = CalculateVy(A, delta);

        printf("Delta: %.2lf\n", delta);
        printf("x1: %.2lf\n", x1);
        printf("x2: %.2lf\n", x2);
        printf("Vértice (Vx): %.2lf\n", vx);
        printf("Vértice (Vy): %.2lf\n", vy);

    }

//===============================================Ex 2==========================================================================//
    void showMenuEx2(){
    printf("1. Register data \n");
    printf("2. Show data \n");
    printf("3. Calculate sum \n");
    printf("4. Leave \n");
    }

    void registerData(double matrice[lines][columns]){
        printf("Enter the values for the matrices %dx%d: \n", lines, columns);
        
        for (int i = 0; i < lines; i++){
            for (int j = 0; j < columns; j++){
                printf("Element [%d][%d]: ", i, j);
                scanf("%f", & matrice[i][j]);
            }
        }
    }

    void showData(double matrice[lines][columns]){
        printf("Matrice: \n");

        for (int i = 0; i < lines; i++){
            for (int j = 0; j < columns; j++){
                printf("%.2lf ", matrice[i][j]);
            }
            printf("\n");
        }
    }

    double calculateSum(double matrice[lines][columns]){
        double sum = 0.0;

        for (int i = 0; i < lines; i++){
            for (int j = 0; j <  columns;    j++){
                sum += matrice[i][j];
            }
        }
        return sum;
    }

    void MainMenu(){
        printf("Exercises on functions \n \n");
        printf("1. Exercice 1 \n"); 
        printf("2. Exercice 2\n"); 
        printf("3. Leave\n"); 
    }  

    void mainEx2(){
        double matrice[lines][columns];
        int option;

        do {
            printf("Chose a option:  \n\n");
            showMenuEx2();
            scanf("%d", &option);

            switch (option){
                case 1:
                    registerData(matrice);
                break;

                case 2:
                    showData(matrice);
                break;

                case 3:
                    printf("Sum of data: %.2lf\n", calculateSum(matrice));
                break;

                case 4:
                    printf("Leaving...\n");
                break;

                default:
                    printf("Invalid option!\n");
                }
        }while (option != 4);

    }

    int main(){

        int option;

        do{
            MainMenu();
            printf("Chose a option: ");
            scanf("%d", &option);

            switch (option){

                case 1:
                    mainEx1();
                break;

                case 2:
                    mainEx2();
                break;
                    printf("Leaving...\n");
                case 3:

            }

        }while (option != 3);

        return 0;

    }