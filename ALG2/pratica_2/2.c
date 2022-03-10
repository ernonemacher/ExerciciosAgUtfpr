#include <stdio.h>

int main()
{

    char a[29];

    scanf("%[^\n]s", a);

    int b = 0;
    while (1)
    {
        char ch = a[b];
        if (ch == '\0')
        {
            break;
        }

        if (ch == 'a' || ch == 'A' || ch == 'e' || ch == 'E' || ch == 'i' || ch == 'I' || ch == 'o' || ch == 'O' || ch == 'u' || ch == 'U')
        {
            a[b] = '_';
        }
        b++;
    }
    printf("%s", a);
}