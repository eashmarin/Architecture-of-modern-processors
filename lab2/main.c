#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <stdbool.h>

#define SIZE (10 * (32768 + 262144 + 3145728) / sizeof(int))

union ticks {
    unsigned long long t64;
    struct s32 {
        long th;
        long tl;
    } t32;
};

void fillArray(int *array) {
    bool *flags = (bool *) calloc(SIZE, sizeof(bool) * SIZE);

    for (int i = 0; i < SIZE; i++) {
        array[i] = -1;
    }

    srand(time(0));

    int index = 0;
    int randomIndex;
    for (int counter = 0; counter < SIZE; counter++) {
        do {
            randomIndex = rand() % SIZE;
        } while (flags[randomIndex] == 1 || index == randomIndex ||
                 array[randomIndex] == index ||
                 (array[randomIndex] != -1 && counter != SIZE - 1));

        array[index] = randomIndex;
        flags[randomIndex] = 1;

        index = randomIndex;
    }

    free(flags);
}

void printArray(int *array) {
    for (int i = 0; i < SIZE; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}


int main() {
    union ticks start;
    union ticks end;
    int *array = (int *) malloc(sizeof(int) * SIZE);

    fillArray(array);

    int k = 0;

    asm("rdtscp\n":"=a"(start.t32.th), "=d"(start.t32.tl));
    for (int i = 0; i < SIZE; i++) {
        k = array[k];
        asm("nop");
    }
    asm("rdtscp\n":"=a"(end.t32.th), "=d"(end.t32.tl));

    printf("%llu", (end.t64 - start.t64) / SIZE);

    free(array);

    return 0;
}
