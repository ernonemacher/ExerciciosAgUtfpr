class Professor extends Pessoa {
    private  double salario;
    private String nome;
    private String cpf;
    private String rg;

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    @Override public String getNome() {
        return nome;
    }

    @Override public void setNome(String nome) {
        this.nome = nome;
    }

    @Override public String getCpf() {
        return cpf;
    }

    @Override public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    @Override public String getRg() {
        return rg;
    }

    @Override public void setRg(String rg) {
        this.rg = rg;
    }
}