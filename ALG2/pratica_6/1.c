int* aloca_vetor(int n) {
    return(int*)malloc(n * sizeof(int));
}

void le_elementos(int vetor[], int n) {
    for (int i = 0; i < n; i++) {
        scanf("%d", &vetor[i]);
    }
}

void print_vetor(int vetor[], int n) {
    float media = 0;
    for (int i = 0; i < n; i++) {
        int value = vetor[i];
        media += value;
        printf("v[%d]=%d\n", i, value);
    }
    media /= n;
    printf("Media=%.2f\n", media);
}