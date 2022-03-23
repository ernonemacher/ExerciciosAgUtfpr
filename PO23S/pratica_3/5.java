import java.util.Scanner;

public class Runner {

    public static void main (String args[]) {
        var scanner = new Scanner(System.in);

        String frase = scanner.nextLine();
        String palavra = scanner.nextLine();

        int counter = 0;


        var split = frase.split(" ");
        for(int i = 0; i < split.length; i++) {
            if(split[i].contains(palavra)) {
                counter++;
            }
        }

        System.out.println(palavra + "=" + counter);
    }
}