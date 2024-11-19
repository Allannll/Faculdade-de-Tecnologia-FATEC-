import java.util.Scanner;

public class Main {

    public static void multiplyDiagonal() {
        int[][] matrix = new int[3][3];
        int k;
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter elements for the 3x3 matrix:");
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                matrix[i][j] = scanner.nextInt();
            }
        }

        System.out.println("Matrix before multiplication:");
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println();
        }

        System.out.print("Enter value for k: ");
        k = scanner.nextInt();

        for (int i = 0; i < 3; i++) {
            matrix[i][i] *= k;
        }

        System.out.println("Matrix after multiplication:");
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static void addMatrices() {
        int[][] A = new int[2][2];
        int[][] B = new int[2][2];
        int[][] C = new int[2][2];
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter elements for matrix A 2x2:");
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {
                A[i][j] = scanner.nextInt();
            }
        }

        System.out.println("Enter elements for matrix B 2x2:");
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {
                B[i][j] = scanner.nextInt();
            }
        }

        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {
                C[i][j] = A[i][j] + B[i][j];
            }
        }

        System.out.println("Matrix C (sum of A and B):");
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {
                System.out.print(C[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static void multiplyMatrices() {
        Scanner scanner = new Scanner(System.in);
        int m1, n1, m2, n2;

        System.out.print("Enter dimensions of matrix A (rows columns): ");
        m1 = scanner.nextInt();
        n1 = scanner.nextInt();

        System.out.print("Enter dimensions of matrix B (rows columns): ");
        m2 = scanner.nextInt();
        n2 = scanner.nextInt();

        if (n1 != m2) {
            System.out.println("Matrices cannot be multiplied.");
            return;
        }

        int[][] A = new int[m1][n1];
        int[][] B = new int[m2][n2];
        int[][] C = new int[m1][n2];

        System.out.println("Enter elements for matrix A:");
        for (int i = 0; i < m1; i++) {
            for (int j = 0; j < n1; j++) {
                A[i][j] = scanner.nextInt();
            }
        }

        System.out.println("Enter elements for matrix B:");
        for (int i = 0; i < m2; i++) {
            for (int j = 0; j < n2; j++) {
                B[i][j] = scanner.nextInt();
            }
        }

        for (int i = 0; i < m1; i++) {
            for (int j = 0; j < n2; j++) {
                C[i][j] = 0;
                for (int k = 0; k < n1; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        System.out.println("Matrix A:");
        for (int i = 0; i < m1; i++) {
            for (int j = 0; j < n1; j++) {
                System.out.print(A[i][j] + " ");
            }
            System.out.println();
        }

        System.out.println("Matrix B:");
        for (int i = 0; i < m2; i++) {
            for (int j = 0; j < n2; j++) {
                System.out.print(B[i][j] + " ");
            }
            System.out.println();
        }

        System.out.println("Matrix C (result of multiplication):");
        for (int i = 0; i < m1; i++) {
            for (int j = 0; j < n2; j++) {
                System.out.print(C[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        multiplyDiagonal();
        addMatrices();
        multiplyMatrices();
    }
}
