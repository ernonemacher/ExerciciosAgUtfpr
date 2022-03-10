#include <stdio.h>

int main()
{

    char a[29];
    char b[29];

    scanf("%[^\n]s", a);
    scanf(" %[^\n]s", b);

    printf("%s %s", a, b);
}