package utfpr.banco;

import java.util.ArrayList;
import java.util.Comparator;

public class Banco {
    private String nome;
    private ArrayList<ContaBancaria> contas;

    public Banco(String nome) {
        this.nome = nome;
        this.contas = new ArrayList<>();
    }

    public void adicionar(ContaBancaria novaConta) {
        if (novaConta.getNumero() == 0) {
            System.out.println("Erro: conta tem que ter um número!");
        } else {
            this.contas.add(novaConta);
        }
    }

    public ContaBancaria getConta(int numero) {
        for (ContaBancaria conta : contas) {
            if (conta.getNumero() == numero) {
                return conta;
            }
        }
        return null;
    }

    public ContaBancaria getContaMaiorSaldo() {
        return contas.stream().max(Comparator.comparing(conta -> conta.getSaldo())).get();
    }

    public ContaBancaria getContaMenorSaldo() {
        return contas.stream().min(Comparator.comparing(conta -> conta.getSaldo())).get();
    }

    public double GetMediaContas() {
        return contas.stream().mapToDouble(ContaBancaria::getSaldo).sum();
    }

    public double GetMediaContasCorrente() {
        return contas.stream()
                .filter(contaBancaria -> contaBancaria.getClass().equals(ContaCorrente.class))
                .mapToDouble(ContaBancaria::getSaldo)
                .sum();
    }

    public double GetMediaContasPoupanca() {
        return contas.stream()
                .filter(contaBancaria -> contaBancaria.getClass().equals(ContaPoupanca.class))
                .mapToDouble(ContaBancaria::getSaldo)
                .sum();
    }

    public void listarContas() {
        System.out.println("Banco: " + this.nome);
        System.out.println("Lista de contas...");
        for (ContaBancaria conta : contas) {
            System.out.println(conta.getInformacoes());
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
