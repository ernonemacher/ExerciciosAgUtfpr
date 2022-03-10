#include <stdio.h>

int main(void)
{
    int a;

    while (1)
    {
        scanf("%d", &a);

        if (a >= 1 && a <= 50)
        {
            break;
        }

        printf("Valor invalido! Tente novamente.\n");
    }

    for (int i = 0; i < 10; i++)
    {
        printf("N[%d] = %d\n", i, a);
        a = a * 2;
    }
}
