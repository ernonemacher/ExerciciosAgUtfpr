import java.util.Scanner;

public class Runner {

    public static void main (String args[]) {
        var scanner = new Scanner(System.in);

        String frase = scanner.nextLine();

        for(int i = frase.length()-1; i >= 0; i--) {
            System.out.print(frase.charAt(i));
        }

        System.out.println("\n" + frase.length());
    }
}