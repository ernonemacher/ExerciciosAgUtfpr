#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    double matriz[n][n];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%lf", &matriz[i][j]);
        }
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            double sum = 0;
            for (int k = 0; k < n; k++) {
                sum = sum + matriz[i][k] * matriz[k][j];
            }
            printf("%.1lf ", sum);
        }
        printf("\n");
    }
}