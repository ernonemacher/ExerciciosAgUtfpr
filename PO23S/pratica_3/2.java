import java.util.Scanner;

public class Runner {

    public static void main (String args[]) {
        var scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int[] x = new int[n];
        int[] y = new int[n];

        for(int i = 0; i < n; i++) {
            x[i] = scanner.nextInt();
        }

        for(int i = 0; i < n; i++) {
            y[i] = scanner.nextInt();
        }

        for(int i = 0; i < n; i++) {
            for(int j = 0; j < n; j++) {
                if(x[i] == y[j]) {
                    System.out.println(x[i]);
                }
            }
        }
    }
}