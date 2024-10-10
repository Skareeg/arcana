// #undef __cplusplus

// Sweet Jesus. (edit: Copilot wanted to put this here: "This is a lot of stuff. I'm going to try to compile this with clang-cl." Screw you, Copilot.)
// https://learn.microsoft.com/en-us/cpp/preprocessor/predefined-macros?view=msvc-170
#define _M_X64 100
#define _WIN64 1

#include "stdio.h"

int main() {
    int testint = 5;
    float testfloat = 5.5f;
    printf("Hello, World!\nInt=%d, Float=%.5f\n", testint, testfloat);
    printf("Give me a number: ");
    scanf("%d", &testint);
    printf("You gave me: %d\n", testint);
    return testint;
}