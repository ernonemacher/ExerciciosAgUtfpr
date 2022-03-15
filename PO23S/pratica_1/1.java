import java.util.Scanner;

public class Runner {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);

        var idade = scanner.nextInt();
        var salario = scanner.nextDouble();
        var nome = scanner.nextLine();

        System.out.println(idade);
        System.out.println(salario);
        System.out.println(nome.substring(1));


    }
}
