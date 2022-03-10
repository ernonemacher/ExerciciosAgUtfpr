#include <stdio.h>
#include <math.h>

int main()
{
    int a;

    scanf("%d", &a);

    double b[a];
    double c[a];
    double d = 0;

    for (int i = 0; i < a; i++)
    {
        scanf(" %lf", &b[i]);
    }

    for (int i = 0; i < a; i++)
    {
        scanf(" %lf", &c[i]);
        d += pow(b[i], c[i]);
    }

    printf("%.0lf", d);

    return 0;
}