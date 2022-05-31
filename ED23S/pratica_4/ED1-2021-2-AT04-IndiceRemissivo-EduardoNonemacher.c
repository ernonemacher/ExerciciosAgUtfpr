#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

typedef struct NoArvore* PtrNoArvore;
typedef struct NoArvore {
    char chave[32];
    int paginas[20];
    // char* pages;
    PtrNoArvore direita;
    PtrNoArvore esquerda;
} NoArvore;

void iniciaArvoreBinaria(PtrNoArvore* r) {
    (*r) = NULL;
}
bool estaVaziaArvoreBinaria(PtrNoArvore* r) {
    return((*r) == NULL);
}

bool inserirArvoreBinaria(PtrNoArvore* no, char* valor) {
    if ((*no) == NULL) {
        (*no) = malloc(sizeof(NoArvore));
        strcpy((*no)->chave, valor);
        for (int i = 0; i < 20; i++) {
            (*no)->paginas[i] = -1;
        }
        // (*no)->pages = "";
        (*no)->direita = NULL;
        (*no)->esquerda = NULL;
        return (true);
    }

    int result = strcmp((*no)->chave, valor);
    if (result == 0)
        return (false);
    if (result >= 1) {
        return (inserirArvoreBinaria(&(*no)->direita, valor));
    }
    else {
        return (inserirArvoreBinaria(&(*no)->esquerda, valor));
    }
}

void EmOrdemArvoreBinaria(PtrNoArvore* no, FILE* saida) {
    if ((*no) == NULL) return;
    EmOrdemArvoreBinaria(&(*no)->esquerda, saida);
    fprintf(saida, "%s", (*no)->chave);
    for (int i = 0; i < 20; i++) {
        if ((*no)->paginas[i] > 0) {
            fprintf(saida, ",%d", (*no)->paginas[i]);
        }
    }
    fprintf(saida, "\n");
    EmOrdemArvoreBinaria(&(*no)->direita, saida);
}

void zeraString(char string[], int n) {
    for (int i = 0; i != n; i++) {
        string[i] = 0;
    }
}

char* getDataFromString(char string[], char linha[], int n, int* z, int stop) {
    zeraString(string, n);
    for (int i = 0; (linha[*z] != stop); i++) {
        string[i] = linha[*z];
        (*z)++;
    }
    return string;
}

int getQuantidadeDeTermos(char linha[]) {
    int qtdeTermos = 0;
    for (int i = 0; i < strlen(linha); i++) {
        if (linha[i] == 44) {
            qtdeTermos++;
        }
    }
    return qtdeTermos + 1;
}

bool pesquisaArvoreBinaria(PtrNoArvore* no, char* valor, int page) {
    if (*no == NULL)
        return (false);

    if (strcmp((*no)->chave, valor) == 0) {
        if ((*no)->paginas[0] == -1) {
            (*no)->paginas[0] = page;
            return (true);
        }
        else if ((*no)->paginas[0] != -1) {
            for (int i = 1; i < 20; i++) {
                if ((*no)->paginas[i] == -1) {
                    if ((*no)->paginas[i - 1] != page) {
                        (*no)->paginas[i] = page;
                        return true;
                    }
                    return (true);
                }
            }
            return (true);
        }
    }

    if (strcmp(valor, (*no)->chave) >= 1) {
        return (pesquisaArvoreBinaria(&(*no)->direita, valor, page));
    }
    else {
        return (pesquisaArvoreBinaria(&(*no)->esquerda, valor, page));
    }
}

void exitWithError(FILE* saida) {
    fflush(saida);
    char message[100] = "Arquivo Inválido!";
    fprintf(saida, "%s", message);
    printf("%s", message);
    exit(0);
}

int main(int argc, const char* argv[]) {
    // valida quantidade de parametros
    if (argc != 3) {
        exit(1);
    }

    // abre os arquivos
    FILE* entrada = fopen(argv[1], "rt");
    FILE* saida = fopen(argv[2], "wt");

    // checar erros de abertura de arquivo
    if (entrada == NULL || saida == NULL) {
        exit(1);
    }

    PtrNoArvore raiz;
    iniciaArvoreBinaria(&raiz);

    char linha[200];
    int page = 0;

    int z = 8;
    char termo[32];
    int qtdeTermos = 0;

    fgets(linha, 200, entrada);
    qtdeTermos = getQuantidadeDeTermos(linha);

    for (int i = 0; i < qtdeTermos; i++) {

        if (i == qtdeTermos - 1) {
            getDataFromString(termo, linha, 32, &z, 62);
            inserirArvoreBinaria(&raiz, termo);
        }
        else {
            getDataFromString(termo, linha, 32, &z, 44);
            inserirArvoreBinaria(&raiz, termo);
            z++;
        }
    }

    char* content;
    char* word;
    while (!feof(entrada)) {
        content = fgets(linha, 200, entrada);
        if (content) {
            if (strstr(content, "page:")) {
                page++;
            }
            else {
                word = strtok(content, " ,:;?!().\n");
                while (word) {
                    pesquisaArvoreBinaria(&raiz, word, page);
                    word = strtok(NULL, " ,:;?!().\n");
                }
            }
        }
    }


    EmOrdemArvoreBinaria(&raiz, saida);

    // fecha os arquivos utilizados
    fclose(entrada);
    fclose(saida);
    exit(0);
}