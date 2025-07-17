import java.util.Scanner;
import java.math.BigInteger;

public class Ex1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the value of x: ");
        int x = scanner.nextInt();
        System.out.print("Enter the value of y: ");
        int y = scanner.nextInt();

        int z = (x * x) + (y * y);

        System.out.println("The value of z is: " + z);
    }
}

public class StudentGradeIfElse {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the first grade: ");
        double grade1 = scanner.nextDouble();
        System.out.print("Enter the second grade: ");
        double grade2 = scanner.nextDouble();

        double average = (grade1 + grade2) / 2;

        if (average >= 6.0) {
            System.out.println("Passed!");
        } else {
            System.out.println("Failed!");
        }
    }
}

public class StudentGradeWhile {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double grade1, grade2;
        double average;

        grade1 = grade2 = average = 0;

        while (true) {
            System.out.print("Enter the first grade: ");
            grade1 = scanner.nextDouble();
            System.out.print("Enter the second grade: ");
            grade2 = scanner.nextDouble();

            average = (grade1 + grade2) / 2;

            if (average >= 6.0) {
                System.out.println("Passed!");
            } else {
                System.out.println("Failed!");
            }

            break;
        }
    }
}

public class StudentGradeFor {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double grade1, grade2;
        double average;

        grade1 = grade2 = average = 0;

        for (int i = 0; i < 1; i++) {
            System.out.print("Enter the first grade: ");
            grade1 = scanner.nextDouble();
            System.out.print("Enter the second grade: ");
            grade2 = scanner.nextDouble();

            average = (grade1 + grade2) / 2;

            if (average >= 6.0) {
                System.out.println("Passed!");
            } else {
                System.out.println("Failed!");
            }
        }
    }
}

public class Ex3 {
    public static void main(String[] args) {
        int sum = 0;

        for (int i = 100; i <= 500; i += 2) {
            sum += i;
        }

        System.out.println("The sum of even numbers between 100 and 500 is: " + sum);
    }
}

public class Ex4 {
    public static void main(String[] args) {
        BigInteger factorial = BigInteger.ONE;
        int number = 750;

        for (int i = 1; i <= number; i++) {
            factorial = factorial.multiply(BigInteger.valueOf(i));
        }

        System.out.println("The factorial of " + number + " is: " + factorial);
    }
}

public class Ex5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int largest = Integer.MIN_VALUE;

        for (int i = 1; i <= 15; i++) {
            System.out.print("Enter value " + i + ": ");
            int value = scanner.nextInt();

            if (value > largest) {
                largest = value;
            }
        }

        System.out.println("The largest value is: " + largest);
    }
}
