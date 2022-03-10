#include <stdio.h>

int main(void)
{
    int a[19];

    for (int i = 0; i < 20; i++)
    {
        scanf("%d", &a[i]);
    }

    for (int i = 19; i >= 0; i--)
    {
        printf("%d\n", a[i]);
    }
}