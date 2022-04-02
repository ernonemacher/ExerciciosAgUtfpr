#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#define TAMANHO 100

typedef struct {
    int vetor[TAMANHO];
    int topo;
} PilhaEstatica;

void inicializarPilhaEstatica(PilhaEstatica* p) {
    p->topo = 0;
}

bool estaVaziaPilhaEstatica(PilhaEstatica* p) {
    return(p->topo == 0);
}

bool estaCheiaPilhaEstatica(PilhaEstatica* p) {
    return(p->topo == TAMANHO);
}

void empilharPilhaEstatica(PilhaEstatica* pilha, int x) {
    if (!estaCheiaPilhaEstatica(pilha)) {
        pilha->vetor[pilha->topo] = x;
        pilha->topo++;
    }
    else {
        printf("Warning: pilha cheia!\n");
    }
}

void desempilharPilhaEstatica(PilhaEstatica* pilha) {
    if (!estaVaziaPilhaEstatica(pilha)) {
        pilha->topo--;
    }
    else {
        printf("Warning: pilha está vazia!\n");
    }
}

int topoPilhaEstatica(PilhaEstatica* pilha) {
    int ret = pilha->vetor[pilha->topo - 1];
    return(ret);
}

void DecParaBin(int num, FILE* saida) {
    PilhaEstatica pilhaBinario;
    inicializarPilhaEstatica(&pilhaBinario);
    int resto;

    // valida se o numero ja é 0 e empilha 0 para a prox etapa
    if (num == 0) {
        empilharPilhaEstatica(&pilhaBinario, 0);
    }
    // divide o numero por 2 e adiciona o resto na bilha
    // quando o num == 0 significa que a conversão terminou
    while (num != 0) {
        resto = num % 2;
        empilharPilhaEstatica(&pilhaBinario, resto);
        num /= 2;
    }

    // itera a pilha escrevendo o numero em binario no arquivo de saida
    while (!estaVaziaPilhaEstatica(&pilhaBinario)) {
        fprintf(saida, "%d", topoPilhaEstatica(&pilhaBinario));
        desempilharPilhaEstatica(&pilhaBinario);
    }
    fprintf(saida, "\n");
}

void validarEntrada(char* linha, FILE* saida) {
    for (int i = 0; i < strlen(linha); i++) {
        char ch = linha[i];
        // Valida se o caracter é um quebra de linha
        bool charQuebraLinha = ch == 10;
        // Valida se a unica coisa da linha é um quebra de linha
        bool charVazio = strlen(linha) == 1 && charQuebraLinha;
        // Valida se é um inteiro ou uma quebra de linha
        bool charNaoInteiro = (ch < 48 || ch > 57) && !charQuebraLinha;

        if (charVazio || charNaoInteiro) {
            fprintf(saida, "Arquivo inválido!\n");
            printf("Arquivo inválido!\n");
            exit(1);
        }
    }
}

int main(int argc, const char* argv[]) {
    // valida quantidade de parametros
    if (argc != 3) {
        printf("Quantidade de parametros invalida\n");
        exit(1);
    }

    // abre os arquivos
    FILE* entrada = fopen(argv[1], "r");
    FILE* saida = fopen(argv[2], "w");

    // checar erros de abertura de arquivo
    if (entrada == NULL || saida == NULL) {
        printf("Erro: algum dos arquivos não pode ser criado corretamente\n");
        exit(1);
    }

    // declara e inicializa a pilha usada para salvar os numeros da entrada
    PilhaEstatica pilhaNums;
    inicializarPilhaEstatica(&pilhaNums);

    // faz operações para validação e leitura da entrada
    char linha[100];
    while (!feof(entrada)) {
        fgets(linha, 100, entrada);
        validarEntrada(linha, saida);
        // parse da linha para int
        int num = atoi(linha);
        empilharPilhaEstatica(&pilhaNums, num);
    }

    // desempilha a pilha de numeros convertendo-os para decimal e adicionando-os no arquivo de saida
    while (!estaVaziaPilhaEstatica(&pilhaNums)) {
        DecParaBin(topoPilhaEstatica(&pilhaNums), saida);
        desempilharPilhaEstatica(&pilhaNums);
    }

    // fecha os arquivos utilizados
    fclose(entrada);
    fclose(saida);
    printf("Sucesso!");
    return 0;
}