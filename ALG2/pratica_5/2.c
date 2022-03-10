double* max(double var[], int size) {
    int a = 0;

    for (int i = 0; i < size; i++) {
        if (var[i] > var[a])
            a = i;
    }

    return &var[a];
}