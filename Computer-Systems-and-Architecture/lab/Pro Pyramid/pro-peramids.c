#include <stdio.h>

int main() {
    for (int i = 5; i >= 1; i--) {
        for (int j = 1; j <= i; j++) {
            printf("*");
        }
        printf("\n");
    }

    printf("\n");

    for (int i = 1; i <= 5; i++) {
        for (int j = 1; j <= i - 1; j++) {
            printf(" ");
        }
        for (int k = 5; k >= i; k--) {
            printf("*");
        }
        printf("\n");
    }

    printf("\n");

    int n = 5; 
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n - i; j++) {
            printf(" ");
        }
        for (int k = 1; k <= i * 2 - 1; k++) {
            printf("*");
        }
        printf("\n");
    }

    return 0;
}
