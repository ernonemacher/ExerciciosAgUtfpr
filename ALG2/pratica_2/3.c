#include <stdio.h>

int main()
{
    int a;
    scanf("%d", &a);

    int b[a];
    for (int i = 0; i < a; i++)
    {
        scanf("%d", &b[i]);
    }

    char c[60];
    scanf(" %[^\n]s", c);

    char d[a];
    for (int i = 0; i < a; i++)
    {
        d[i] = c[b[i]];
    }
    d[a] = '\0';
    printf("%s", d);
}