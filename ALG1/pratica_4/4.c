#include <stdio.h>

int main()
{
    int d;

    scanf("%d", &d);

    for (int i = 1; i <= d; i++)
    {
        for (int n = d; n >= 1; n--)
        {
            if (i + n <= d)
            {
                printf("%d ", i);
            }
            else
            {
                printf("- ");
            }
        }
        printf("\n");
    }

    return 0;
}