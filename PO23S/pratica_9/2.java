class Quadrado implements AreaCalculavel {
    private double lado;
    
    Quadrado(double lado) {
        this.lado = lado;
    }
    
    @Override public double calcularArea() {
        return lado*lado;
    }
}

class Retangulo implements AreaCalculavel {
    private double lado, altura;
    
    Retangulo(double lado, double altura) {
        this.lado = lado;
        this.altura = altura;
    }
    
    @Override public double calcularArea() {
        return lado*altura;
    }
}
class Triangulo implements AreaCalculavel {
    private double base, altura;
    
    Triangulo(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }
    
    @Override public double calcularArea() {
        return base*altura/2;
    }
}