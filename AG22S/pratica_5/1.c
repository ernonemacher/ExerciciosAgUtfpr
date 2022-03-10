void ordenar(int* a, int* b, int* c) {
    int aa, bb, cc;
    if (*a > *b && *a > *c) {
        aa = *a;
        if (*b > *c) {
            bb = *b;
            cc = *c;
        }
        else {
            bb = *c;
            cc = *b;
        }
    }
    else if (*b > *c) {
        aa = *b;
        if (*a > *c) {
            bb = *a;
            cc = *c;
        }
        else {
            bb = *c;
            cc = *a;
        }
    }
    else {
        aa = *c;
        if (*a > *b) {
            bb = *a;
            cc = *b;
        }
        else {
            bb = *b;
            cc = *a;
        }
    }
    printf("%d %d %d", cc, bb, aa);
}