#include <stdio.h>

int main()
{
    int i = 0;
    int a;

    int bool = 1;

    while (bool)
    {
        scanf("%d", &a);
        bool = a < 6 || a > 1998;

        if (bool)
            printf("Valor invalido! Tente novamente!\n");
    }

    if (a % 2)
        a -= 1;

    while (i < a)
    {
        i += 2;
        printf("%d^2 = %d\n", i, i * i);
    }

    return 0;
}