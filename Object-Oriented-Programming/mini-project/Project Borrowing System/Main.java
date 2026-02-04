import java.util.Scanner;

abstract class Project {
    public abstract void showProject(); 
}

class Student extends Project {
    private String id;
    private String name;
    private String section;

    private String projectName;
    private String borrowDate;

    public Student(String id, String name, String section){
        this.id = id;
        this.name = name;
        this.section = section;
    }

    public String getID() { return id; }
    public void setID(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getSection() { return section; }
    public void setSection(String section) { this.section = section; }

    public void borrowProject(String projectName, String borrowDate){
        this.projectName = projectName;
        this.borrowDate = borrowDate;
    }

    @Override
    public void showProject() {
        System.out.println("==== Project Info ====");
        System.out.println("Student ID : " + this.id);
        System.out.println("Student Name : " + this.name);
        System.out.println("Section : " + this.section);

        if (projectName == null || projectName.isEmpty()) {
            System.out.println("No project borrowed.");
        } else {
            System.out.println("Project Name : " + this.projectName);
            System.out.println("Borrow Date : " + this.borrowDate);
        }
        System.out.println("======================");
    }
}

public class Main {
    public static void main(String[] agrs) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Student ID : ");
        String id = sc.nextLine().trim();

        System.out.print("Enter Student Name : ");
        String name = sc.nextLine().trim();

        System.out.print("Enter Section : ");
        String section = sc.nextLine().trim();

        Student student = new Student(id, name, section);
        
        System.out.print("Enter Borrow Project Name : ");
        String projectName = sc.nextLine().trim();

        System.out.print("Enter Borrow Date : ");
        String borrowDate = sc.nextLine().trim();

        student.borrowProject(projectName, borrowDate);

        student.showProject();

        sc.close();
    }    
}
