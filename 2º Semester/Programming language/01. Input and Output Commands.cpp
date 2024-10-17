#include <stdio.h>

int main() {
    // Imprime a tabuada do 1
    printf("Tabuada do 1:\n");
    printf("1 x 1 = 1\n");
    printf("1 x 2 = 2\n");
    printf("1 x 3 = 3\n");
    printf("1 x 4 = 4\n");
    printf("1 x 5 = 5\n");
    printf("1 x 6 = 6\n");
    printf("1 x 7 = 7\n");
    printf("1 x 8 = 8\n");
    printf("1 x 9 = 9\n");
    printf("1 x 10 = 10\n");

    // Imprime a tabuada do 2
    printf("\nTabuada do 2:\n");
    printf("2 x 1 = 2\n");
    printf("2 x 2 = 4\n");
    printf("2 x 3 = 6\n");
    printf("2 x 4 = 8\n");
    printf("2 x 5 = 10\n");
    printf("2 x 6 = 12\n");
    printf("2 x 7 = 14\n");
    printf("2 x 8 = 16\n");
    printf("2 x 9 = 18\n");
    printf("2 x 10 = 20\n");

    // Imprime a tabuada do 3
    printf("\nTabuada do 3:\n");
    printf("3 x 1 = 3\n");
    printf("3 x 2 = 6\n");
    printf("3 x 3 = 9\n");
    printf("3 x 4 = 12\n");
    printf("3 x 5 = 15\n");
    printf("3 x 6 = 18\n");
    printf("3 x 7 = 21\n");
    printf("3 x 8 = 24\n");
    printf("3 x 9 = 27\n");
    printf("3 x 10 = 30\n");

    // Imprime a tabuada do 4
    printf("\nTabuada do 4:\n");
    printf("4 x 1 = 4\n");
    printf("4 x 2 = 8\n");
    printf("4 x 3 = 12\n");
    printf("4 x 4 = 16\n");
    printf("4 x 5 = 20\n");
    printf("4 x 6 = 24\n");
    printf("4 x 7 = 28\n");
    printf("4 x 8 = 32\n");
    printf("4 x 9 = 36\n");
    printf("4 x 10 = 40\n");

    return 0;
}

void ex2(){

#include <stdio.h>

int main() {
    int t1, t2, t3, t4;

    // Solicita as tabuadas ao usuário
    printf("Digite quatro números para ver suas tabuadas (por exemplo, 1 2 3 4): ");
    scanf("%d %d %d %d", &t1, &t2, &t3, &t4);

    // Função para imprimir a tabuada
    void imprimirTabuada(int num) {
        printf("\nTabuada do %d:\n", num);
        printf("%d x 1 = %d\n", num, num * 1);
        printf("%d x 2 = %d\n", num, num * 2);
        printf("%d x 3 = %d\n", num, num * 3);
        printf("%d x 4 = %d\n", num, num * 4);
        printf("%d x 5 = %d\n", num, num * 5);
        printf("%d x 6 = %d\n", num, num * 6);
        printf("%d x 7 = %d\n", num, num * 7);
        printf("%d x 8 = %d\n", num, num * 8);
        printf("%d x 9 = %d\n", num, num * 9);
        printf("%d x 10 = %d\n", num, num * 10);
    }

    // Imprime as tabuadas solicitadas pelo usuário
    imprimirTabuada(t1);
    imprimirTabuada(t2);
    imprimirTabuada(t3);
    imprimirTabuada(t4);

    return 0;
}

}