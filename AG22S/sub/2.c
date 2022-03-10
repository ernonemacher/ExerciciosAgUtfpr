#include <stdio.h>
#include <stdlib.h>

void imprimir(int l, int c, double** notas) {
    int i, j;
    for (i = 0; i < l; i++) {
        printf("Aluno %d - ", i + 1);
        for (j = 0; j < c; j++) {
            printf("Nota %d: %2.2lf ", j + 1, notas[i][j]);
        }
        printf("\n");
    }
}

double** aloca_matriz(int num_alunos, int num_notas) {
    int i, j;
    double** notas = (double**)malloc(num_notas * sizeof(double*));

    for (i = 0; i < num_alunos; i++) {
        notas[i] = (double*)malloc(num_notas * sizeof(double));
        for (j = 0; j < num_notas; j++) {
            scanf(" %lf", &notas[i][j]);
        }
    }
    return notas;
}

void imprimir_estatisticas(int num_alunos, int num_notas, double** notas) {
    double maior = 0, menor = 11, media = 0;
    double acima[num_alunos * num_notas];

    for (int i = 0; i < num_alunos; i++) {
        for (int j = 0; j < num_notas; j++) {
            double nota = notas[i][j];
            if (nota > maior)
                maior = nota;
            if (nota < menor)
                menor = nota;
            media += nota;
        }
    }

    media /= (num_alunos * num_notas);

    printf("Maior Nota: %.2lf\n", maior);
    printf("Menor Nota: %.2lf\n", menor);
    printf("Media Turma: %.2lf\n", media);
    printf("Notas acima da media da turma: ");

    for (int i = 0; i < num_alunos; i++) {
        for (int j = 0; j < num_notas; j++) {
            double nota = notas[i][j];
            if (nota > media)
                printf("%.2lf ", nota);
        }
    }
    printf("\n");
}

int main(void) {
    double** notas = NULL;
    int i, num_alunos, num_notas;

    scanf("%d %d", &num_alunos, &num_notas);

    notas = aloca_matriz(num_alunos, num_notas);
    imprimir(num_alunos, num_notas, notas);
    imprimir_estatisticas(num_alunos, num_notas, notas);

    // liberando memoria alocada.
    for (i = 0; i < num_alunos; i++) {
        free(notas[i]);
    }
    free(notas);
}