import java.util.Scanner;

public class Runner {

    public static void main (String args[]) {
        var scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int[] x = new int[n];
        int total = 0;
        for(int i = 0; i < n; i++) {
            x[i] = scanner.nextInt();
            total += x[i];
        }
        var media = (double)total/n;
        System.out.printf("%.2f\n", media);

        for(int i = 0; i < n; i++) {
            if(x[i] > media) {
                System.out.println(x[i]);
            }
        }
    }
}