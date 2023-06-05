//
// Created by Evgeny on 14.05.2023.
//

#ifndef LAB4_RDTSC_H
#define LAB4_RDTSC_H

#include <stdint.h>

unsigned long long rdtsc() {
    unsigned int lo, hi;
    asm volatile ( "rdtsc\n" : "=a" (lo), "=d" (hi) );
    return ((unsigned long long)hi << 32) | lo;
}

#endif //LAB4_RDTSC_H
