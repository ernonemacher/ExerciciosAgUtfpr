#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);

    int mat[n][n];
    int vet[n];

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &mat[i][j]);
        }
    }

    for (int i = 0; i < n; i++) {
        int sum = 0;
        for (int j = 0; j < n; j++) {
            sum += mat[j][i];
        }
        vet[i] = sum;
        printf("Soma da coluna %d = %d\n", i, sum);
    }

    for (int i = 0; i < n; i++) {
        printf("Multiplica coluna %d = %d\n", i, vet[i] * mat[i][i]);
    }
}