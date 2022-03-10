void decodificar(int pos[], int size, char frase[]) {

    char a[size];
    char* b = frase;

    int i = 0;
    for (; i < size; i++) {
        b += pos[i];
        a[i] = *b;
    }

    a[i] = '\0';
    printf("%s", a);
}