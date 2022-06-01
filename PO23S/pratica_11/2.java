import java.util.ArrayList;
class Loja {
    ArrayList<Produto> list = new ArrayList<>();

    public void adicionar(Produto p) {
        list.add(p);
    }

    Produto getProdutoMaisCaro() {
        return list.stream().reduce(((produto, produto2) -> produto.getPreco() > produto2.getPreco() ? produto : produto2)).get();
    }

    Produto getProdutoMenosCaro() {
        return list.stream().reduce(((produto, produto2) -> produto.getPreco() < produto2.getPreco() ? produto : produto2)).get();
    }
}