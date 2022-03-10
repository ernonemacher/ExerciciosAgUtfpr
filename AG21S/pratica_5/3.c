#include <stdio.h>

int main(void)
{
    int a;

    while (1)
    {
        scanf("%d", &a);

        if (a >= 2 && a <= 5)
        {
            break;
        }

        printf("Valor invalido! Tente novamente.\n");
    }

    for (int i = 0; i < 50; i++)
    {
        int c = i;
        if (i >= a)
        {
            c = i - (a * (i / a));
        }
        printf("N[%d] = %d\n", i, c);
    }
}
