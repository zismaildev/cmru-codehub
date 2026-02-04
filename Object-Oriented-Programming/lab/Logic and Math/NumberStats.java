import java.util.Scanner;

public class NumberStats {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int totalCount = 0;
        int evenCount = 0;
        int oddCount = 0;

        int totalSum = 0;
        int evenSum = 0;
        int oddSum = 0;

        System.out.println("Enter integers (press Enter without typing anything to finish):");

        while (true) {
            System.out.print("Input: ");
            String input = scanner.nextLine();

            if (input.isEmpty()) {
                break;
            }

            try {
                int number = Integer.parseInt(input);
                totalCount++;
                totalSum += number;

                if (number % 2 == 0) {
                    evenCount++;
                    evenSum += number;
                } else {
                    oddCount++;
                    oddSum += number;
                }
            } catch (NumberFormatException e) {
                System.out.println("Invalid input. Please enter a valid integer.");
            }
        }
        System.out.println("\nStatistics:");
        System.out.println("-----------------");
        System.out.println("Total amount of data: " + totalCount);
        System.out.println("Even number: " + evenCount);
        System.out.println("Odd number: " + oddCount);

        System.out.println("Total Sum: " + totalSum);
        System.out.println("Even Sum: " + evenSum);
        System.out.println("Odd Sum: " + oddSum);

        System.out.println("Total average: " + (totalCount > 0 ? (double) totalSum / totalCount : 0));
        System.out.println("Even number average: " + (evenCount > 0 ? (double) evenSum / evenCount : 0));
        System.out.println("Odd average: " + (oddCount > 0 ? (double) oddSum / oddCount : 0));

        scanner.close();
    }
}
