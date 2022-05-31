#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

char* concat(char* s1, char* s2) {
    char* result = malloc(strlen(s1) + strlen(s2) + 1);
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

void zeraString(char string[], int n) {
    for (int i = 0; i != n; i++) {
        string[i] = 0;
    }
}

void getDataFromString(char string[], char Line[], int n, int* z, int stop) {
    zeraString(string, n);
    for (int i = 0; (Line[*z] != stop); i++) {
        string[i] = Line[*z];
        (*z)++;
    }
}

// PtrNoArvore = NoArvore* -> PtrNoArvore
typedef struct NoArvore* PtrNoArvore;
// NoArvore
typedef struct NoArvore {
    // int chave; // valor armazenado
    char chave[32];
    char* pages;
    PtrNoArvore direita;
    PtrNoArvore esquerda;
} NoArvore;

typedef struct Term {
    // int chave; // valor armazenado
    char* termo;
    int id;
} Term;


// ---------------------------------------
// ---------------------------------------

// destruição
// remover (Aula especifica)
// pesquisar
// maximo (int) * | rec | iterativo (while)
// minimo (int) * | rec | iterativo (while)
// tamanho (int) *
// percurso (em ordem, pre ordem, pos Ordem)
// ---------------------------------------
// ---------------------------------------
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

        (*no)->pages = "";

        (*no)->direita = NULL;
        (*no)->esquerda = NULL;
        return (true);
    }

    if (strcmp((*no)->chave, valor) == 0)
        return (false);

    if (strcmp(valor, (*no)->chave) == 1) {
        return (inserirArvoreBinaria(&(*no)->direita, valor));
    }
    else {
        return (inserirArvoreBinaria(&(*no)->esquerda, valor));
    }
}

// print, dir, esq
//PREORDEM
// 1 Printa
// 2 PREORDEM(Esq)
// 3 PREORDEM(Dir)
void PreOrdemArvoreBinaria(PtrNoArvore* no) {
    if ((*no) == NULL) return; //clausula base    
    PreOrdemArvoreBinaria(&(*no)->esquerda);
    PreOrdemArvoreBinaria(&(*no)->direita);
}

void PreOrdemPrincipal(PtrNoArvore* no) {
    PreOrdemArvoreBinaria(&(*no));
}

//EMORDEM
// 1 EMORDEM(Esq)
// 2 Printa
// 3 EMORDEM(Dir)
void EmOrdemArvoreBinaria(PtrNoArvore* no, FILE* saida) {
    if ((*no) == NULL) return;

    EmOrdemArvoreBinaria(&(*no)->esquerda, saida);

    printf("%s\n", (*no)->chave);
    // printf("%s\n", (*no)->pages);
    // fprintf(saida, "%s%s\n", (*no)->chave, (*no)->pages);

    EmOrdemArvoreBinaria(&(*no)->direita, saida);
}

// void EmOrdemPrincipal(PtrNoArvore* no) {
//     EmOrdemArvoreBinaria(&(*no));
// }

//POSORDEM
//1. POSORDEM(Esq)
//2. POSORDEM(Dir)
//3. Printa

bool pesquisaArvoreBinaria(PtrNoArvore* no, char* valor, char* page) {
    // clausulas base - recursao
    // se o elemento nao existir -> false [ ptr == NULL] [X]
    if ((*no) == NULL) return false;
    // se existir o elemento -> true [X]
    if (!strcmp((*no)->chave, valor)) {
        if (!strstr((*no)->pages, page)) {
            char vir[2] = ",";
            (*no)->pages = concat((*no)->pages, vir);
            (*no)->pages = concat((*no)->pages, page);
        }
        return true;
    };
    // recursiva
    if (valor > (*no)->chave) {
        return(pesquisaArvoreBinaria(&(*no)->direita, valor, page));
    }
    else { // <
        return(pesquisaArvoreBinaria(&(*no)->esquerda, valor, page));
    }
}


PtrNoArvore pegarMaiorElemento(PtrNoArvore* no) {
    // vai ter que andar p direita, até que ...
    // o ultimo nó aponte para nulo (dir)
    while ((*no)->direita != NULL) {
        (*no) = (*no)->direita;
    }
    // terminou o while, (*no) contém o maior elemento
    // esse cara é quem a gente precisa retornar
    PtrNoArvore ret = (*no);
    (*no) = (*no)->esquerda; // NULL ou não NULL
    return(ret);
}


//          f_aux = menor da subarvore dir (ref)
//                 salvar em um ptr (return)
//                 no = no->dir
// ---------------------------------------
// ---------------------------------------

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
    FILE* entrada = fopen(argv[1], "r");
    FILE* saida = fopen(argv[2], "w");

    // checar erros de abertura de arquivo
    if (entrada == NULL || saida == NULL) {
        exit(1);
    }

    PtrNoArvore raiz;
    iniciaArvoreBinaria(&raiz);

    // le termos
    char termsLine[500];
    fgets(termsLine, 500, entrada);

    int qtdeTermos = 1;
    for (int i = 0; i < strlen(termsLine); i++) {
        if (termsLine[i] == ',') qtdeTermos++;
    }

    int z = 8;
    char termo[32];
    for (int i = 0; i < qtdeTermos; i++) {
        if (i == qtdeTermos - 1) {
            getDataFromString(termo, termsLine, 32, &z, 62);
            printf("%s\n", termo);
            inserirArvoreBinaria(&raiz, termo);
        }
        else {
            getDataFromString(termo, termsLine, 32, &z, 44);
            printf("%s\n", termo);
            inserirArvoreBinaria(&raiz, termo);
            z++;
        }
    }
    printf("\n");

    // char linha[500];
    // int page = -1;
    // while (!feof(entrada)) {
    //     fgets(linha, 500, entrada);
    //     if (strstr(linha, "page:")) page++;
    //     else {
    //         char currentPage[2] = { page + 1 + '0' };
    //         char* res = strtok(linha, " .,:;!?()\n");
    //         while (res) {
    //             if (pesquisaArvoreBinaria(&raiz, res, currentPage)) {
    //                 //TODO
    //             }
    //             res = strtok(NULL, " .,:;!?()\n");
    //         }
    //     }
    // }
    EmOrdemArvoreBinaria(&raiz, saida);

    // fecha os arquivos utilizados
    fclose(entrada);
    fclose(saida);
    exit(0);
}