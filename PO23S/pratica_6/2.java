class Carro extends Veiculo {
    private int numeroDePortas;
    private int potenciaMotor;

    public void printInformacoes() {
        System.out.println("Renavam: " + this.getRenavam() + ", Placa: " + this.getPlaca() + ", Cor: " + this.getCor() + ", NumeroDePortas: " + this.getNumeroDePortas() + ", PotenciaMotor: " + this.getPotenciaMotor());
    }

    Carro() {

    }

    public int getNumeroDePortas() {
        return numeroDePortas;
    }

    public void setNumeroDePortas(int numeroDePortas) {
        this.numeroDePortas = numeroDePortas;
    }

    public int getPotenciaMotor() {
        return potenciaMotor;
    }

    public void setPotenciaMotor(int potenciaMotor) {
        this.potenciaMotor = potenciaMotor;
    }
}