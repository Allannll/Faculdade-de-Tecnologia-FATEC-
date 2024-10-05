import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite o valor de x: ");
        int x = scanner.nextInt();
        System.out.print("Digite o valor de y: ");
        int y = scanner.nextInt();

        int z = (x * x) + (y * y);

        System.out.println("O valor de z é: " + z);
    }
}


public class MediaAlunoIfElse {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite a primeira nota: ");
        double nota1 = scanner.nextDouble();
        System.out.print("Digite a segunda nota: ");
        double nota2 = scanner.nextDouble();

        double media = (nota1 + nota2) / 2;

        if (media >= 6.0) {
            System.out.println("Aprovado!");
        } else {
            System.out.println("Reprovado!");
        }
    }
}


public class MediaAlunoWhile {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double nota1, nota2;
        double media;

        nota1 = nota2 = media = 0;

        while (true) {
            System.out.print("Digite a primeira nota: ");
            nota1 = scanner.nextDouble();
            System.out.print("Digite a segunda nota: ");
            nota2 = scanner.nextDouble();

            media = (nota1 + nota2) / 2;

            if (media >= 6.0) {
                System.out.println("Aprovado!");
            } else {
                System.out.println("Reprovado!");
            }

            break;
        }
    }
}


public class MediaAlunoFor {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double nota1, nota2;
        double media;

        nota1 = nota2 = media = 0;

        for (int i = 0; i < 1; i++) {
            System.out.print("Digite a primeira nota: ");
            nota1 = scanner.nextDouble();
            System.out.print("Digite a segunda nota: ");
            nota2 = scanner.nextDouble();

            media = (nota1 + nota2) / 2;

            if (media >= 6.0) {
                System.out.println("Aprovado!");
            } else {
                System.out.println("Reprovado!");
            }
        }
    }
}

public class Ex3 {
    public static void main(String[] args) {
        int somatorio = 0;

        for (int i = 100; i <= 500; i += 2) {
            somatorio += i;
        }

        System.out.println("O somatório dos números pares entre 100 e 500 é: " + somatorio);
    }
}


public class Ex4 {
    public static void main(String[] args) {
        BigInteger fatorial = BigInteger.ONE;
        int numero = 750;

        for (int i = 1; i <= numero; i++) {
            fatorial = fatorial.multiply(BigInteger.valueOf(i));
        }

        System.out.println("O fatorial de " + numero + " é: " + fatorial);
    }
}


import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int maior = Integer.MIN_VALUE;

        for (int i = 1; i <= 15; i++) {
            System.out.print("Digite o valor " + i + ": ");
            int valor = scanner.nextInt();

            if (valor > maior) {
                maior = valor;
            }
        }

        System.out.println("O maior valor é: " + maior);
    }
}
