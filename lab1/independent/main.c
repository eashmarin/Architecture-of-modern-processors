#include <stdio.h>
#include <stdlib.h>

#define ITER_COUNTER 70000
#define N 500

union ticks {
    unsigned long long t64;
    struct s32 {
        long th;
        long tl;
    } t32;
};

int* heat_processor() {
    long* a = (long*)malloc(sizeof(long) * N * N);
    long* b = (long*)malloc(sizeof(long) * N * N);

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            a[i * N + j] = i;
        }
    }

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            int index = i * N + j;
            b[index] = 0;
            for (int k = 0; k < N; k++) {
                b[index] += a[i * N + k] * a[k * N + j];
            }
        }
    }

    printf("%ld\n", b[250 * N + 250]);

    free(a);
    free(b);
}

int main() {
    union ticks start;
    union ticks end;

    double a1 = 0;
    double a2 = 0;
    double a3 = 0;
    double a4 = 0;
    double a5 = 0;
    double a6 = 0;
    double a7 = 0;
    double a8 = 0;
    double a9 = 0;
    double a10 = 0;
    double a11 = 0;
    double a12 = 0;
    double a13 = 0;
    double a14 = 0;
    double a15 = 0;
    double b = 4.5;

    heat_processor();

    asm("rdtsc\n":"=a"(start.t32.th),"=d"(start.t32.tl));

    for (int i = 0; i < ITER_COUNTER; i++) {
        a1 = a1 + b;
        a2 = a2 + b;
        a3 = a3 + b;
        a4 = a4 + b;
        a5 = a5 + b;
        a6 = a6 + b;
        a7 = a7 + b;
        a8 = a8 + b;
        a9 = a9 + b;
        a10 = a10 + b;
        a11 = a11 + b;
        a12 = a12 + b;
        a13 = a13 + b;
        a14 = a14 + b;
        a15 = a15 + b;
    }

    asm("rdtsc\n":"=a"(end.t32.th),"=d"(end.t32.tl));

    printf("%llu clock cycles.\n", (end.t64 - start.t64));
    //printf("result = %f\n", a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14 + a15);

    return 0;
}
