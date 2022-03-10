#include <stdio.h>

int main()
{
    double a;

    scanf("%lf", &a);

    if (a >= 0 && a <= 25)
    {
        printf("[0,25]");
    }
    else if (a >= 0 && a <= 50)
    {
        printf("(25,50]");
    }
    else if (a >= 0 && a <= 75)
    {
        printf("(50,75]");
    }
    else if (a >= 0 && a <= 100)
    {
        printf("(75,100]");
    }
    else
    {
        printf("Fora de intervalo");
    }

    return 0;
}