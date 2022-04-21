class DetalheVeiculos {
    Veiculo[] veiculos;

    DetalheVeiculos(Veiculo[] veiculos) {
        this.veiculos = veiculos;
    }

    public void printVeiculos() {
        for (Veiculo v : veiculos) {
            String vClass = v.getClass().equals(Moto.class) ? "Moto" : "Carro";
            var rodas = v.getClass().equals(Moto.class) ? 2 : 4;
            System.out.println(vClass + ": " + v.getPlaca() + " - " + v.getCor() + " - " + rodas);
        }
    }
}