#include <stdio.h>

int main()
{
    int a = 3;

    int b[a][a];

    for (int i = 0; i < a; i++)
    {
        for (int j = 0; j < a; j++)
        {
            scanf("%d", &b[j][i]);
        }
    }

    for (int i = 0; i < a; i++)
    {
        for (int j = 0; j < a; j++)
        {
            printf("%d ", b[i][j]);
        }
        printf("\n");
    }
}