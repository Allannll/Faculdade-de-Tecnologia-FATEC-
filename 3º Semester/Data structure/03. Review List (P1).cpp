#include <stdio.h> 

  

int main() { 

    int x, y, z; 

  

    // Entrada dos valores 

    printf("Digite o valor de X: "); 

    scanf("%d", &x); 

     

    printf("Digite o valor de Y: "); 

    scanf("%d", &y); 

  

    // Cálculo de Z 

    z = (x * x) + (y * y); 

  

    // Saída do resultado 

    printf("O valor de Z = X^2 + Y^2 é: %d\n", z); 

  

    return 0; 

} 


#include <iostream> 

using namespace std; 

  

int main() { 

    float nota1, nota2, media; 

    cout << "Digite as duas notas do aluno: "; 

    cin >> nota1 >> nota2; 

    media = (nota1 + nota2) / 2; 

     

    if (media >= 6.0) 

        cout << "APROVADO" << endl; 

    else 

        cout << "REPROVADO" << endl; 

     

    return 0; 

} 
 

#include <iostream> 

using namespace std; 

  

int main() { 

    int N, soma = 0; 

    cout << "Digite o tamanho N da matriz: "; 

    cin >> N; 

    int matriz[N][N]; 

     

    cout << "Digite os elementos da matriz:" << endl; 

    for (int i = 0; i < N; i++) { 

        for (int j = 0; j < N; j++) { 

            cin >> matriz[i][j]; 

        } 

    } 

     

    for (int i = 0; i < N; i += 2) { // Somando as linhas pares 

        for (int j = 0; j < N; j++) { 

            soma += matriz[i][j]; 

        } 

    } 

     

    cout << "Soma das linhas pares: " << soma << endl; 

    return 0; 

} 

 
 #include <iostream> 

#include <queue> 

using namespace std; 

  

struct Documento { 

    string nome; 

    int numFolhas; 

}; 

  

int main() { 

    queue<Documento> filaImpressao; 

    int n; 

    cout << "Quantos documentos deseja adicionar? "; 

    cin >> n; 

     

    for (int i = 0; i < n; i++) { 

        Documento doc; 

        cout << "Digite o nome do documento e o número de folhas: "; 

        cin >> doc.nome >> doc.numFolhas; 

        filaImpressao.push(doc); 

    } 

     

    cout << "Imprimindo documentos..." << endl; 

    while (!filaImpressao.empty()) { 

        Documento doc = filaImpressao.front(); 

        cout << "Imprimindo " << doc.nome << " com " << doc.numFolhas << " folhas." << endl; 

        filaImpressao.pop(); 

    } 

     

    return 0; 

} 


#include <iostream> 

#include <list> 

using namespace std; 

  

void removerNElementos(list<int>& lista, int N) { 

    for (int i = 0; i < N && !lista.empty(); i++) { 

        lista.pop_front(); // Remove o primeiro elemento 

    } 

} 

  

int main() { 

    list<int> lista = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}; 

    int N; 

    cout << "Quantos elementos deseja remover? "; 

    cin >> N; 

     

    removerNElementos(lista, N); 

     

    cout << "Lista após remover " << N << " elementos: "; 

    for (int num : lista) { 

        cout << num << " "; 

    } 

    cout << endl; 

     

    return 0; 

} 