class Professor implements Funcionario {
    private double ch;
    private String nome;
    double sal = 60;

    Professor(String nome, double ch) {
        this.nome = nome;
        this.ch = ch;
    }

    @Override public double calcularSalario() {
        return ch * sal;
    }

    public void setSal(final double sal) {
        this.sal = sal;
    }
}

class Tecnico extends Professor {
    

    Tecnico(final String nome, final double ch) {
        super(nome, ch);
        setSal(40);
    }
}

class Estagiario extends Professor {
    Estagiario(final String nome, final double ch) {
        super(nome, ch);
        setSal(12.5);
    }
}