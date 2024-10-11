// #include "stdio.h"

// This gets declared because llc puts in a BS reference to this exact named symbol because of the floating point vars. It thinks it needs the UCRT.
// This compiles to:
//     @_fltused = dso_local global i32 0, align 4
// int _fltused = 0;

int main() {
    int testint = 5;
    float testfloat = 5.5f;
    // printf("Hello, World!\nInt=%d, Float=%.5f\n", testint, testfloat);
    // printf("Give me a number: ");
    // scanf("%d", &testint);
    // printf("You gave me: %d\n", testint);
    float multed = testint * testfloat;
    return 0;
}