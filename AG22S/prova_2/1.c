#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <locale.h>

struct Produto {
    int codigo;
    char descricao[255];
    int estoque;
};

char path[255] = "C:\\UTF\\produtos.bin";
void cadastrar_produto(void) {
    FILE* arq;
    arq = fopen(path, "ab");

    if (arq == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        exit(1);
    }

    struct Produto produto;

    printf("Informe o código do produto:\n");
    scanf(" %d", &produto.codigo);
    printf("Informe a descrição do produto:\n");
    scanf(" %[^\n]s", produto.descricao);
    printf("Informe a quantidade em estoque do produto:\n");
    scanf(" %d", &produto.estoque);

    fwrite(&produto, sizeof(struct Produto), 1, arq);
    fclose(arq);
    system("pause");
}

void mostrar_produtos(void) {
    FILE* arq;
    arq = fopen(path, "rb");

    if (arq == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        exit(1);
    }

    struct Produto produto;

    fread(&produto, sizeof(struct Produto), 1, arq);
    while (!feof(arq)) {
        printf("Produto código: %d, descrição: %s\n", produto.codigo, produto.descricao);
        fread(&produto, sizeof(struct Produto), 1, arq);
    }
    fclose(arq);
    system("pause");
}

void mostrar_estoque(void) {
    FILE* arq;
    arq = fopen(path, "rb");

    if (arq == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        exit(1);
    }

    struct Produto produto;
    int codigo, encontrou = 0;
    printf("Informe o código do produto:\n");
    scanf(" %d", &codigo);

    fread(&produto, sizeof(struct Produto), 1, arq);
    while (!feof(arq)) {
        if (produto.codigo == codigo) {
            printf("Produto código: %d, estoque: %d\n", produto.codigo, produto.estoque);
            encontrou = 1;
            break;
        }
        fread(&produto, sizeof(struct Produto), 1, arq);
    }
    if (!encontrou)
        printf("Produto não encontrado\n");
    fclose(arq);
    system("pause");
}

int main() {
    setlocale(LC_ALL, "portuguese");

    int opcao;
    do {
        system("cls");
        printf("MENU:\n");
        printf("1 - Cadastrar produto\n");
        printf("2 - Mostrar as descricões de todos produtos\n");
        printf("3 - Mostrar a quantidade de estoque de um produto\n");
        printf("0 - Encerrar o Programa\n");
        printf("-----------------------------\n");
        printf("Informe a opção desejada:\n");
        do {
            scanf("%d", &opcao);
            if ((opcao < 0) || (opcao > 4))
                printf("Opcao invalida! Tente novamente.\n");
        } while ((opcao < 0) || (opcao > 4));

        switch (opcao) {
        case 1: cadastrar_produto(); break;
        case 2: mostrar_produtos(); break;
        case 3: mostrar_estoque(); break;
        }
    } while (opcao != 0);
}
