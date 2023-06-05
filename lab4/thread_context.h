//
// Created by Evgeny on 14.05.2023.
//

#ifndef LAB4_THREAD_CONTEXT_H
#define LAB4_THREAD_CONTEXT_H

#include <stdint.h>
#include "barrier.h"

typedef struct thread_context {
    uint64_t read_clocks;
    uint64_t write_clocks;
    uint64_t copy_clocks;
    type* data1;
    type* data2;
    size_t size;
    uint32_t cpu_id;
    uint32_t thread_id;
    pthread_barrier_t* barrier;
} thread_context;

#endif //LAB4_THREAD_CONTEXT_H
