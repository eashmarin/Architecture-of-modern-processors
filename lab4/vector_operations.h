//
// Created by Evgeny on 14.05.2023.
//

#ifndef LAB4_VECTOR_OPERATIONS_H
#define LAB4_VECTOR_OPERATIONS_H

#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <immintrin.h>
#include <x86intrin.h>
#include <pthread.h>
#include <assert.h>
#include "type.h"
#include "rdtsc.h"
#include "thread_context.h"
#include "affinity.h"

uint64_t measure_read_clocks(const type *array, const size_t num) {
    volatile type s = 0;

    uint64_t t0 = rdtsc();
    for (size_t i = 0; i < num - 7; i += 8) {
        s += array[i]
            + array[i + 1]
            + array[i + 2]
            + array[i + 3]
            + array[i + 4]
            + array[i + 5]
            + array[i + 6]
            + array[i + 7];
    }
    uint64_t t1 = rdtsc();

    return t1 - t0;
}

uint64_t measure_write_clocks(type *array, const size_t num) {
    volatile type k = 1;

    uint64_t t0 = rdtsc();
    for (size_t i = 0; i < num - 7; i += 8) {
        array[i] = k;
        array[i + 1] = k;
        array[i + 2] = k;
        array[i + 3] = k;
        array[i + 4] = k;
        array[i + 5] = k;
        array[i + 6] = k;
        array[i + 7] = k;
    }
    uint64_t t1 = rdtsc();

    return t1 - t0;
}

uint64_t measure_copy_clocks(type *dst, const type *src, const size_t num) {
    uint64_t t0 = rdtsc();
    for (size_t i = 0; i < num - 7; i += 8) {
        __m256 v = _mm256_load_ps(src + i);
        _mm256_store_ps(dst, v);
    }
    uint64_t t1 = rdtsc();

    return t1 - t0;
}

void* measure_routine(void *arg) {
    assert(sizeof(type) == 4);

    thread_context *context = (thread_context *) arg;

    cpu_set_t cpu_mask;
    CPU_ZERO(&cpu_mask);
    CPU_SET(context->cpu_id, &cpu_mask);
//    sched_setaffinity(0, sizeof(cpu_mask), &cpu_mask);


    pthread_barrier_wait(context->barrier);
    context->read_clocks = measure_read_clocks(context->data1 + context->thread_id * context->size, context->size);
    pthread_barrier_wait(context->barrier);
    context->write_clocks = measure_write_clocks(context->data1 + context->thread_id * context->size, context->size);
    pthread_barrier_wait(context->barrier);
    context->copy_clocks = measure_copy_clocks(context->data2 + context->thread_id * context->size, context->data1 + context->thread_id * context->size, context->size);

    pthread_exit(0);
}

#endif //LAB4_VECTOR_OPERATIONS_H