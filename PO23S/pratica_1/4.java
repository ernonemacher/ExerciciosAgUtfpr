import java.util.Scanner;

public class Runner {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);

        int num1 = scanner.nextInt();
        int num2 = scanner.nextInt();

        System.out.println("soma = " + (num1 + num2));
        System.out.println("subtracao = " + (num1 - num2));


    }
}
