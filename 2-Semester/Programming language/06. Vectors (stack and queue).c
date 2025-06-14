#include <stdio.h>
#include <stdlib.h>

void menuStack();
void menuQueue();

int main() {
    int option;

    do {
        printf("\nMain Menu:\n");
        printf("1. Work with Stack\n");
        printf("2. Work with Queue\n");
        printf("9. Exit\n");
        printf("Choose an option: ");
        scanf("%d", &option);

        switch(option) {
            case 1:
                menuStack();
                break;
            case 2:
                menuQueue();
                break;
            case 9:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid option.\n");
                break;
        }
    } while(option != 9);

    return 0;
}

void menuStack() {
    int *stack = (int *)malloc(100 * sizeof(int));
    int top = -1;
    int option, value;

    do {
        printf("\nMenu - Stack:\n");
        printf("1. PUSH (insert)\n");
        printf("2. POP (remove)\n");
        printf("3. PRINT\n");
        printf("9. Back to Main Menu\n");
        printf("Choose an option: ");
        scanf("%d", &option);

        switch(option) {
            case 1:
                printf("Enter value to be inserted into the stack: ");
                scanf("%d", &value);
                stack[++top] = value;
                printf("Value inserted into the stack.\n");
                break;
            case 2:
                if (top >= 0) {
                    printf("Value removed from stack: %d\n", stack[top]);
                    top--;
                } else {
                    printf("The stack is empty!\n");
                }
                break;
            case 3:
                if (top >= 0) {
                    printf("Stack contents: ");
                    for (int i = top; i >= 0; i--) {
                        printf("%d ", stack[i]);
                    }
                    printf("\n");
                } else {
                    printf("The stack is empty!\n");
                }
                break;
            case 9:
                printf("Returning to Main Menu...\n");
                break;
            default:
                printf("Invalid option.\n");
                break;
        }
    } while(option != 9);

    free(stack);
}

void menuQueue() {
    int *queue = (int *)malloc(100 * sizeof(int));
    int front = 0, rear = -1, option, value;

    do {
        printf("\nMenu - Queue:\n");
        printf("1. Insert\n");
        printf("2. Remove\n");
        printf("3. PRINT\n");
        printf("9. Back to Main Menu\n");
        printf("Choose an option: ");
        scanf("%d", &option);

        switch(option) {
            case 1:
                printf("Enter value to be inserted into the queue: ");
                scanf("%d", &value);
                queue[++rear] = value;
                printf("Value inserted into the queue.\n");
                break;
            case 2:
                if (front <= rear) {
                    printf("Value removed from queue: %d\n", queue[front]);
                    front++;
                } else {
                    printf("The queue is empty!\n");
                }
                break;
            case 3:
                if (front <= rear) {
                    printf("Queue contents: ");
                    for (int i = front; i <= rear; i++) {
                        printf("%d ", queue[i]);
                    }
                    printf("\n");
                } else {
                    printf("The queue is empty!\n");
                }
                break;
            case 9:
                printf("Returning to Main Menu...\n");
                break;
            default:
                printf("Invalid option.\n");
                break;
        }
    } while(option != 9);

    free(queue);
}
