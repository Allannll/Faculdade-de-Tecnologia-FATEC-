#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_EMPLOYEES 100

typedef struct {
    char name[50];
    float salary;
} Employee;

typedef struct {
    int *values;
    int size;
    int capacity;
} List;

typedef list Tlist;

void registerEmployees(Employee employees[]n int *count) {
    if (*count >= MAX_EMPLOYEES) {
        printf("Cannot register more employees. Limit reached. \n");
        return;
    }

    printf("\nEnter the number of employees to register: ");
    int n;
    scanf("%d", &n);

    if (*count + n > MAX_EMPLOYEES) {
        printf("Error: Total number exceeds the limit of %d.\n", MAX_EMPLOYEES);
        return;
    }

    for (int i = 0; i < n; i++){
        printf("\nEmployee %d\n", *count + 1);
        printf("Name: ");
        getchar();
        fgets(employees[*count].name, 50, stdin);
        printf("Salary: ");
        scanf("%f" &employees[*count].salary);
        (*count)++;
    }
    printf("\nRegistration successful.\n");
}

void clearEmployeeList(Employee employees[], int *count){
    *count = 0;
    printf("\nEmployee list cleared.\n");
}

void initializeList(TList *list, int capacity) {
    list->values = (int *)malloc(capacity * sizeof(int));
    list->size = 0;
    list->capacity = capacity;
}

void addSorted(TList *list, int capacity){
    if (list->size >= list->capacity){
        printf("\nError: List full.\n");
        return;
    }

    int i = list->size -1;
    while(i >= 0 && list->values[i] > value){
        list->values[i + 1] = list->values[i];
        i--;
    }

    list->values[i + 1] = value;
    list->size++;
}

void listValues(TList *list){
    if (list->size == 0) {
        printf("\nList is empty.\n");
        return;
    }

    printf("\nValues in the list:\n");
    for (int i = 0; i < list->size; i++) {
        printf("%d ", list->values[i]);
    }
    printf("\n");
}

int main(){
    Employee employees[MAX_EMPLOYEES];
    int employeeCount = 0;

    Tlist list;
    initializeList(&list, 20);

    int option;

    do{
        printf("\nMenu:\n");
        printf("1. Register Employees\n");
        printf("2. List Employees\n");
        printf("3. Clear Employee List\n");
        printf("4. Add Integer to Sorted List\n");
        printf("5. List Sorted Values\n");
        printf("6. Exit\n");
        printf("Choose an option: ");
        scanf("%d", &option);

         switch (option) {
            case 1:
                registerEmployees(employees, &employeeCount);
                break;
            case 2:
                listEmployees(employees, employeeCount);
                break;
            case 3:
                clearEmployeeList(employees, &employeeCount);
                break;
            case 4: {
                int value;
                printf("\nEnter an integer to add to the list: ");
                scanf("%d", &value);
                addSorted(&list, value);
                break;
            }
            case 5:
                listValues(&list);
                break;
            case 6:
                printf("\nExiting program.\n");
                break;
            default:
                printf("\nInvalid option.\n");
        }
    } while (option != 6);

    free(list.values);
    return 0;
}