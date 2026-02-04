#include<stdio.h>

int main() {
    float inches, meters;
    int list;

    printf("Nattapong Dev\n");
    printf("Program to change length units\n");
    printf("1. inches to meters\n");
    printf("2. meters to inches\n");
    printf("Select List : ");
    scanf("%d", &list);

    if (list == 1) {
        printf("Enter length in inches: ");
        scanf("%f", &inches);
        meters = inches * 0.0254;
        printf("%.4f inches = %.4f meters\n", inches, meters);
    } else if (list == 2) {
        printf("Enter length in meters: ");
        scanf("%f", &meters);
        inches = meters / 0.0254;
        printf("%.4f meters = %.4f inches\n", meters, inches);
    } else {
        printf("เลือกไม่ถูกต้อง\n");
    }

    return 0;
}
