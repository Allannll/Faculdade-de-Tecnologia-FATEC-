import java.util.Stack;

public class PilhaUtil {

    // 1. Função que retorna o maior elemento da pilha
    public static int maiorElemento(Stack<Integer> pilha) {
        if (pilha.isEmpty()) {
            throw new IllegalArgumentException("A pilha está vazia");
        }
        
        int maior = pilha.peek();
        for (int elemento : pilha) {
            if (elemento > maior) {
                maior = elemento;
            }
        }
        
        return maior;
    }

    // 2. Função para verificar se duas pilhas são iguais
    public static boolean pilhasIguais(Stack<Integer> pilha1, Stack<Integer> pilha2) {
        if (pilha1.size() != pilha2.size()) {
            return false;
        }
        
        Stack<Integer> aux1 = new Stack<>();
        Stack<Integer> aux2 = new Stack<>();
        boolean iguais = true;
        
        while (!pilha1.isEmpty() && !pilha2.isEmpty()) {
            int elem1 = pilha1.pop();
            int elem2 = pilha2.pop();
            
            if (elem1 != elem2) {
                iguais = false;
            }
            
            aux1.push(elem1);
            aux2.push(elem2);
        }
        
        while (!aux1.isEmpty()) {
            pilha1.push(aux1.pop());
            pilha2.push(aux2.pop());
        }
        
        return iguais;
    }

    // 3. Função para preencher uma pilha com elementos de um vetor
    public static void preencherPilha(Stack<Integer> pilha, int[] vetor) {
        for (int elem : vetor) {
            pilha.push(elem);
        }
    }

    // 4. Programa para armazenar placas de carros e verificar a saída
    public static void verificarSaida(Stack<Integer> estacionamento, int placa) {
        Stack<Integer> auxiliar = new Stack<>();
        
        while (!estacionamento.isEmpty() && estacionamento.peek() != placa) {
            auxiliar.push(estacionamento.pop());
        }
        
        if (estacionamento.isEmpty()) {
            System.out.println("Carro não encontrado na rua.");
        } else {
            System.out.println("Carro encontrado. Sequência para retirada:");
            while (!auxiliar.isEmpty()) {
                System.out.println(auxiliar.pop());
            }
        }
    }

    // 5. Função para imprimir a sequência na ordem inversa
    public static void imprimirInverso(double[] sequencia) {
        Stack<Double> pilha = new Stack<>();
        
        for (double num : sequencia) {
            pilha.push(num);
        }
        
        while (!pilha.isEmpty()) {
            System.out.println(pilha.pop());
        }
    }

    // 6. Função TPilha para processar um vetor de 15 elementos
    public static void TPilha(int[] vetor) {
        Stack<Integer> pilha = new Stack<>();
        
        for (int num : vetor) {
            if (num % 2 == 0) {
                pilha.push(num);
            } else if (!pilha.isEmpty()) {
                pilha.pop();
            }
        }
        
        System.out.println("Elementos na pilha após processamento:");
        while (!pilha.isEmpty()) {
            System.out.println(pilha.pop());
        }
    }

    // 7. Função TPilha2 para manipular duas pilhas com um vetor de inteiros
    public static void TPilha2(Stack<Integer> N, Stack<Integer> P, int[] vetor) {
        for (int num : vetor) {
            if (num > 0) {
                P.push(num);
            } else if (num < 0) {
                N.push(num);
            } else {
                if (!N.isEmpty()) N.pop();
                if (!P.isEmpty()) P.pop();
            }
        }
    }

    // Exemplo de uso
    public static void main(String[] args) {
        // 1. Exemplo de uso da função maiorElemento
        Stack<Integer> pilha = new Stack<>();
        pilha.push(10);
        pilha.push(20);
        pilha.push(15);
        System.out.println("Maior elemento da pilha: " + maiorElemento(pilha));

        // 2. Exemplo de uso da função pilhasIguais
        Stack<Integer> pilha1 = new Stack<>();
        Stack<Integer> pilha2 = new Stack<>();
        pilha1.push(1); pilha1.push(2); pilha1.push(3);
        pilha2.push(1); pilha2.push(2); pilha2.push(3);
        System.out.println("As pilhas são iguais? " + pilhasIguais(pilha1, pilha2));

        // 3. Exemplo de uso da função preencherPilha
        int[] vetor = {1, 2, 3, 4, 5};
        Stack<Integer> novaPilha = new Stack<>();
        preencherPilha(novaPilha, vetor);
        System.out.println("Nova pilha preenchida: " + novaPilha);

        // 4. Exemplo de uso da função verificarSaida
        Stack<Integer> estacionamento = new Stack<>();
        estacionamento.push(1111);
        estacionamento.push(2222);
        estacionamento.push(3333);
        verificarSaida(estacionamento, 2222);

        // 5. Exemplo de uso da função imprimirInverso
        double[] sequencia = {1.1, 2.2, 3.3, 4.4, 5.5};
        System.out.println("Sequência na ordem inversa:");
        imprimirInverso(sequencia);

        // 6. Exemplo de uso da função TPilha
        int[] vetor15 = {2, 4, 1, 6, 3, 8, 7, 12, 9, 14, 11, 16, 13, 18, 5};
        TPilha(vetor15);

        // 7. Exemplo de uso da função TPilha2
        Stack<Integer> N = new Stack<>();
        Stack<Integer> P = new Stack<>();
        int[] vetor2 = {3, -4, 0, 5, -6, 7, -8, 0};
        TPilha2(N, P, vetor2);
        System.out.println("Pilha de números positivos: " + P);
        System.out.println("Pilha de números negativos: " + N);
    }
}
