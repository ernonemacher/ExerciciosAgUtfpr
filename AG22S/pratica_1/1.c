#include <stdio.h>

int main()
{
    int a;

    scanf("%d", &a);

    double b[a];
    for (int i = 0; i < a; i++)
    {
        scanf("%lf", &b[i]);
    }

    for (int i = 0; i < a; i++)
    {
        printf("V[%d] = %.1lf\n", i, b[i]);
    }

    for (int i = a - 1; i >= 0; i--)
    {
        printf("V[%d] = %.1lf\n", i, b[i]);
    }

    return 0;
}