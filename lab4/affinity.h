#ifdef __APPLE__

#include <sys/types.h>
#include <mach/mach_types.h>
#include <printf.h>
#include <pthread.h>
#include <mach/thread_act.h>

#ifndef LAB4_AFFINITY_H
#define LAB4_AFFINITY_H

typedef struct cpu_set {
    uint32_t count;
} cpu_set_t;

static inline void CPU_ZERO(cpu_set_t *cs) { cs->count = 0; }

static inline void CPU_SET(int num, cpu_set_t *cs) { cs->count |= (1 << num); }

static inline int CPU_ISSET(int num, cpu_set_t *cs) { return (cs->count & (1 << num)); }

int pthread_setaffinity_np(pthread_t thread, size_t cpu_size, cpu_set_t *cpu_set) {
    thread_port_t mach_thread;
    int core = 0;

    for (core = 0; core < 8 * cpu_size; core++) {
        if (CPU_ISSET(core, cpu_set)) break;
    }

    thread_affinity_policy_data_t policy = {core};
    mach_thread = pthread_mach_thread_np(thread);
    thread_policy_set(mach_thread, THREAD_AFFINITY_POLICY, (thread_policy_t) &policy, 1);

    return 0;
}

#endif //LAB4_AFFINITY_H
#endif // __APPLE__