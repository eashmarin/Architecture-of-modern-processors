#include <stdio.h>
#include <stdlib.h>

#define ITER_COUNTER 131250
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

    double a = 0;
    double b = 4.5;

    heat_processor();

    asm("rdtsc\n":"=a"(start.t32.th),"=d"(start.t32.tl));

    for (int i = 0; i < ITER_COUNTER; i++) {
        a = a + b;
        a = a + b;
        a = a + b;
        a = a + b;
        a = a + b;
        a = a + b;
        a = a + b;
        a = a + b;
    }

    asm("rdtsc\n":"=a"(end.t32.th),"=d"(end.t32.tl));

    //printf("result = %f\n", a);

    printf("%llu clock cycles\n", (end.t64 - start.t64));

    return 0;
}
