import java.util.Scanner;

public class StudentGradeReport2D {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter number of students: ");
        int numStudents = scanner.nextInt();
        scanner.nextLine();
        
        String[][] studentInfo = new String[numStudents][2];
        
        double[][] scores = new double[numStudents][4];
        
        System.out.println("\n=== Enter Student Information ===");
        for (int i = 0; i < numStudents; i++) {
            System.out.println("\nStudent " + (i + 1) + ":");
            
            System.out.print("Enter Code: ");
            studentInfo[i][0] = scanner.nextLine();
            
            System.out.print("Enter Name: ");
            studentInfo[i][1] = scanner.nextLine();
            
            do {
                System.out.print("Enter Test 1 score (0-30): ");
                scores[i][0] = scanner.nextDouble();
                if (scores[i][0] < 0 || scores[i][0] > 30) {
                    System.out.println("Invalid score! Please enter between 0-30");
                }
            } while (scores[i][0] < 0 || scores[i][0] > 30);
            
            do {
                System.out.print("Enter Test 2 score (0-30): ");
                scores[i][1] = scanner.nextDouble();
                if (scores[i][1] < 0 || scores[i][1] > 30) {
                    System.out.println("Invalid score! Please enter between 0-30");
                }
            } while (scores[i][1] < 0 || scores[i][1] > 30);
            
            do {
                System.out.print("Enter Final Exam score (0-40): ");
                scores[i][2] = scanner.nextDouble();
                if (scores[i][2] < 0 || scores[i][2] > 40) {
                    System.out.println("Invalid score! Please enter between 0-40");
                }
            } while (scores[i][2] < 0 || scores[i][2] > 40);
            
            scanner.nextLine();
            
            scores[i][3] = scores[i][0] + scores[i][1] + scores[i][2];
        }
        
        double[] averages = calculateAverages(scores);
        
        displayReport(studentInfo, scores, averages);
        
        scanner.close();
    }
    
    public static double[] calculateAverages(double[][] scores) {
        double[] averages = new double[4];
        int numStudents = scores.length;
        
        for (int j = 0; j < 4; j++) {
            double sum = 0;
            for (int i = 0; i < numStudents; i++) {
                sum += scores[i][j];
            }
            averages[j] = sum / numStudents;
        }
        
        return averages;
    }
    
    public static void displayReport(String[][] studentInfo, double[][] scores, double[] averages) {
        
        System.out.println("\n" + "=".repeat(80));
        System.out.println("                         STUDENT GRADE REPORT");
        System.out.println("=".repeat(80));
        
        System.out.printf("%-10s %-25s %8s %8s %8s %8s%n", 
                         "Code", "Name", "Test 1", "Test 2", "Final", "Total");
        System.out.println("-".repeat(80));
        
        for (int i = 0; i < studentInfo.length; i++) {
            String displayName = studentInfo[i][1].length() > 25 ? 
                               studentInfo[i][1].substring(0, 22) + "..." : studentInfo[i][1];
            
            System.out.printf("%-10s %-25s %8.1f %8.1f %8.1f %8.1f%n",
                             studentInfo[i][0],
                             displayName,
                             scores[i][0],
                             scores[i][1],
                             scores[i][2],
                             scores[i][3]);
        }
        
        System.out.println("-".repeat(80));
        
        System.out.printf("%-10s %-25s %8.1f %8.1f %8.1f %8.1f%n",
                         "", "Average", 
                         averages[0],
                         averages[1],
                         averages[2],
                         averages[3]);
        
        System.out.println("=".repeat(80));
        
        displayStatistics(averages, studentInfo.length);
        
        displayHighLowScores(studentInfo, scores);
    }
    
    public static void displayStatistics(double[] averages, int numStudents) {
        System.out.println("\n=== SUMMARY STATISTICS ===");
        System.out.printf("Number of students: %d%n", numStudents);
        System.out.printf("Average Test 1 score: %.2f/30 (%.1f%%)%n", 
                         averages[0], (averages[0]/30)*100);
        System.out.printf("Average Test 2 score: %.2f/30 (%.1f%%)%n", 
                         averages[1], (averages[1]/30)*100);
        System.out.printf("Average Final Exam score: %.2f/40 (%.1f%%)%n", 
                         averages[2], (averages[2]/40)*100);
        System.out.printf("Average Total score: %.2f/100 (%.1f%%)%n", 
                         averages[3], averages[3]);
    }
    
    public static void displayHighLowScores(String[][] studentInfo, double[][] scores) {
        if (scores.length == 0) return;
        
        int highestIndex = 0;
        int lowestIndex = 0;
        
        for (int i = 1; i < scores.length; i++) {
            if (scores[i][3] > scores[highestIndex][3]) {
                highestIndex = i;
            }
            if (scores[i][3] < scores[lowestIndex][3]) {
                lowestIndex = i;
            }
        }
        
        System.out.println("\n=== TOP PERFORMER ===");
        System.out.printf("Highest Score: %s - %s (%.1f points)%n", 
                         studentInfo[highestIndex][0],
                         studentInfo[highestIndex][1],
                         scores[highestIndex][3]);
        
        System.out.println("\n=== NEEDS IMPROVEMENT ===");
        System.out.printf("Lowest Score: %s - %s (%.1f points)%n", 
                         studentInfo[lowestIndex][0],
                         studentInfo[lowestIndex][1],
                         scores[lowestIndex][3]);
        
        displaySubjectAnalysis(studentInfo, scores);
    }
    
    public static void displaySubjectAnalysis(String[][] studentInfo, double[][] scores) {
        System.out.println("\n=== SUBJECT ANALYSIS ===");
        String[] subjects = {"Test 1", "Test 2", "Final Exam"};
        double[] maxScores = {30.0, 30.0, 40.0};
        
        for (int subject = 0; subject < 3; subject++) {
            int bestIndex = 0;
            int worstIndex = 0;
            

            for (int i = 1; i < scores.length; i++) {
                if (scores[i][subject] > scores[bestIndex][subject]) {
                    bestIndex = i;
                }
                if (scores[i][subject] < scores[worstIndex][subject]) {
                    worstIndex = i;
                }
            }
            
            System.out.printf("\n%s (Max: %.0f points):%n", subjects[subject], maxScores[subject]);
            System.out.printf("  Best:  %s - %s (%.1f points)%n", 
                             studentInfo[bestIndex][0], studentInfo[bestIndex][1], scores[bestIndex][subject]);
            System.out.printf("  Worst: %s - %s (%.1f points)%n", 
                             studentInfo[worstIndex][0], studentInfo[worstIndex][1], scores[worstIndex][subject]);
        }
    }
}