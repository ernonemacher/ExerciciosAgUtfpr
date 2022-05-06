#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

struct Paciente {
    int codigo;
    char nome[100];
    char sexo;
    int idade;
    char peso[100];
    char altura[100];
    char telefone[100];
};

struct Node {
    struct Paciente data;
    struct Node* next;
    struct Node* prev;
};

void exitWithError(FILE* saida) {
    fflush(saida);
    char message[100] = "Arquivo Inválido!";
    fprintf(saida, "%s", message);
    printf("%s", message);
    exit(0);
}

void printPaciente(FILE* saida, struct Paciente paciente) {
    if (!strlen(paciente.nome) || !strlen(paciente.peso) ||
        !strlen(paciente.altura) || !strlen(paciente.telefone)) {
        exitWithError(saida);
    }
    else {
        printf(
            "{%d,%s,%c,%d,%s,%s,%s}\n",
            paciente.codigo,
            paciente.nome,
            paciente.sexo,
            paciente.idade,
            paciente.peso,
            paciente.altura,
            paciente.telefone
        );

        fprintf(
            saida,
            "{%d,%s,%c,%d,%s,%s,%s}\n",
            paciente.codigo,
            paciente.nome,
            paciente.sexo,
            paciente.idade,
            paciente.peso,
            paciente.altura,
            paciente.telefone
        );
    }
}

void insertAfter(struct Node** start, struct Paciente new_value, struct Paciente after) {
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    new_node->data = new_value;
    struct Node* temp = *start;
    while (temp->data.codigo != after.codigo)
        temp = temp->next;
    struct Node* next = temp->next;
    temp->next = new_node;
    new_node->prev = temp;
    new_node->next = next;
    next->prev = new_node;
}

void insertEnd(struct Node** start, struct Paciente value) {
    if (*start == NULL) {
        struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
        new_node->data = value;
        new_node->next = new_node->prev = new_node;
        *start = new_node;
        return;
    }

    struct Node* last = (*start)->prev;
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    new_node->data = value;
    new_node->next = *start;
    (*start)->prev = new_node;
    new_node->prev = last;
    last->next = new_node;
}

void insertBegin(struct Node** start, struct Paciente value) {
    struct Node* last = (*start)->prev;
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    new_node->data = value;
    new_node->next = *start;
    new_node->prev = last;
    last->next = (*start)->prev = new_node;
    *start = new_node;
}

void insert(struct Node** start, struct Paciente value) {
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));

    if (*start == NULL) {
        insertEnd(start, value);
    }
    else if ((*start)->data.codigo > value.codigo) {
        insertBegin(start, value);
    }
    else {
        struct Node* temp = *start;
        while (temp->next != *start && value.codigo > temp->next->data.codigo) {
            temp = temp->next;
        }
        insertAfter(start, value, temp->data);
    }
}

void displayCrescent(FILE* saida, struct Node* start) {
    struct Node* temp = start;
    while (temp->next != start) {
        printPaciente(saida, temp->data);
        temp = temp->next;
    }
    printPaciente(saida, temp->data);
}

void displayDescrecent(FILE* saida, struct Node* start) {
    struct Node* temp = start;
    struct Node* last = start->prev;
    temp = last;
    while (temp->prev != last) {
        printPaciente(saida, temp->data);
        temp = temp->prev;
    }
    printPaciente(saida, temp->data);
}

void displayElement(FILE* saida, struct Node* start, int codigo) {
    struct Node* temp = start;
    while (true) {
        temp = temp->prev;
        if (temp->data.codigo == codigo) {
            printPaciente(saida, temp->data);
            break;
        }
        if (temp == start) {
            char message[100] = "Elemento não encontrado!";
            fprintf(saida, "%s", message);
            printf("%s", message);
            break;
        }
    }
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

    struct Node* start = NULL;

    bool hasPaciente = false;
    // Itera pelo arquivo de entrada lendo linha a linha
    char linha[100];
    while (!feof(entrada)) {
        // Le primeiro caracter da linha para definir operação necessari
        char operador;
        fscanf(entrada, "%c", &operador);


        // Caso seja um '{' faz leitura do paciente
        if (operador == 123) {
            hasPaciente = true;
            struct Paciente paciente;
            fscanf(
                entrada,
                "%d,%[^,],%c,%d,%[^,],%[^,],%[^}]}",
                &paciente.codigo, paciente.nome, &paciente.sexo, &paciente.idade, paciente.peso, paciente.altura, paciente.telefone
            );
            fgets(linha, 100, entrada);
            insert(&start, paciente);
        }
        else {
            int cod;
            // Valida operadores para fazer operação necessaria
            switch (operador - 48) {
            case 1:
            displayCrescent(saida, start);
            break;
            case 2:
            displayDescrecent(saida, start);
            break;
            case 3:
            fscanf(entrada, "%d", &cod);
            displayElement(saida, start, cod);
            break;
            case 4:
            fscanf(entrada, "%d", &cod);
            displayElement(saida, start, cod);
            break;
            default:
            exitWithError(saida);
            break;
            }
            fgets(linha, 100, entrada);
        }
    }
    // Validação para caso não tenha operador apos paciente
    if (hasPaciente) {
        struct Paciente paciente = (*start).data;
        if (!strlen(paciente.nome) || !strlen(paciente.peso) ||
            !strlen(paciente.altura) || !strlen(paciente.telefone)) {
            exitWithError(saida);
        }
    }

    // fecha os arquivos utilizados
    fclose(entrada);
    fclose(saida);
    exit(0);
}