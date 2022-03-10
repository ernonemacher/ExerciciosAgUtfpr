#include <stdio.h>

int main() {
    char string[100];
    char newString[100];

    scanf("%[^\n]s", string);

    int numeros = 0;
    int charMinusculos = 0;
    int i = 0;
    while (1) {
        char ch = string[i];
        if (ch == '\0' || ch == '@') {
            break;
        }

        if (ch >= 97 && ch <= 122) {
            newString[i] = '_';
            charMinusculos++;
        }
        else if (ch >= 48 && ch <= 57) {
            newString[i] = '*';
            numeros++;
        }
        else {
            newString[i] = string[i];
        }

        i++;
    }
    newString[i] = '\0';
    printf("%s\n", newString);
    printf("Total numericos substituidos: %d\n", numeros);
    printf("Total alfabeticos substituidos: %d\n", charMinusculos);
}