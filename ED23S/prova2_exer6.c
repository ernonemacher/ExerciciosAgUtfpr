#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

typedef struct NoArvore* PtrNoArvore;
typedef struct NoArvore {
    int numero;
    PtrNoArvore direita;
    PtrNoArvore esquerda;
} NoArvore;

void iniciaArvoreBinaria(PtrNoArvore* r) {
    (*r) = NULL;
}

bool estaVaziaArvoreBinaria(PtrNoArvore* r) {
    return ((*r) == NULL);
}

bool inserirArvoreBinaria(PtrNoArvore* no, int valor) {
    if ((*no) == NULL) {
        (*no) = malloc(sizeof(NoArvore));
        (*no)->numero = valor;
        (*no)->direita = NULL;
        (*no)->esquerda = NULL;
        return (true);
    }
    if ((*no)->numero == valor)
        return (false);

    if (valor > (*no)->numero) {
        return (inserirArvoreBinaria(&(*no)->direita, valor));
    }
    else {
        return (inserirArvoreBinaria(&(*no)->esquerda, valor));
    }
}

void EmOrdemArvoreBinaria(PtrNoArvore* no) {
    if ((*no) == NULL)
        return;
    EmOrdemArvoreBinaria(&(*no)->esquerda);
    printf("%d ", (*no)->numero);
    EmOrdemArvoreBinaria(&(*no)->direita);
}

void destroiArvore(PtrNoArvore* node) {
    if ((*node) != NULL) {
        destroiArvore(&(*node)->esquerda);
        destroiArvore(&(*node)->direita);
        free(*node);
        *node = NULL;
    }
}

void ordenaVetorUsandoArvore(int n, int* vetor) {
    PtrNoArvore raiz;
    iniciaArvoreBinaria(&raiz);

    if (n == 0) {
        printf("Vetor vazio, favor inserir elementos\n");
        return;
    }

    for (int i = 0; i < n; i++) {
        inserirArvoreBinaria(&raiz, vetor[i]);
    }

    EmOrdemArvoreBinaria(&raiz);
    destroiArvore(&raiz);
}

int main(int argc, char* argv[]) {
    // Definir tamanho do vetor e valores
    int n = 10;
    int vetor[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };

    ordenaVetorUsandoArvore(n, vetor);
    exit(0);
}