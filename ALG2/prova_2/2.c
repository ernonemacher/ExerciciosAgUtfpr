#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <locale.h>

struct vaca {
    char nome[255];
    float litrosManha;
    float litrosTarde;
};

void ler_leite(struct vaca vacas[], int size) {
    for (int i = 0; i < size; i++) {
        struct vaca vaca;
        scanf(" %[^\n]s", vaca.nome);
        scanf(" %f", &vaca.litrosManha);
        scanf(" %f", &vaca.litrosTarde);
        vacas[i] = vaca;
    }
}

void mostrar_producao(struct vaca vacas[], int size) {
    float total = 0;
    for (int i = 0; i < size; i++) {
        struct vaca vaca = vacas[i];
        total += vaca.litrosManha;
        total += vaca.litrosTarde;
        printf("%s - litros manha: %.1f, litros tarde: %.1f - Total no dia: %.1f\n", vaca.nome, vaca.litrosManha, vaca.litrosTarde, vaca.litrosManha + vaca.litrosTarde);
    }
    printf("Total de leite produzido no dia (litros): %.1f\n", total);
    printf("Media de litros de leite produzido por animal: %.3f\n", total / size);
}

int main() {
    setlocale(LC_ALL, "portuguese");
    int n;
    scanf(" %d", &n);
    struct vaca vc[n];
    ler_leite(vc, n);
    mostrar_producao(vc, n);
}
