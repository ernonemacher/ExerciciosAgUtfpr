#include <stdio.h>

int main()
{
    int i = 0;
    int a;

    int bool = 1;

    while (bool)
    {
        scanf("%d", &a);
        bool = a < 3 || a > 999;

        if (bool)
            printf("Valor invalido! Tente novamente!\n");
    }

    while (i < 10)
    {
        i++;
        printf("%d X %d = %d\n", i, a, a * i);
    }

    return 0;
}