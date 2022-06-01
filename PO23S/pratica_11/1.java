import java.util.ArrayList;
class MinhaColecao {
    ArrayList<String> array = new ArrayList<>();

    public void adicionar(String s) {
        if(!array.contains(s))
        this.array.add(s);
    }

    public void remover(String s) {
        this.array.remove(array.indexOf(s));
    }

    public void imprimir() {
        if(array.size() == 0) {
            System.out.println("Lista vazia!");
        }
        for(int i=0; i<array.size(); i++) {
            System.out.println(i+1+"-"+array.get(i));
        }
    }
}