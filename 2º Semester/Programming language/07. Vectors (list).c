#include <stdio.h>
#include <stdlib.h>

void printList(int* list, int size) {
    if (size == 0) {
        printf("The list is empty.\n");
    } else {
        printf("List: ");
        for (int i = 0; i < size; i++) {
            printf("%d ", list[i]);
        }
        printf("\n");
    }
}

void insertValue(int** list, int* size) {
    int num, position;

    printf("Enter the number you want to insert: ");
    scanf("%d", &num);
    printf("Enter the position (0 to %d) where you want to insert the number: ", *size);
    scanf("%d", &position);

    if (position >= 0 && position <= *size) {
        *list = (int*)realloc(*list, (*size + 1) * sizeof(int));
        for (int i = *size; i > position; i--) {
            (*list)[i] = (*list)[i - 1];
        }
        (*list)[position] = num;
        (*size)++;
        printf("Number added successfully.\n");
    } else {
        printf("Invalid position.\n");
    }
}

void removeValue(int* list, int* size) {
    if (*size == 0) {
        printf("The list is empty.\n");
        return;
    }

    int position;
    printf("Enter the position (0 to %d) where you want to remove: ", *size - 1);
    scanf("%d", &position);

    if (position >= 0 && position < *size) {
        for (int i = position; i < *size - 1; i++) {
            list[i] = list[i + 1];
        }
        (*size)--;
        list = (int*)realloc(list, *size * sizeof(int));
        printf("Number removed successfully.\n");
    } else {
        printf("Invalid position.\n");
    }
}

int main() {
    int* list = NULL;
    int size = 0;
    int option;

    do {
        printf("\nMenu:\n");
        printf("1. Insert number\n");
        printf("2. Remove number\n");
        printf("3. Print list\n");
        printf("0. Exit\n");
        printf("Choose an option: ");
        scanf("%d", &option);

        switch (option) {
            case 1:
                insertValue(&list, &size);
                break;
            case 2:
                removeValue(list, &size);
                break;
            case 3:
                printList(list, size);
                break;
            case 0:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid option.\n");
        }
    } while (option != 0);

    free(list);
    return 0;
}
