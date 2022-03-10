#include <stdio.h>

int main()
{
    int i = -110;
    int a;

    while (1)
    {
        scanf("%d", &a);

        if (a == 0)
            break;

        if ((a < -100 || a > 100))
        {
            printf("Valor invalido! Tente novamente!\n");
        }
        else
        {
            if (a > i)
                i = a;
        }
    }

    printf("%d\n", i);

    return 0;
}