import java.util.Scanner;

public class StudentGradeReportV2 {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter number of students: ");
        int numStudents = scanner.nextInt();
        scanner.nextLine();
        
        String[] codes = new String[numStudents];
        String[] names = new String[numStudents];
        double[] test1 = new double[numStudents];
        double[] test2 = new double[numStudents];
        double[] finalExam = new double[numStudents];
        double[] total = new double[numStudents];
        
        System.out.println("\n=== Enter Student Information ===");
        for (int i = 0; i < numStudents; i++) {
            System.out.println("\nStudent " + (i + 1) + ":");
            
            System.out.print("Enter Code: ");
            codes[i] = scanner.nextLine();
            
            System.out.print("Enter Name: ");
            names[i] = scanner.nextLine();
            
            do {
                System.out.print("Enter Test 1 score (0-30): ");
                test1[i] = scanner.nextDouble();
                if (test1[i] < 0 || test1[i] > 30) {
                    System.out.println("Invalid score! Please enter between 0-30");
                }
            } while (test1[i] < 0 || test1[i] > 30);
            
            do {
                System.out.print("Enter Test 2 score (0-30): ");
                test2[i] = scanner.nextDouble();
                if (test2[i] < 0 || test2[i] > 30) {
                    System.out.println("Invalid score! Please enter between 0-30");
                }
            } while (test2[i] < 0 || test2[i] > 30);
            
            do {
                System.out.print("Enter Final Exam score (0-40): ");
                finalExam[i] = scanner.nextDouble();
                if (finalExam[i] < 0 || finalExam[i] > 40) {
                    System.out.println("Invalid score! Please enter between 0-40");
                }
            } while (finalExam[i] < 0 || finalExam[i] > 40);
            
            scanner.nextLine();
            
            total[i] = test1[i] + test2[i] + finalExam[i];
        }
        
        double avgTest1 = calculateAverage(test1);
        double avgTest2 = calculateAverage(test2);
        double avgFinal = calculateAverage(finalExam);
        double avgTotal = calculateAverage(total);
        
        displayReport(codes, names, test1, test2, finalExam, total, 
                     avgTest1, avgTest2, avgFinal, avgTotal);
        
        scanner.close();
    }
    
    public static double calculateAverage(double[] scores) {
        double sum = 0;
        for (double score : scores) {
            sum += score;
        }
        return sum / scores.length;
    }
    
    public static void displayReport(String[] codes, String[] names, 
                                   double[] test1, double[] test2, 
                                   double[] finalExam, double[] total,
                                   double avgTest1, double avgTest2, 
                                   double avgFinal, double avgTotal) {
        
        System.out.println("\n" + "=".repeat(80));
        System.out.println("                         STUDENT GRADE REPORT");
        System.out.println("=".repeat(80));
        
        System.out.printf("%-10s %-25s %8s %8s %8s %8s%n", 
                         "Code", "Name", "Test 1", "Test 2", "Final", "Total");
        System.out.println("-".repeat(80));
        
        for (int i = 0; i < codes.length; i++) {
            System.out.printf("%-10s %-25s %8.1f %8.1f %8.1f %8.1f%n",
                             codes[i], 
                             names[i].length() > 25 ? names[i].substring(0, 22) + "..." : names[i],
                             test1[i], test2[i], finalExam[i], total[i]);
        }
        
        System.out.println("-".repeat(80));
        
        System.out.printf("%-10s %-25s %8.1f %8.1f %8.1f %8.1f%n",
                         "", "Average", avgTest1, avgTest2, avgFinal, avgTotal);
        
        System.out.println("=".repeat(80));
        
        System.out.println("\n=== SUMMARY STATISTICS ===");
        System.out.printf("Number of students: %d%n", codes.length);
        System.out.printf("Average Test 1 score: %.2f/30 (%.1f%%)%n", 
                         avgTest1, (avgTest1/30)*100);
        System.out.printf("Average Test 2 score: %.2f/30 (%.1f%%)%n", 
                         avgTest2, (avgTest2/30)*100);
        System.out.printf("Average Final Exam score: %.2f/40 (%.1f%%)%n", 
                         avgFinal, (avgFinal/40)*100);
        System.out.printf("Average Total score: %.2f/100 (%.1f%%)%n", 
                         avgTotal, avgTotal);
        
        displayHighLowScores(codes, names, total);
    }
    
    public static void displayHighLowScores(String[] codes, String[] names, double[] total) {
        if (total.length == 0) return;
        
        int highestIndex = 0;
        int lowestIndex = 0;
        
        for (int i = 1; i < total.length; i++) {
            if (total[i] > total[highestIndex]) {
                highestIndex = i;
            }
            if (total[i] < total[lowestIndex]) {
                lowestIndex = i;
            }
        }
        
        System.out.println("\n=== TOP PERFORMER ===");
        System.out.printf("Highest Score: %s - %s (%.1f points)%n", 
                         codes[highestIndex], names[highestIndex], total[highestIndex]);
        
        System.out.println("\n=== NEEDS IMPROVEMENT ===");
        System.out.printf("Lowest Score: %s - %s (%.1f points)%n", 
                         codes[lowestIndex], names[lowestIndex], total[lowestIndex]);
    }
}