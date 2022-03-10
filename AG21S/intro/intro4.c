#include <stdio.h>

int main()
{

    double a, b, x;

    scanf("%lf %lf", &a, &b);

    switch ((int)a)
    {
    case 1:
        x = b * 4;
        break;
    case 2:
        x = b * 4.5;
        break;
    case 3:
        x = b * 5;
        break;
    case 4:
        x = b * 2;
        break;
    case 5:
        x = b * 1.5;
        break;
    default:
        printf("Codigo invalido");
        break;
    }

    if (x)
    {
        printf("Total: R$ %.2lf", x);
    }

    return 0;
}