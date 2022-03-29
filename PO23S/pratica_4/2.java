public static int procuraMaiorValor(int[] vetor)  {
    int max = 0;
    for(int i = 0; i < vetor.length; i++) {
        if(max < vetor[i]) {
            max = vetor[i];
        }
    }
    return max;
}