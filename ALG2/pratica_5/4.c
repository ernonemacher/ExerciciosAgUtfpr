char* achar(int* start, char frase[]) {
    int i = *start;
    while (frase[i] != '\0') {
        char a = frase[i];
        if (a == 'a' || a == 'A' || a == 'e' || a == 'E' || a == 'i' ||
            a == 'I' || a == 'o' || a == 'O' || a == 'u' || a == 'U') {
            return &frase[i];
        }
        i++;
    }
    return &frase[i - 1];
}