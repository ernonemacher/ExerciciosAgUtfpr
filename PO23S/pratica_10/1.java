import java.util.Scanner;

public class Runner {
    public static void main(String[] args) {
        var scanner = new Scanner(System.in);
        try {
            var i = scanner.nextInt();
            System.out.println(i*2);
        } catch (Exception e) {
            System.out.println("Entrada Incorreta: informe somente inteiros.");
        }
    }
}