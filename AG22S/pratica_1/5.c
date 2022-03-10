#include <stdio.h>

int main()
{
    int a;

    scanf("%d", &a);

    int b[a];

    for (int i = 0; i < a; i++)
    {
        scanf(" %d", &b[i]);
    }

    int j;
    scanf("%d", &j);

    for (int i = 0; i < j; i++)
    {
        int c;
        int bool = 1;
        scanf(" %d", &c);
        for (int i = 0; i < a; i++)
        {
            if (c == b[i])
            {
                printf("%d\n", i);
                bool = 0;
                break;
            }
        }

        if (bool)
        {
            printf("NOT FOUND\n");
        }
    }

    return 0;
}