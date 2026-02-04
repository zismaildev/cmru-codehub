import java.io.*;
import java.lang.Integer;

public class Switch2 {
    public static void main(String args[]) throws IOException {
        int a, b, answer, choice;
        double s = 0.00;
        InputStreamReader isr = new InputStreamReader(System.in);
        BufferedReader buffer = new BufferedReader(isr);
        String input = buffer.readLine();
        a = Integer.parseInt(input);
        input = buffer.readLine();
        b = Integer.parseInt(input);
        System.out.print("1: Add");
        System.out.print("2: Subtract");
        System.out.print("3: Multiply");
        System.out.print("4: Divide");
        System.out.print("Enter choice 1..4 : ");
        input = buffer.readLine();
        answer = Integer.parseInt(input);
        input = buffer.readLine();
        answer = Integer.parseInt(input);
        switch (answer) {
            case 1:
                s = a + b;

                System.out.print(a + "+" + b + "=" + s);
                break;
            case 2:
                s = a - b;

                System.out.print(a + "-" + b + "=" + s);
                break;
            case 3:
                s = a * b;

                System.out.print(a + "*" + b + "=" + s);
                break;
            case 4:
                s = a / b;

                System.out.print(a + "/" + b + "=" + s);
                break;

            default:
                System.out.print("Error ! \n");
        } /* End of Switch */
    }
}