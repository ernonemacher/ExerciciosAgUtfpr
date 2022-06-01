static ArrayList<Integer> removerImpares(ArrayList<Integer> num) {
        ArrayList<Integer> newList = new ArrayList<>();
        for(int i = 0; i < num.size(); i++) {
            if(num.get(i) % 2 == 0) {
                newList.add(num.get(i));
            }
        }
        return newList;
    }