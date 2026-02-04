public class BubbleSortDemo {
    
    // 1. Bubble Sort ใช้ for loop
    public static void bubbleSortFor(int[] arr) {
        int n = arr.length;
        System.out.println("=== Bubble Sort using for loop ===");
        
        for (int i = 0; i < n - 1; i++) {
            boolean swapped = false;
            
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }
            
            System.out.println("Pass " + (i + 1) + ": " + arrayToString(arr));
            
            if (!swapped) {
                break;
            }
        }
    }
    
    // 2. Bubble Sort ใช้ while loop
    public static void bubbleSortWhile(int[] arr) {
        int n = arr.length;
        System.out.println("\n=== Bubble Sort using while loop ===");
        
        int i = 0;
        while (i < n - 1) {
            boolean swapped = false;
            int j = 0;
            
            while (j < n - i - 1) {
                if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                    swapped = true;
                }
                j++;
            }
            
            i++;
            System.out.println("Pass " + i + ": " + arrayToString(arr));
            
            if (!swapped) {
                break;
            }
        }
    }
    
    // 3. Bubble Sort ใช้ do-while loop
    public static void bubbleSortDoWhile(int[] arr) {
        int n = arr.length;
        System.out.println("\n=== Bubble Sort using do-while loop ===");
        
        int i = 0;
        do {
            boolean swapped = false;
            int j = 0;
            
            do {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
                j++;
            } while (j < n - i - 1);
            
            i++;
            System.out.println("Pass " + i + ": " + arrayToString(arr));
            
            if (!swapped) {
                break;
            }
        } while (i < n - 1);
    }
    
    // Helper function to display array
    public static String arrayToString(int[] arr) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < arr.length; i++) {
            sb.append(arr[i]);
            if (i < arr.length - 1) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }
    
    // Function to copy array
    public static int[] copyArray(int[] original) {
        int[] copy = new int[original.length];
        for (int i = 0; i < original.length; i++) {
            copy[i] = original[i];
        }
        return copy;
    }
    
    public static void main(String[] args) {
        int[] originalArray = {64, 34, 25, 12, 22, 11, 90};
        
        System.out.println("Initial array: " + arrayToString(originalArray));
        System.out.println("=".repeat(50));
        
        int[] arr1 = copyArray(originalArray);
        bubbleSortFor(arr1);
        
        int[] arr2 = copyArray(originalArray);
        bubbleSortWhile(arr2);
        
        int[] arr3 = copyArray(originalArray);
        bubbleSortDoWhile(arr3);
        
        System.out.println("\n" + "=".repeat(50));
        System.out.println("Final results from all 3 methods:");
        System.out.println("For loop:     " + arrayToString(arr1));
        System.out.println("While loop:   " + arrayToString(arr2));
        System.out.println("Do-while loop: " + arrayToString(arr3));
        
        boolean allSame = true;
        for (int i = 0; i < arr1.length; i++) {
            if (arr1[i] != arr2[i] || arr1[i] != arr3[i]) {
                allSame = false;
                break;
            }
        }
        
        if (allSame) {
            System.out.println("All three methods produced the same result");
        } else {
            System.out.println("Results are different");
        }
    }
}