#include <stdio.h>
#include <ctype.h>

int main()
{

    char a;

    scanf("%c", &a);

    switch (toupper(a))
    {
    case 'A':
        printf("Excelente! Parabens!");
        break;
    case 'B':
        printf("Voce foi bem.");
        break;
    case 'C':
        printf("Voce foi bem.");
        break;
    case 'D':
        printf("Foi por muito pouco!");
        break;
    case 'F':
        printf("Estudar mais na proxima.");
        break;
    default:
        printf("Valor invalido.");
        break;
    }

    return 0;
}