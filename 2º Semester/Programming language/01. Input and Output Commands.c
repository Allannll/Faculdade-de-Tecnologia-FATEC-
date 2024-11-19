#include <stdio.h>
//
void printMultiplicationTable(int num) {
    printf("\nMultiplication Table of %d:\n", num);
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

int main() {
    int t1, t2, t3, t4;

    printf("Enter four numbers to see their multiplication tables (for example, 1 2 3 4): ");
    scanf("%d %d %d %d", &t1, &t2, &t3, &t4);

    printMultiplicationTable(t1);
    printMultiplicationTable(t2);
    printMultiplicationTable(t3);
    printMultiplicationTable(t4);

    return 0;
}
