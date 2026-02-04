import java.util.ArrayList;
import java.util.Arrays;

public class DivisibleNumbers {
    public static void main(String[] args) {
    
        System.out.println("=== Program to find numbers that are divisible by 3 and 5 (1-100) ===\n");
        
        // for loop
        System.out.println("1. for loop:");
        findDivisibleWithFor();
        
        System.out.println("\n" + "=".repeat(50) + "\n");
        
        // while loop
        System.out.println("2. while loop:");
        findDivisibleWithWhile();
        
        System.out.println("\n" + "=".repeat(50) + "\n");
        
        // do-while loop
        System.out.println("3. do-while loop:");
        findDivisibleWithDoWhile();
    }
    
    // for loop
    public static void findDivisibleWithFor() {
        ArrayList<Integer> numbers = new ArrayList<>();
        
        for (int i = 1; i <= 100; i++) {
            if (i % 3 == 0 && i % 5 == 0) {
                numbers.add(i);
            }
        }
        
        // แสดงผลลัพธ์
        System.out.println("Numbers that are divisible by 3 and 5: " + numbers);
        System.out.println("Number that is divisible: " + numbers.size());
    }
    
    // while loop
    public static void findDivisibleWithWhile() {
        ArrayList<Integer> numbers = new ArrayList<>();
        int i = 1;
        
        while (i <= 100) {
            if (i % 3 == 0 && i % 5 == 0) { 
                numbers.add(i);
            }
            i++;
        }
        
        System.out.println("Numbers that are divisible by 3 and 5: " + numbers);
        System.out.println("Number that is divisible: " + numbers.size());
    }
    
    // do-while loop
    public static void findDivisibleWithDoWhile() {
        ArrayList<Integer> numbers = new ArrayList<>();
        int i = 1;
        
        do {
            if (i % 3 == 0 && i % 5 == 0) {
                numbers.add(i);
            }
            i++;
        } while (i <= 100);
        
        System.out.println("Numbers that are divisible by 3 and 5: " + numbers);
        System.out.println("Number that is divisible: " + numbers.size());
    }
}