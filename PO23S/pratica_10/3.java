static String getTemperatura(double temperaturas[], int indice) {
        try {
            return "Temperatura[" + indice + "]:" + temperaturas[indice];
        } catch (Exception e) {
            return "rro! Dados da exceção: " + e.getMessage();
        }
    }