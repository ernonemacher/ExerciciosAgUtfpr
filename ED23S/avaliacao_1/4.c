#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h> 
#define SIZE 5

typedef struct NoLista* PtrNoLista;

typedef struct NoLista {
    int chave;
    PtrNoLista proximo;
} NoLista;

typedef struct {
    PtrNoLista inicio;
    int qtdeElementos;
} Lista;

void iniciaListaOrdenada(Lista* lista) {
    lista->inicio = NULL;
    lista->qtdeElementos = 0;
}

bool estaVaziaListaOrdenada(Lista* lista) {
    return(lista->inicio == NULL);
}

int tamanhoListaOrdenada(Lista* lista) {
    return(lista->qtdeElementos);
}

void imprimeListaOrdenada(Lista* lista) {
    printf("Lista = [");
    PtrNoLista aux;
    for (aux = lista->inicio; aux != NULL; aux = aux->proximo) {
        printf("%d ", aux->chave);
    }
    printf("]\n");
}

void inserirListaOrdenada(Lista* lista, int valor) {
    PtrNoLista novo = malloc(sizeof(NoLista));
    novo->chave = valor;

    if (estaVaziaListaOrdenada(lista)) {
        lista->inicio = novo;
        novo->proximo = NULL;
    }
    else if (valor < lista->inicio->chave) {
        novo->proximo = lista->inicio;
        lista->inicio = novo;
    }
    else {
        PtrNoLista aux = lista->inicio;
        while (aux->proximo != NULL && valor > aux->proximo->chave) {
            aux = aux->proximo;
        }
        novo->proximo = aux->proximo;
        aux->proximo = novo;
    }
    lista->qtdeElementos++;
}


bool removerListaOrdenada(Lista* lista, int valor) {
    PtrNoLista rm;
    if (estaVaziaListaOrdenada(lista) || valor < lista->inicio->chave) {
        return false;
    }

    if (valor == lista->inicio->chave) {
        rm = lista->inicio;
        lista->inicio = lista->inicio->proximo;
        free(rm);
        lista->qtdeElementos--;
        return true;
    }

    PtrNoLista aux = lista->inicio;
    while (aux->proximo != NULL && valor > aux->proximo->chave) {
        aux = aux->proximo;
    }

    if (aux->proximo == NULL || aux->proximo->chave > valor) {
        return false;
    }
    rm = aux->proximo;
    aux->proximo = aux->proximo->proximo;
    lista->qtdeElementos--;
    return true;
}

Lista* constroi(int n, int* v) {
    Lista l;
    Lista* lista = &l;
    iniciaListaOrdenada(lista);
    for (int i = 0; i < n; i++) {
        //printf("%d\n", v[i]);
        inserirListaOrdenada(lista, v[i]);
    }
    return lista;
}

int main(int argc, const char* argv[]) {
    int v[SIZE] = { 1, 2, 3, 4, 5 };
    Lista lista;
    lista = *constroi(SIZE, v);
    //printf("%d\n", l->inicio->chave);
    imprimeListaOrdenada(&lista);
    return 0;
}
