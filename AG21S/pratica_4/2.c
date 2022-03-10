#include <stdio.h>

int main()
{
    int a = 0, b, c;

    for (int i = 1; i <= 10; i++)
    {
        scanf("%d", &c);

        if (c > a)
        {
            a = c;
            b = i;
        }
    }

    printf("%d\n%d", a, b);

    return 0;
}