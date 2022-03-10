#include <stdio.h>
#include <stdlib.h>

typedef struct func {
    char id;
    float vendas;
    int filial;
} func;

func* alocar_ler(int size) {
    func* funcionarios;
    funcionarios = (func*)malloc(size * sizeof(func));
    for (int i = 0; i < size; i++) {
        scanf(" %c %f %d", &funcionarios[i].id, &funcionarios[i].vendas, &funcionarios[i].filial);
    }
    return funcionarios;
}

void imprimir(int size, struct func funcionarios[]) {
    printf("Funcionarios:\n");
    for (int i = 0; i < size; i++) {
        printf("%c %.2f %d\n", funcionarios[i].id, funcionarios[i].vendas, funcionarios[i].filial);
    }
}

void imprimir_maior_salario_filial(int size, struct func funcionarios[]) {
    float salarios[3] = { 0 , 0, 0 };

    for (int i = 0; i < size; i++) {
        int filial = funcionarios[i].filial;
        if (salarios[filial - 1] < funcionarios[i].vendas)
            salarios[filial - 1] = funcionarios[i].vendas;
    }

    printf("Maiores salarios:\n");
    for (int i = 0; i < 3; i++) {
        printf("Filial %d = %.2f\n", i + 1, salarios[i]);
    }
}

int main(void) {
    int n;
    func* funcionarios = NULL;

    scanf("%d", &n);

    funcionarios = alocar_ler(n);

    imprimir(n, funcionarios);

    imprimir_maior_salario_filial(n, funcionarios);
}