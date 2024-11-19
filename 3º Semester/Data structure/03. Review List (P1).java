import java.util.*;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int x = scanner.nextInt();
        int y = scanner.nextInt();
        int z = (x * x) + (y * y);
        System.out.println("The value of Z = X^2 + Y^2 is: " + z);

        float grade1 = scanner.nextFloat();
        float grade2 = scanner.nextFloat();
        float average = (grade1 + grade2) / 2;
        if (average >= 6.0)
            System.out.println("APPROVED");
        else
            System.out.println("FAILED");

        int N = scanner.nextInt();
        int[][] matrix = new int[N][N];
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                matrix[i][j] = scanner.nextInt();
            }
        }
        int sum = 0;
        for (int i = 0; i < N; i += 2) {
            for (int j = 0; j < N; j++) {
                sum += matrix[i][j];
            }
        }
        System.out.println("Sum of even rows: " + sum);

        int n = scanner.nextInt();
        Queue<Document> printQueue = new LinkedList<>();
        for (int i = 0; i < n; i++) {
            Document doc = new Document();
            doc.name = scanner.next();
            doc.numPages = scanner.nextInt();
            printQueue.add(doc);
        }

        System.out.println("Printing documents...");
        while (!printQueue.isEmpty()) {
            Document doc = printQueue.poll();
            System.out.println("Printing " + doc.name + " with " + doc.numPages + " pages.");
        }

        int N2 = scanner.nextInt();
        List<Integer> list = new LinkedList<>(Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
        removeNElements(list, N2);
        for (int num : list) {
            System.out.print(num + " ");
        }
        System.out.println();
    }

    static class Document {
        String name;
        int numPages;
    }

    public static void removeNElements(List<Integer> list, int N) {
        for (int i = 0; i < N && !list.isEmpty(); i++) {
            list.remove(0);
        }
    }
}
