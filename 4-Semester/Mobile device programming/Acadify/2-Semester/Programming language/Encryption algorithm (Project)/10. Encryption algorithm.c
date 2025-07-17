#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FILENAME "text.txt"

void encryption (char *text){
    for (int i = 0; i < strlen(text); i++){
        if  ((text[i] >= 'a' && text[i] <= 'z')){
            text[i] = ((text[i] - 'a' + 3) % 26) + 'a';
        }else if ((text[i] >= 'A' && text[i] <= 'Z')){
            text[i] = ((text[i] - 'A' + 3)  % 26) + 'A';
        }
    }
}

void decrypt (char *text){
    for (int i = 0; i < strlen(text); i++){
        if  ((text[i] >= 'a' && text[i] <= 'z')){
            text[i] = ((text[i] - 'a' - 3 + 26) % 26) + 'a';
        }else if ((text[i] >= 'A' && text[i] <= 'Z')){
            text[i] = ((text[i] - 'A' - 3 + 26)  % 26) + 'A';
        }
    }
}

void readFile (char *buffer, size_t size){
    FILE *archive = fopen (FILENAME, "r");
    if (archive == NULL){
        printf("No file selected!\n");
        exit (1);
    }
    fgets(buffer, size, archive);
    fclose(archive);
}

void writeFile (const char *text){
    FILE *archive = fopen(FILENAME, "w");
    if (archive == NULL){
        printf("Error oppening file!");
        exit(1);
    }
    fprintf(archive, "%s", text);
    fclose(archive);
}

int main(){

    char text[1024];
    int option;

    do {
        printf("\nMenu:\n");
        printf("1- Encryption text\n");
        printf("2- Decrypt text\n");
        printf("3- Show text\n");
        printf("9- Exit\n");
        printf("Select an option: ");
        scanf("%d", &option);
        getchar();

        switch(option){
            case 1:
                readFile(text, sizeof(text));
                encryption(text);
                writeFile(text);
                printf("Text encrypted successfully!");
            break;

            case 2:
                readFile(text, sizeof(text));
                decrypt(text);
                writeFile(text);
                printf("Text decrypted successfully!");
            break;

            case 3:
                readFile(text, sizeof(text));
                printf("File text: %s\n", text);
            break;

            case 9:
                printf("Leaving...\n");
            break;

            default: 
                printf("Invalid option! Try another.\n");
        }
    } while (option != 9);
    return 0;
} 