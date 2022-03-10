#include <stdio.h>

int main()
{
    int a;

    scanf("%d", &a);

    double b[a];
    for (int i = 0; i < a; i++)
    {
        double c;
        scanf("%lf", &c);
        if (!((int)c % 2))
        {
            b[i] = c;
        }
        else
        {
            b[i] = 0;
        }
    }

    for (int i = 0; i < a; i++)
    {
        if (b[i] != 0)
        {
            printf("V[%d] = %.lf\n", i, b[i]);
        }
    }

    return 0;
}