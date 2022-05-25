import java.util.Scanner;

public class Runner {
    public static void main(String[] args) {
        var scanner = new Scanner(System.in);

        int total = 0;
        int totalEntradas = 0;
        for(int i = 0; i < 10; i++) {
            try {
                var value = scanner.nextInt();
                total += value;
                totalEntradas++;
            } catch (Exception e) {
                scanner.next();
            }
        }
        float media = 0;
        if(totalEntradas != 0) {
            media = (float)total/10;
        }
        System.out.printf("Entradas aceitas: %d, média: %.2f", totalEntradas, media);
    }
}
