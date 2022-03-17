import java.util.Scanner;

public class Runner {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);
        var y = scanner.nextInt();

        System.out.print(y + " - ");

        switch (y) {
        case 1:
            System.out.println("Caixa");
            break;
        case 2:
            System.out.println("Financiamento");
            break;
        case 3:
            System.out.println("Empréstimo");
            break;
        case 4:
            System.out.println("Produtor Rural");
            break;
        case 5:
            System.out.println("Abertura de Contas");
            break;
        case 6:
            System.out.println("Falar com o Gerente");
            break;
        default:
            System.out.println("Opção Inexistente");
            break;
        }
    }
}
