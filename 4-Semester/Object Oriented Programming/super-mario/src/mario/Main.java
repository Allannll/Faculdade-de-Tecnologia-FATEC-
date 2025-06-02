package mario;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        Mario mario = new Mario(); // State Controller
        int option;
        boolean sair = false;

        while (!sair) {
            while (mario.isAlive()) {
                System.out.println("\n=== Controlador de estado do Mario ===");
                System.out.println("Estado atual: " + mario.getStateName());
                System.out.println("Escolha uma opção:");
                System.out.println("1 - Pegar cogumelo");
                System.out.println("2 - Pegar flor de fogo");
                System.out.println("3 - Pegar folha de tanooki");
                System.out.println("4 - Tomar dano");
                System.out.println("0 - Sair");
                System.out.print("Opção: ");

                option = scanner.nextInt();

                switch (option) {
                    case 1:
                        mario.takeMushroom();
                        break;
                    case 2:
                        mario.takeFireFlower();
                        break;
                    case 3:
                        mario.takeTanookiLeaf();
                        break;
                    case 4:
                        mario.takeDamage();
                        break;
                    case 0:
                        System.out.println("Saindo do jogo...");
                        sair = true;
                        break;
                    default:
                        System.out.println("Opção inválida. Tente novamente.");
                }

                if (sair) {
                    break;
                }
            }

            if (!mario.isAlive() && !sair) {
                System.out.print("\nQuer tentar novamente? (S/N): ");
                String restart = scanner.next().trim().toUpperCase();

                if (restart.equals("S")) {
                    mario.revive(); // restart game
                } else {
                    System.out.println("Saindo do jogo...");
                    sair = true;
                }
            }
        }

        scanner.close();
    }
}