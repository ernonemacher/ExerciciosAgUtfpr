public static void printDiagonalPrincipal(int[][] matriz)  {
        int tam = matriz.length;
        for (int i=0; i<tam; i++){
            for (int j=0; j<tam; j++){
                if(i == j) {
                    System.out.print(matriz[i][j] + " ");
                }
            }
        }
    }