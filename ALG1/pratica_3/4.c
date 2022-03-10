#include <stdio.h>

int main()
{
    int a;

    while (1)
    {
        scanf("%d", &a);

        if (a == -101)
            break;

        if ((a < -100 || a > 100))
        {
            printf("Valor invalido! Tente novamente!\n");
        }
        else if (a == 0)
        {
            printf("NULL\n");
        }
        else
        {
            if (a % 2)
            {
                printf("ODD ");
            }
            else
            {
                printf("EVEN ");
            }
            if (a > 0)
            {
                printf("POSITIVE\n");
            }
            else
            {
                printf("NEGATIVE\n");
            }
        }
    }

    return 0;
}