char string[100];
#include <string.h>  


void inverter(int n) {
    int i, len, temp;
    len = strlen(string);


    for (i = 0; i < len / 2; i++)     {
        temp = string[i];
        string[i] = string[len - i - 1];
        string[len - i - 1] = temp;
    }
    printf("%s", string);
}