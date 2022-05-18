class MinhaClasse implements MinhaInterface{
    private String frase;

    @Override public void concatenar(final String s) {
        setFrase(frase + s);
    }

    @Override public int tamanho() {
        return frase.length();
    }

    @Override public String getFrase() {
        return frase;
    }

    @Override public void setFrase(final String frase) {
        this.frase = frase;
    }
}