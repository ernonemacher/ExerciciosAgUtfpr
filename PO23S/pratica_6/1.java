class Pessoa {
    private String nome;
    private String endereco;

    Pessoa(final String nome, final String endereco) {
        this.setNome(nome);
        this.setEndereco(endereco);
    }

    public String getNome() {
        return nome;
    }

    public void setNome(final String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(final String endereco) {
        this.endereco = endereco;
    }
}

class Dependente extends Pessoa {
    private int idade;
    
    Dependente(final String nome, final String endereco, final int idade) {
        super(nome, endereco);
        this.setIdade(idade);
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}

class Cliente extends Pessoa {
    private double limiteCompra;
    
    Cliente(final String nome, final String endereco, final double limiteCompra) {
        super(nome, endereco);
        this.setLimiteCompra(limiteCompra);
    }

    public double getLimiteCompra() {
        return limiteCompra;
    }

    public void setLimiteCompra(double limiteCompra) {
        this.limiteCompra = limiteCompra;
    }
}

class Funcionario extends Pessoa {
    private double salario;

    Funcionario(final String nome, final String endereco, final double salario) {
        super(nome, endereco);
        this.setSalario(salario);
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }
}

class Gerente extends Funcionario {
    private String departamento;

    Gerente(final String nome, final String endereco, final double salario, final String departamento) {
        super(nome, endereco, salario);
        this.setDepartamento(departamento);
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
}

