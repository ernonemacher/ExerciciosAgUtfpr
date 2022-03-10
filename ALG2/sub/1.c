#include <stdio.h>

struct atleta {
    char nome[255];
    float salto1;
    float salto2;
    float salto3;
};

void ler_salto(struct atleta atletas[], int size) {
    for (int i = 0; i < size; i++) {
        struct atleta atleta;
        scanf(" %[^\n]s", atleta.nome);
        scanf(" %f", &atleta.salto1);
        scanf(" %f", &atleta.salto2);
        scanf(" %f", &atleta.salto3);
        atletas[i] = atleta;
    }
}

void exibir_marcas(struct atleta atletas[], int size) {
    for (int i = 0; i < size; i++) {
        struct atleta atleta = atletas[i];
        float melhorSalto = 0;

        if (atleta.salto1 > melhorSalto)
            melhorSalto = atleta.salto1;

        if (atleta.salto2 > melhorSalto)
            melhorSalto = atleta.salto2;

        if (atleta.salto3 > melhorSalto)
            melhorSalto = atleta.salto3;

        printf("%s %.2f - %.2f - %.2f, melhor marca: %.2f\n", atleta.nome, atleta.salto1, atleta.salto2, atleta.salto3, melhorSalto);
    }
}

int main() {
    int n;
    scanf("%d", &n);
    struct  atleta at[n];
    ler_salto(at, n);
    exibir_marcas(at, n);
}
