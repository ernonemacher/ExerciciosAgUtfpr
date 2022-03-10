#include <stdio.h>

int main()
{
    int a;

    scanf("%d", &a);

    double b[a];
    for (int i = 0; i < a; i++)
    {
        double c;
        scanf("%lf", &c);
        b[i] = c;
    }

    float d;
    scanf("%f", &d);
    for (int i = 0; i < a; i++)
    {
        if ((float)b[i] < d)
        {
            printf("V[%d] = %.2lf\n", i, b[i]);
        }
    }

    return 0;
}