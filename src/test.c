#include <stdio.h>

extern void test_something();

#define RUN_TEST(test_function)      \
    do {                             \
        printf(#test_function "\n"); \
        test_function();             \
    } while (0)

int main(void) {
    printf("\n");

    RUN_TEST(test_something);

    printf("\n*** ALL TESTS PASSED ***\n\n");

    return 0;
}
