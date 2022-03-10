void inverter(int  n) {
    int x = 0, y;
    while (n != 0) {
        y = n % 10;
        x = x * 10 + y;
        n /= 10;
    }
    printf("%d", x);
}