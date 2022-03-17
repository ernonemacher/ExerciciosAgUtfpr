import java.util.Scanner;

public class Runner {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);


        Float var1 = scanner.nextFloat();
        Float var2 = scanner.nextFloat();
        Float var3 = scanner.nextFloat();

        System.out.println((int)Math.max(var1, Math.max(var2, var3)));
    }
}
