int** aloca_matriz(int n, int c) {
    int** m = (int**)malloc(n * sizeof(int*));
    for (int i = 0; i < n; i++)
        m[i] = (int*)malloc(c * sizeof(int));
    return m;
}