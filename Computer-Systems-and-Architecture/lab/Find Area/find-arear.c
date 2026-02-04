#include <stdio.h>
#include <math.h>

int main() {
    int list;
    float area;
    char continuelist;

    do {
        printf("Program Calculate Area\n");
        printf("1: Circle\n");
        printf("2: Triangle\n");
        printf("3: Rectangle\n");
        printf("Select Lists: ");
        scanf("%d", &list);

        switch (list) {
            case 1: {
                float radius;
                printf("Enter the radius of the circle: ");
                scanf("%f", &radius);
                area = M_PI * radius * radius;
                printf("Area of the circle: %.2f square units\n", area);
                break;
            }

            case 2: {
                float base, height;
                printf("Enter the length of the base of the triangle: ");
                scanf("%f", &base);
                printf("Enter the height of the triangle: ");
                scanf("%f", &height);
                area = 0.5 * base * height;
                printf("Area of the triangle: %.2f square units\n", area);
                break;
            }

            case 3: {
                float width, length;
                printf("Enter the width of the rectangle: ");
                scanf("%f", &width);
                printf("Enter the length of the rectangle: ");
                scanf("%f", &length);
                area = width * length;
                printf("Area of the rectangle: %.2f square units\n", area);
                break;
            }

            default:
                printf("Invalid list\n");
                break;
        }

        printf("Continue? (y/n): ");
        scanf(" %c", &continuelist);

    } while (continuelist == 'y' || continuelist == 'Y');

    printf("Exiting the program\n");
    return 0;
}
