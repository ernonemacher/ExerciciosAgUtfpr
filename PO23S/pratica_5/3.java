class Financeiro {
    private double saldo = 0;

    public void printSaldo() {
        System.out.println("Saldo = " + String.format("%.2f", saldo));
    }

    public void processarLancamento(Lancamento lancamento) {

        double rounded = (double) Math.round(lancamento.getValor() * 100) / 100;

        System.out.println("Lançamento: " + (lancamento.getTipo() == 0 ? "Pagar" : "Receber") +
                " - " + lancamento.getDescricao() + " - " + String.format("%.2f", rounded));

        if (lancamento.getTipo() == 0) {
            rounded *= -1;
        }
        this.saldo += rounded;
    }
}