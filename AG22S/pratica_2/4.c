#include <stdio.h>
#include <ctype.h>

int main()
{
    char a[255];

    scanf("%[^\n]s", a);

    int b = 0;
    while (1)
    {
        char ch = a[b];
        if (ch == '\0')
        {
            break;
        }

        if (ch >= 61 && ch < 122)
        {
            a[b] = toupper(ch + 1);
        }
        else if (ch == 122)
        {
            a[b] = toupper('a');
        }
        b++;
    }
    printf("%s", a);
}