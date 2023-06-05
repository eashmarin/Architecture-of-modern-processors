#define _GNU_SOURCE
#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <sched.h>
#include "affinity.h"
#include "type.h"
#include "scalar_operations.h"
#include "std_functions.h"

#define CPU_CORES 6

const unsigned long N = 100L * (32768 + 262144 + 6291456) / sizeof(type);
const double cpu_freq = 1.4;

double clocks_to_seconds(uint64_t clocks) {
    return (double) (clocks) / (cpu_freq * 1000000000.0);
}

double bytes_to_gigabytes(uint32_t bytes) {
    return (bytes) / (1024.0 * 1024.0 * 1024.0);
}

double calc_speed(uint32_t data_num, uint64_t clocks) {
    return bytes_to_gigabytes(data_num * sizeof(type)) / clocks_to_seconds(clocks);
}

void heat_processor() {
    const int test_size = 500;
    long *a = (long *) malloc(sizeof(long) * test_size * test_size);
    long *b = (long *) malloc(sizeof(long) * test_size * test_size);

    for (int i = 0; i < test_size; i++) {
        for (int j = 0; j < test_size; j++) {
            a[i * test_size + j] = i;
        }
    }

    for (int i = 0; i < test_size; i++) {
        for (int j = 0; j < test_size; j++) {
            int index = i * test_size + j;
            b[index] = 0;
            for (int k = 0; k < test_size; k++) {
                b[index] += a[i * test_size + k] * a[k * test_size + j];
            }
        }
    }

    free(a);
    free(b);
}

void exec_parallel(uint32_t threads_num) {
    pthread_barrier_t barrier;
    pthread_barrier_init(&barrier, NULL, threads_num);

    type *data1 = (type *) calloc(N, sizeof(type));
    type *data2 = (type *) calloc(N, sizeof(type));

    thread_context contexts[threads_num];
    for (size_t i = 0; i < threads_num; i++) {
        contexts[i].barrier = &barrier;
        contexts[i].data1 = data1;
        contexts[i].data2 = data2;
        contexts[i].size = N / threads_num;
        contexts[i].cpu_id = i % CPU_CORES;
        contexts[i].thread_id = i;
    }

    pthread_t threads[threads_num];
    for (size_t i = 0; i < threads_num; i++) {
        pthread_create(&threads[i], NULL, &measure_routine, &contexts[i]);
        cpu_set_t cpuset;
        CPU_ZERO(&cpuset);
        CPU_SET(i, &cpuset);
        pthread_setaffinity_np(threads[i], sizeof(cpu_set_t), &cpuset);
    }

    uint64_t read_clocks = 0;
    uint64_t write_clocks = 0;
    uint64_t copy_clocks = 0;

    for (size_t i = 0; i < threads_num; i++) {
        if (pthread_join(threads[i], NULL) != 0) {
            printf("pthread_join failed");
        }
        read_clocks += contexts[i].read_clocks;
        write_clocks += contexts[i].write_clocks;
        copy_clocks += contexts[i].copy_clocks;
    }

    printf("read: %f GB/s\n", calc_speed(N, read_clocks));
    printf("write: %f GB/s\n", calc_speed(N, write_clocks));
    printf("copy: %f GB/s\n", calc_speed(N, copy_clocks));

    free(data2);
    free(data1);

    pthread_barrier_destroy(&barrier);
}

int main(int argc, char *argv[]) {
    if (STD_FUNCTIONS) {
        assert(sizeof(type) == 1);
    }

    uint32_t threads_num = 1;

    if (argc == 2) {
        threads_num = strtol(argv[1], NULL, 10);
    }

    heat_processor();

    exec_parallel(threads_num);

    return 0;
}
