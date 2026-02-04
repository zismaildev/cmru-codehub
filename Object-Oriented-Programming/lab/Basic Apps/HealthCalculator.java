import java.util.Scanner;

public class HealthCalculator {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter your gender (M/F): ");
        String gender = scanner.next();

        System.out.print("Enter your age: ");
        int age = scanner.nextInt();
    
        System.out.print("Enter your weight in kg: ");
        double weight = scanner.nextDouble();

        System.out.print("Enter your height in meters: ");
        double height = scanner.nextDouble();

        double bmi = calculateBMI(weight, height);

        System.out.printf("Your BMI is: %.2f%n", bmi);

        if (bmi < 18.5) {
            System.out.println("Underweight");
        } else if (bmi < 25) {
            System.out.println("Normal");
        } else if (bmi < 30) {
            System.out.println("Overweight");
        } else {
            System.out.println("Obese");
        }

        double bmr = calculateBMR(weight, height, age, gender);
        if (bmr == -1) {
            System.out.println("Invalid gender");
        } else {
            System.out.printf("Your BMR is: %.2f kcal/day\n", bmr);
        }

        scanner.close();
    }

    public static double calculateBMI(double weight, double height) {
        return weight / (height * height);
    }

    public static double calculateBMR(double weight, double height, int age, String gender) {

        if (gender.equals("M")) {
            return 66 + (13.7 * weight) + (5 * height * 100) - (6.8 * age);
        } else if (gender.equals("F")) {
            return 665 + (9.6 * weight) + (1.8 * height * 100) - (4.7 * age);
        } else {
            return 0;
        }

    }

}
