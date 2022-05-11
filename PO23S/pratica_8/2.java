class AlunoGraduacao extends Aluno {
    private double notaTCC;

    public AlunoGraduacao(String nome, int ra, double notaDiciplina, double notaTCC) {
        setNome(nome);
        setRa(ra);
        setNotaDisciplinas(notaDiciplina);
        setNotaTCC(notaTCC);
    }

    public double getNotaTCC() {
        return notaTCC;
    }

    public void setNotaTCC(double notaTCC) {
        this.notaTCC = notaTCC;
    }

    @Override public double getNotaFinal() {
        return (getNotaDisciplinas() + getNotaTCC()) / 2;
    }
}

class AlunoMestrado extends Aluno {
    private double notaDissertacao;
    private int artigosPublicados;

    public double getNotaDissertacao() {
        return notaDissertacao;
    }

    public void setNotaDissertacao(double notaDissertacao) {
        this.notaDissertacao = notaDissertacao;
    }

    public int getArtigosPublicados() {
        return artigosPublicados;
    }

    public void setArtigosPublicados(int artigosPublicados) {
        this.artigosPublicados = artigosPublicados;
    }

    @Override public double getNotaFinal() {
        if (getArtigosPublicados() < 1)
            return 0;
        else
            return (getNotaDisciplinas() + getNotaDissertacao()) / 2;
    }

    public AlunoMestrado(String nome, int ra, double notaDiciplina, double notaDissertacao, int artigosPublicados) {
        setNome(nome);
        setRa(ra);
        setNotaDisciplinas(notaDiciplina);
        setNotaDissertacao(notaDissertacao);
        setArtigosPublicados(artigosPublicados);
    }
}