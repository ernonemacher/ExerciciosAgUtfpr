int** matriz_irregular(int n, int vetor[]) {
    int** m = (int**)malloc(n * sizeof(int*));

    for (int i = 0; i < n; i++) {
        m[i] = (int*)malloc(vetor[i] * sizeof(int));

        for (int j = 0; j < vetor[i]; j++)
            m[i][j] = vetor[i];
    }
    return m;
}