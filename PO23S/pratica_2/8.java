import java.util.Scanner;

public class Runner {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);

        var x1 = 0;
        var x2 = 0;
        var x3 = 0;
        var x4 = 0;
        
        while(true) {
            var y = scanner.nextInt();

            if(y < 0)
                break;

            if(y >= 0 && y <= 25) {
                x1++;
            } else if(y > 25 && y <= 50) {
                x2++;
            } else if(y > 50 && y <= 75) {
                x3++;
            } else if(y > 75 && y <=100) {
                x4++;
            }
        }

        System.out.println("[0,25] = " + x1);
        System.out.println("[26,50] = " + x2);
        System.out.println("[51,75] = " + x3);
        System.out.println("[76,100] = " + x4);

    }
}
