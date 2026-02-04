import java.util.Scanner;

public class StudentGradeReport {
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
        double[] average = new double[numStudents];
        
        for (int i = 0; i < numStudents; i++) {
            System.out.println("\n--- Student " + (i + 1) + " Information ---");
            
            System.out.print("Student ID: ");
            codes[i] = scanner.nextLine();
            
            System.out.print("Full Name: ");
            names[i] = scanner.nextLine();
            
            System.out.print("Test 1 Score (Max 30): ");
            test1[i] = scanner.nextDouble();
            
            System.out.print("Test 2 Score (Max 30): ");
            test2[i] = scanner.nextDouble();
            
            System.out.print("Final Exam Score (Max 40): ");
            finalExam[i] = scanner.nextDouble();
            scanner.nextLine();
            
            total[i] = test1[i] + test2[i] + finalExam[i];
            average[i] = total[i] / 100.0 * 100.0;
        }
        
        displayReport(codes, names, test1, test2, finalExam, total, average);
        
        scanner.close();
    }
    
    public static void displayReport(String[] codes, String[] names, double[] test1, 
                                   double[] test2, double[] finalExam, double[] total, double[] average) {
        System.out.println("\n" + "=".repeat(100));
        System.out.println("                              STUDENT GRADE REPORT");
        System.out.println("=".repeat(100));
        
        System.out.printf("%-12s %-25s %-10s %-10s %-12s %-10s %-10s %-8s%n",
                "Student ID", "Full Name", "Test 1", "Test 2", "Final Exam", 
                "Total", "Average", "Grade");
        System.out.printf("%-12s %-25s %-10s %-10s %-12s %-10s %-10s %-8s%n",
                "", "", "(30)", "(30)", "(40)", "(100)", "(%)", "");
        System.out.println("-".repeat(100));
        
        for (int i = 0; i < codes.length; i++) {
            String grade = calculateGrade(average[i]);
            System.out.printf("%-12s %-25s %-10.1f %-10.1f %-12.1f %-10.1f %-10.1f %-8s%n",
                    codes[i], names[i], test1[i], test2[i], finalExam[i], 
                    total[i], average[i], grade);
        }
        
        System.out.println("-".repeat(100));
        
        double totalSum = 0, averageSum = 0;
        for (int i = 0; i < total.length; i++) {
            totalSum += total[i];
            averageSum += average[i];
        }
        
        double overallAverage = averageSum / total.length;
        
        System.out.printf("%-49s %-12s %-10.1f %-10.1f%n", 
                "Overall Class Average", "", totalSum / total.length, overallAverage);
        System.out.println("=".repeat(100));
        
        System.out.println("\nAdditional Statistics:");
        System.out.println("Total Students: " + codes.length + " students");
        System.out.printf("Overall Average Score: %.2f points (%.2f%%)%n", 
                totalSum / total.length, overallAverage);
        
        int[] gradeCount = new int[5]; 
        String[] gradeLabels = {"A", "B+", "B", "C+", "C", "D+", "D", "F"};
        
        for (int i = 0; i < average.length; i++) {
            String grade = calculateGrade(average[i]);
            switch (grade) {
                case "A": gradeCount[0]++; break;
                case "B+": gradeCount[1]++; break;
                case "B": gradeCount[2]++; break;
                case "C+": gradeCount[3]++; break;
                case "C": gradeCount[4]++; break;
                case "D+": gradeCount[5]++; break;
                case "D": gradeCount[6]++; break;
                case "F": gradeCount[7]++; break;
            }
        }
        
        System.out.println("\nGrade Distribution:");
        String[] allGrades = {"A", "B+", "B", "C+", "C", "D+", "D", "F"};
        for (int i = 0; i < allGrades.length; i++) {
            if (i < gradeCount.length) {
                System.out.printf("Grade %s: %d students%n", allGrades[i], 
                    i < gradeCount.length ? gradeCount[i] : 0);
            } else {
                int count = 0;
                for (int j = 0; j < average.length; j++) {
                    if (calculateGrade(average[j]).equals(allGrades[i])) {
                        count++;
                    }
                }
                System.out.printf("Grade %s: %d students%n", allGrades[i], count);
            }
        }
    }
    
    public static String calculateGrade(double average) {
        if (average >= 80) return "A";
        else if (average >= 75) return "B+";
        else if (average >= 70) return "B";
        else if (average >= 65) return "C+";
        else if (average >= 60) return "C";
        else if (average >= 55) return "D+";
        else if (average >= 50) return "D";
        else return "F";
    }    
}
