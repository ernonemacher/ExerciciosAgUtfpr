#include <stdio.h>

int main()
{
    int a, b, c, d;

    int bool = 1;

    scanf("%d%d%d%d", &a, &b, &c, &d);

    if (b > c)
    {
        if (d > a)
        {
            if (c + d > a + b)
            {
                if (c > -1 && d > -1)
                {
                    if (!(a % 2))
                    {
                        bool = 0;
                    }
                }
            }
        }
    }

    if (bool)
    {
        printf("Valores nao aceitos");
    }
    else
    {
        printf("Valores aceitos");
    }

    return 0;
}