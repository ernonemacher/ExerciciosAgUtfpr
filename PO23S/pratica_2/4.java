import java.util.Scanner;

public class Runner {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);


        int var1 = scanner.nextInt();

        for(int i = 1; i <= var1; i++) {
            System.out.print(i + " ");    
        }
        
    }
}
