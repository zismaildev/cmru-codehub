public class Samefor {
    public static void main(String[] args) {
        int counter,sum = 0;
        for (counter=1; counter <= 10; counter++) {
            sum += counter;
            System.out.println("Counter["+counter+"] = "+counter+ " ");
        }
        System.out.println("Sum = " + sum);
    }
}