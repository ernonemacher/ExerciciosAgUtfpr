#include <stdio.h>

int main()
{
    double a, b, c, d, x;

    scanf("%lf%lf%lf%lf", &a, &b, &c, &d);

    x = a;

    if (a > b && a > c && a > d)
    {
        x = a;
    }
    if (b > a && b > c && b > d)
    {
        x = b;
    }
    if (c > b && c > a && c > d)
    {
        x = c;
    }
    if (d > b && d > a && d > c)
    {
        x = d;
    }

    printf("%.lf", x);

    return 0;
}