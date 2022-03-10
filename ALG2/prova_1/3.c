#include <stdio.h>

void print_contas(float contas[], int n) {
    int i;
    for (i = 0; i < n; i++) {
        printf("Contas[%d] = %.2f\n", i, contas[i]);
    }
}

void sacar(float contas[], int conta, float value) {
    if (contas[conta] >= value) {
        contas[conta] -= value;
        printf("Saque conta[%d] = %.2f.\n", conta, value);
    }
    else {
        printf("Saque conta[%d] = %.2f - NAO REALIZADO - SALDO INSUFICIENTE.\n", conta, value);
    }
}

void depositar(float contas[], int conta, float value) {
    contas[conta] += value;
    printf("Deposito conta[%d] = %.2f.\n", conta, value);
}

void transferencia(float contas[], int from, int to, float value) {
    if (contas[from] >= value) {
        contas[from] -= value;
        contas[from] += value;
        printf("Transferencia: Saque conta[%d] = %.2f, Deposito conta[%d]: %.2f.\n", from, value, to, value);
    }
    else {
        printf("Transferencia: Saque conta[%d] = %.2f - NAO REALIZADO - SALDO INSUFICIENTE.\n", from, value);
    }
}

int main() {
    float contas[5] = { 100.0, 100.0, 100.0, 100.0, 100.0 };
    char operacao;
    float valor_operacao;
    int conta_origem, conta_destino;

    while (operacao != 'Q') {
        scanf(" %c", &operacao);

        if (operacao == 'Q')
            break;

        switch (operacao) {
        case 'S': {
            scanf(" %d %f", &conta_destino, &valor_operacao);
            sacar(contas, conta_destino, valor_operacao);
            break;
        }
        case 'D': {
            scanf(" %d %f", &conta_destino, &valor_operacao);
            depositar(contas, conta_destino, valor_operacao);
            break;
        }
        case 'T': {
            scanf(" %d %d %f", &conta_origem, &conta_destino, &valor_operacao);
            transferencia(contas, conta_origem, conta_destino, valor_operacao);
            break;
        }
        case 'P': {
            print_contas(contas, 5);
            break;
        }
        }
    }
}