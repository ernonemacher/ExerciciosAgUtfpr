#include <stdio.h>

int main()
{
    int a;

    scanf("%d", &a);

    double b[a][a];

    for (int i = 0; i < a; i++)
    {
        for (int j = 0; j < a; j++)
        {
            scanf("%lf", &b[i][j]);
        }
    }

    for (int i = 0; i < a; i++)
    {
        for (int j = 0; j < a; j++)
        {
            printf("%.1lf ", b[i][j] * 2);
        }
        printf("\n");
    }
}