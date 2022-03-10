#include <stdio.h>

int main()
{
    int a;

    scanf("%d", &a);

    if (a % 2)
        a--;

    for (int i = 2; i <= a; i += 2)
    {
        printf("%d\n", i);
    }

    return 0;
}