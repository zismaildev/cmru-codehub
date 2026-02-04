import java.util.Scanner;

class AreaShapeClass {
    private double area;
    private String shapeDetail;

    // Constructor for Circle
    AreaShapeClass(double radius) {
        area = Math.PI * radius * radius;
        shapeDetail = "Circle with radius = " + radius;
    }

    // Constructor for Rectangle
    AreaShapeClass(double width, double height) {
        area = width * height;
        shapeDetail = "Rectangle with width = " + width + " and height = " + height;
    }

    // Constructor for Triangle
    AreaShapeClass(double base, double height, boolean isTriangle) {
        if (isTriangle) {
            area = 0.5 * base * height;
            shapeDetail = "Triangle with base = " + base + " and height = " + height;
        }
    }

    public void showArea() {
        System.out.println(shapeDetail + " → Area = " + area);
    }
}

public class AreaShape {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Circle input
        System.out.print("Enter radius of the circle: ");
        double radius = scanner.nextDouble();
        AreaShapeClass circle = new AreaShapeClass(radius);

        // Rectangle input
        System.out.print("Enter width of the rectangle: ");
        double width = scanner.nextDouble();
        System.out.print("Enter height of the rectangle: ");
        double height = scanner.nextDouble();
        AreaShapeClass rectangle = new AreaShapeClass(width, height);

        // Triangle input
        System.out.print("Enter base of the triangle: ");
        double base = scanner.nextDouble();
        System.out.print("Enter height of the triangle: ");
        double triHeight = scanner.nextDouble();
        AreaShapeClass triangle = new AreaShapeClass(base, triHeight, true);

        System.out.println("\n=== Results ===");
        circle.showArea();
        rectangle.showArea();
        triangle.showArea();

        scanner.close();
    }
}
