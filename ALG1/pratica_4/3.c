#include <stdio.h>

int main()
{
    int a = 1, b = 1, c, d;

    scanf("%d", &d);

    d -= 3;

    printf("1\n1\n");
    for (int i = 0; i <= d; i++)
    {
        c = a + b;
        a = b;
        b = c;

        printf("%d\n", c);
    }

    return 0;
}