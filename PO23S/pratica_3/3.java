import java.util.HashMap;
import java.util.Scanner;

public class Runner {

    public static void main (String args[]) {
        var scanner = new Scanner(System.in);

        HashMap<String, Integer> map = new HashMap<>();
        map.put("a", 0);
        map.put("e", 0);
        map.put("i", 1);
        map.put("o", 0);
        map.put("u", 0);
        while(true) {
            String frase = scanner.nextLine();

            if(frase.equals("FIM")) {
                break;
            }

            for(int i = 0; i < frase.length(); i++) {
                String a = ((Character)frase.charAt(i)).toString().toLowerCase();
                if(map.containsKey(a)) {
                    map.put(a, map.get(a)+1);
                }
            }
        }

        System.out.println("a=" + map.get("a").toString());
        System.out.println("e=" + map.get("e").toString());
        System.out.println("i=" + map.get("i").toString());
        System.out.println("o=" + map.get("o").toString());
        System.out.println("u=" + map.get("u").toString());
    }
}