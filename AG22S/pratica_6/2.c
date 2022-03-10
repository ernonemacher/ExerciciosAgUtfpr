int** aloca_matriz_quadrada(int n) {
    int** m = (int**)malloc(n * sizeof(int*));
    if (m == NULL)
        return NULL;

    for (int i = 0; i < n; i++) {
        m[i] = (int*)malloc(n * sizeof(int));
        if (m[i] == NULL) {
            while (i) {
                i--;
                free(m[i]);
            }
            free(m);
            return NULL;
        }
    }
    return m;
}