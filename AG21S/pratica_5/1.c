#include <stdio.h>

int main(void)
{
    int a[9];

    for (int i = 0; i < 10; i++)
    {
        scanf("%d", &a[i]);
    }

    for (int i = 9; i >= 0; i--)
    {
        if (a[i] >= 10)
        {
            printf("A[%d] = %d\n", i, a[i]);
        }
    }
}