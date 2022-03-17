import java.util.Scanner;

public class Runner {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);
        var y = 0;
        var qtd = 0;
        while(true) {
            var x = scanner.nextInt();
            qtd++;
            if(x < 0) {
                break;
            }
            y += x;
        }

        System.out.println("Quantidade = " + qtd);
        System.out.println("Soma = " + y);

    }
}
