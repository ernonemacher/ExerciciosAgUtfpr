#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

typedef struct NoPilha* PtrNoPilha;

struct NoPilha {
    char elemento;
    PtrNoPilha proximo;
} NoPilha;

typedef struct {
    PtrNoPilha topo;
    int qtde;
} PilhaDinamica;

void iniciaPilhaDinamica(PilhaDinamica* p) {
    p->qtde = 0;
    p->topo = NULL;
}

bool estaVaziaPilhaDinamica(PilhaDinamica* p) {
    return(p->topo == NULL);
}

int tamanhoPilhaDinamica(PilhaDinamica* p) {
    return(p->qtde);
}

void pushPilhaDinamica(PilhaDinamica* p, char elemento) {
    PtrNoPilha Aux = malloc(sizeof(NoPilha));
    Aux->elemento = elemento;
    Aux->proximo = p->topo;
    p->topo = Aux;
    p->qtde++;
}

char popPilhaDinamica(PilhaDinamica* p) {
    if (!estaVaziaPilhaDinamica(p)) {
        PtrNoPilha aux;
        aux = p->topo;
        char element = aux->elemento;
        p->topo = p->topo->proximo;
        free(aux);
        p->qtde--;
        return element;
    }
    else {
        printf("Warning: pilha está vazia!\n");
        return ' ';
    }
}

void exitWithError(FILE* saida) {
    // Limpa a saida e printa Expressão inválida
    fprintf(saida, "Expressão inválida!\n");
    printf("Expressão inválida!\n");
    exit(1);
}

int main(int argc, char* argv[]) {
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

    PilhaDinamica pilha;
    iniciaPilhaDinamica(&pilha);

    int tempCounter = 0;

    char linha[100];
    fgets(linha, 100, entrada);

    for (int i = 0; i < strlen(linha); i++) {
        char ch = linha[i];

        if (ch >= 'A' && ch <= 'Z') {
            pushPilhaDinamica(&pilha, ch);
        }
        else if ((ch == '+' || ch == '-' || ch == '*' || ch == '/') && tamanhoPilhaDinamica(&pilha) >= 2) {
            char number1 = popPilhaDinamica(&pilha);
            char number2 = popPilhaDinamica(&pilha);

            if (number1 && number2) {
                fprintf(saida, "LDR ");
                printf("LDR ");
                if (number1 >= 'A' && number1 <= 'Z') {
                    fprintf(saida, "%c\n", number1);
                    printf("%c\n", number1);
                }
                else {
                    fprintf(saida, "TEMP%c\n", number1);
                    printf("TEMP%c\n", number1);
                }

                fprintf(saida, "LDR ");
                printf("LDR ");
                if (number2 >= 'A' && number2 <= 'Z') {
                    fprintf(saida, "%c\n", number2);
                    printf("%c\n", number2);
                }
                else {
                    fprintf(saida, "TEMP%c\n", number2);
                    printf("TEMP%c\n", number2);
                }

                tempCounter++;

                switch (ch) {
                case '+':
                fprintf(saida, "ADD ");
                printf("ADD ");
                break;
                case '-':
                fprintf(saida, "SUB ");
                printf("SUB ");
                break;
                case '*':
                fprintf(saida, "MUL ");
                printf("MUL ");
                break;
                case '/':
                fprintf(saida, "DIV ");
                printf("DIV ");
                break;
                default:
                break;
                }

                if (!(number1 >= 'A' && number1 <= 'Z')) {
                    fprintf(saida, "TEMP");
                    printf("TEMP");
                }
                fprintf(saida, "%c", number1);
                printf("%c", number1);

                if (!(number2 >= 'A' && number2 <= 'Z')) {
                    fprintf(saida, " TEMP");
                    printf(" TEMP");
                }
                fprintf(saida, " %c\n", number2);
                printf(" %c\n", number2);

                if (i + 1 < strlen(linha)) {
                    pushPilhaDinamica(&pilha, tempCounter + '0');
                    fprintf(saida, "STR TEMP%d\n", tempCounter);
                    printf("STR TEMP%d\n", tempCounter);
                }
            }
            else {
                exitWithError(saida);
            }
        }
        else {
            exitWithError(saida);
        }
    }

    if (!estaVaziaPilhaDinamica(&pilha)) {
        exitWithError(saida);
    }

    // fecha os arquivos utilizados
    fclose(entrada);
    fclose(saida);
    printf("Sucesso!");
    exit(0);
}