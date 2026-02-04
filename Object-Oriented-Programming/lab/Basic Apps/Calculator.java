import java.util.Scanner;

public class Calculator {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter first number: ");
        int a = scanner.nextInt();

        System.out.print("Enter second number: ");
        int b = scanner.nextInt();

        System.out.println("1: Add");
        System.out.println("2: Subtract");
        System.out.println("3: Multiply");
        System.out.println("4: Divide");
        System.out.print("Enter choice 1..4 : ");
        int choice = scanner.nextInt();

        double result = 0.00;

        if (choice == 1) {
            result = a + b;
            System.out.printf("%d + %d = %.2f%n", a, b, result);
        } else if (choice == 2) {
            result = a - b;
            System.out.printf("%d - %d = %.2f%n", a, b, result);
        } else if (choice == 3) {
            result = a * b;
            System.out.printf("%d * %d = %.2f%n", a, b, result);
        } else if (choice == 4) {
            if (b != 0) {
                result = (double) a / b;
                System.out.printf("%d / %d = %.2f%n", a, b, result);
            } else {
                System.out.println("Error! Division by zero.");
            }
        } else {
            System.out.println("Error! Invalid choice.");
        }
        

        scanner.close();
    }
}