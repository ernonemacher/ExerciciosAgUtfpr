public class Aluno {
    String nome;
    int idade;
    char genero;
    long ra;

    public Aluno(String nome, char genero, long ra) {
        SetAluno(nome, 18, genero, ra);
    }

    public Aluno(String nome, int idade) {
        SetAluno(nome, idade, 'M', 123456789);
    }

    public Aluno() {
         SetAluno("Aluno", 18, 'M', 123456789);
    }

    private void SetAluno(String nome, int idade, char genero, long ra) {
        this.nome = nome;
        this.idade = idade;
        this.genero = genero;
        this.ra = ra;
    }

    public void print() {
        System.out.println(this.nome + " - " + this.idade + " - " + this.genero + " - " + this.ra);
    }
}