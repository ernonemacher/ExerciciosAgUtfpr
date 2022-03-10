#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <locale.h>

void cadastrar_produto(void);
void mostrar_produtos(void);
void mostrar_descricao_categoria(void);

struct Produto {
    int codigo;
    char descricao[255];
    char categoria[255];
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
    printf("Informe a categoria do produto:\n");
    scanf(" %[^\n]s", produto.categoria);
    printf("Informe a quantidade em estoque do produto:\n");
    scanf(" %d", &produto.estoque);

    int i = 0;
    while (1) {
        if (produto.descricao[i] == '\0')
            break;

        if (produto.descricao[i] >= 97 && produto.descricao[i] <= 122) {
            produto.descricao[i] += 2;
            if (produto.descricao[i] > 122)
                produto.descricao[i] -= 25;
        }


        if (produto.descricao[i] >= 65 && produto.descricao[i] <= 90) {
            produto.descricao[i] += 3;
            if (produto.descricao[i] > 90)
                produto.descricao[i] -= 25;
        }

        i++;
    }
    fwrite(&produto, sizeof(struct Produto), 1, arq);
    fclose(arq);
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
        printf("Produto código: %d, descrição: %s, categoria: %s, estoque: %d\n", produto.codigo, produto.descricao, produto.categoria, produto.estoque);
        fread(&produto, sizeof(struct Produto), 1, arq);
    }
    fclose(arq);
}

void mostrar_descricao_categoria(void) {
    FILE* arq;
    arq = fopen(path, "rb");

    if (arq == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        exit(1);
    }

    struct Produto produto;
    int encontrou = 0;
    char categoria[255];
    printf("Informe a categoria desejada:\n");
    scanf(" %[^\n]s", categoria);

    fread(&produto, sizeof(struct Produto), 1, arq);
    while (!feof(arq)) {
        if (strcmp(produto.categoria, categoria) == 0) {
            printf("%s\n", produto.descricao);
            encontrou = 1;
        }
        fread(&produto, sizeof(struct Produto), 1, arq);
    }
    if (!encontrou)
        printf("Nenhum produto encontrado\n");
    fclose(arq);
}

int main() {

    setlocale(LC_ALL, "portuguese");

    int opcao;
    do {
        printf("MENU:\n");
        printf("1 - Cadastrar produto criptografado\n");
        printf("2 - Mostrar os dados de todos produtos cadastrados criptografados\n");
        printf("3 - Mostrar as descrições dos produtos pertencentes a uma determinada categoria\n");
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
        case 3: mostrar_descricao_categoria(); break;
        }
    } while (opcao != 0);
}



// dica: use a função fread para leitura do arquivo
// dica: use a função fwrite para escrita no arquivo
