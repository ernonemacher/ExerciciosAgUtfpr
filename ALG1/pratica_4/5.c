#include <stdio.h>

int main()
{
    int a, b, c = 0;

    scanf("%d %d", &a, &b);

    if (b > a)
    {
        int d = b;
        b = a;
        a = d;
    }

    for (int i = b; i <= a; i++)
    {
        c += i;
        printf("%d ", i);
    }
    printf("\nSoma = %d", c);

    return 0;
}