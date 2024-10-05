#include <iostream>
using namespace std;

void multiplicarDiagonal() {
    int matriz[3][3];
    int k;

    // Leitura da matriz
    cout << "Digite os elementos da matriz 3x3:" << endl;
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            cin >> matriz[i][j];

    // Exibição da matriz antes da multiplicação
    cout << "Matriz antes da multiplicação:" << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++)
            cout << matriz[i][j] << " ";
        cout << endl;
    }

    // Leitura do valor de k
    cout << "Digite o valor de k: ";
    cin >> k;

    // Multiplicação dos elementos da diagonal principal
    for (int i = 0; i < 3; i++)
        matriz[i][i] *= k;

    // Exibição da matriz depois da multiplicação
    cout << "Matriz depois da multiplicação:" << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++)
            cout << matriz[i][j] << " ";
        cout << endl;
    }
}

int main() {
    multiplicarDiagonal();
    return 0;
}


#include <iostream>
using namespace std;

void somarMatrizes() {
    int A[2][2], B[2][2], C[2][2];

    cout << "Digite os elementos da matriz A 2x2:" << endl;
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 2; j++)
            cin >> A[i][j];

    cout << "Digite os elementos da matriz B 2x2:" << endl;
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 2; j++)
            cin >> B[i][j];

    // Soma das matrizes
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 2; j++)
            C[i][j] = A[i][j] + B[i][j];

    cout << "Matriz C (soma de A e B):" << endl;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++)
            cout << C[i][j] << " ";
        cout << endl;
    }
}

int main() {
    somarMatrizes();
    return 0;
}

#include <iostream>
using namespace std;

void multiplicarMatrizes() {
    int m1, n1, m2, n2;

    cout << "Digite as dimensões da matriz A (linhas colunas): ";
    cin >> m1 >> n1;
    cout << "Digite as dimensões da matriz B (linhas colunas): ";
    cin >> m2 >> n2;

    if (n1 != m2) {
        cout << "As matrizes não podem ser multiplicadas." << endl;
        return;
    }

    int A[m1][n1], B[m2][n2], C[m1][n2] = {0};

    cout << "Digite os elementos da matriz A:" << endl;
    for (int i = 0; i < m1; i++)
        for (int j = 0; j < n1; j++)
            cin >> A[i][j];

    cout << "Digite os elementos da matriz B:" << endl;
    for (int i = 0; i < m2; i++)
        for (int j = 0; j < n2; j++)
            cin >> B[i][j];

    // Multiplicação das matrizes
    for (int i = 0; i < m1; i++)
        for (int j = 0; j < n2; j++)
            for (int k = 0; k < n1; k++)
                C[i][j] += A[i][k] * B[k][j];

    cout << "Matriz A:" << endl;
    for (int i = 0; i < m1; i++) {
        for (int j = 0; j < n1; j++)
            cout << A[i][j] << " ";
        cout << endl;
    }

    cout << "Matriz B:" << endl;
    for (int i = 0; i < m2; i++) {
        for (int j = 0; j < n2; j++)
            cout << B[i][j] << " ";
        cout << endl;
    }

    cout << "Matriz C (resultado da multiplicação):" << endl;
    for (int i = 0; i < m1; i++) {
        for (int j = 0; j < n2; j++)
            cout << C[i][j] << " ";
        cout << endl;
    }
}

int main() {
    multiplicarMatrizes();
    return 0;
}

#include <iostream>
using namespace std;

void linhaMaiorSoma() {
    int matriz[3][3];

    cout << "Digite os elementos da matriz 3x3:" << endl;
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            cin >> matriz[i][j];

    int maxSoma = -1, linhaMaxSoma = -1;

    for (int i = 0; i < 3; i++) {
        int soma = 0;
        for (int j = 0; j < 3; j++)
            soma += matriz[i][j];
        if (soma > maxSoma) {
            maxSoma = soma;
            linhaMaxSoma = i;
        }
    }

    cout << "Matriz:" << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++)
            cout << matriz[i][j] << " ";
        cout << endl;
    }

    cout << "Linha com maior soma: ";
    for (int j = 0; j < 3; j++)
        cout << matriz[linhaMaxSoma][j] << " ";
    cout << endl;

    cout << "Soma: " << maxSoma << endl;
}

int main() {
    linhaMaiorSoma();
    return 0;
}

#include <iostream>
using namespace std;

void matrizTransposta() {
    int ordem;

    cout << "Digite a ordem da matriz (até 100): ";
    cin >> ordem;

    int A[ordem][ordem], AT[ordem][ordem];

    cout << "Digite os elementos da matriz:" << endl;
    for (int i = 0; i < ordem; i++)
        for (int j = 0; j < ordem; j++)
            cin >> A[i][j];

    // Cálculo da matriz transposta
    for (int i = 0; i < ordem; i++)
        for (int j = 0; j < ordem; j++)
            AT[j][i] = A[i][j];

    cout << "Matriz A:" << endl;
    for (int i = 0; i < ordem; i++) {
        for (int j = 0; j < ordem; j++)
            cout << A[i][j] << " ";
        cout << endl;
    }

    cout << "Matriz AT (transposta):" << endl;
    for (int i = 0; i < ordem; i++) {
        for (int j = 0; j < ordem; j++)
            cout << AT[i][j] << " ";
        cout << endl;
    }
}

int main() {
    matrizTransposta();
    return 0;
}

#include <iostream>
#include <vector>
#include <iomanip> // Para setprecision
using namespace std;

void pistaKart() {
    const int nCorredores = 6;
    const int voltas = 10;
    vector<vector<double>> tempos(nCorredores, vector<double>(voltas));
    vector<string> nomes(nCorredores);

    for (int i = 0; i < nCorredores; i++) {
        cout << "Digite o nome do corredor " << i + 1 << ": ";
        cin >> nomes[i];
        cout << "Digite os tempos do " << nomes[i] << ":" << endl;
        for (int j = 0; j < voltas; j++)
            cin >> tempos[i][j];
    }

    // Melhor volta da prova

#include <iostream>
#include <iomanip>
using namespace std;

void maiorMenorElemento() {
    const int linhas = 6, colunas = 3;
    double matriz[linhas][colunas];
    double maior, menor;
    int posMaiorLinha, posMaiorColuna, posMenorLinha, posMenorColuna;

    cout << "Digite os elementos da matriz 6x3 (números reais):" << endl;
    for (int i = 0; i < linhas; i++)
        for (int j = 0; j < colunas; j++)
            cin >> matriz[i][j];

    // Inicializando maior e menor
    maior = menor = matriz[0][0];
    posMaiorLinha = posMaiorColuna = 0;
    posMenorLinha = posMenorColuna = 0;

    for (int i = 0; i < linhas; i++) {
        for (int j = 0; j < colunas; j++) {
            if (matriz[i][j] > maior) {
                maior = matriz[i][j];
                posMaiorLinha = i;
                posMaiorColuna = j;
            }
            if (matriz[i][j] < menor) {
                menor = matriz[i][j];
                posMenorLinha = i;
                posMenorColuna = j;
            }
        }
    }

    cout << "Maior elemento: " << fixed << setprecision(2) << maior
         << " na posição (" << posMaiorLinha << ", " << posMaiorColuna << ")" << endl;
    cout << "Menor elemento: " << fixed << setprecision(2) << menor
         << " na posição (" << posMenorLinha << ", " << posMenorColuna << ")" << endl;
}

int main() {
    maiorMenorElemento();
    return 0;
}

#include <iostream>
using namespace std;

void multiplicaMatrizes(int A[][3], int B[][3], int C[][3], int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        for (int j = 0; j < tamanho; j++) {
            C[i][j] = 0;
            for (int k = 0; k < tamanho; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

bool verificarInversas(int A[][3], int B[][3], int tamanho) {
    int I[3][3] = {0};
    for (int i = 0; i < tamanho; i++)
        I[i][i] = 1;

    int C[3][3];
    multiplicaMatrizes(A, B, C, tamanho);

    for (int i = 0; i < tamanho; i++)
        for (int j = 0; j < tamanho; j++)
            if (C[i][j] != I[i][j])
                return false;

    return true;
}

int main() {
    const int tamanho = 3;
    int A[tamanho][tamanho], B[tamanho][tamanho];

    cout << "Digite os elementos da matriz A 3x3:" << endl;
    for (int i = 0; i < tamanho; i++)
        for (int j = 0; j < tamanho; j++)
            cin >> A[i][j];

    cout << "Digite os elementos da matriz B 3x3:" << endl;
    for (int i = 0; i < tamanho; i++)
        for (int j = 0; j < tamanho; j++)
            cin >> B[i][j];

    if (verificarInversas(A, B, tamanho))
        cout << "As matrizes A e B são inversas." << endl;
    else
        cout << "As matrizes A e B não são inversas." << endl;

    return 0;
}

#include <iostream>
using namespace std;

void verificarJogoDaVelha(char tabuleiro[3][3]) {
    // Verifica linhas e colunas para vencer
    for (int i = 0; i < 3; i++) {
        if (tabuleiro[i][0] == ' ' && tabuleiro[i][1] == tabuleiro[i][2] && tabuleiro[i][2] == tabuleiro[i][0])
            cout << "Posição para jogar: (" << i << ", 0)" << endl;
        if (tabuleiro[0][i] == ' ' && tabuleiro[1][i] == tabuleiro[2][i] && tabuleiro[2][i] == tabuleiro[0][i])
            cout << "Posição para jogar: (0, " << i << ")" << endl;
    }

    // Verifica diagonais
    if (tabuleiro[0][0] == ' ' && tabuleiro[1][1] == tabuleiro[2][2] && tabuleiro[1][1] == tabuleiro[0][0])
        cout << "Posição para jogar: (0, 0)" << endl;
    if (tabuleiro[0][2] == ' ' && tabuleiro[1][1] == tabuleiro[2][0] && tabuleiro[1][1] == tabuleiro[0][2])
        cout << "Posição para jogar: (0, 2)" << endl;

    // Caso não haja jogadas vencedoras, indicar que o jogo pode continuar
    cout << "Verifique manualmente as posições para possíveis jogadas vencedoras." << endl;
}

int main() {
    char tabuleiro[3][3];
    cout << "Digite o tabuleiro do jogo da velha (use 'X', 'O' e ' ' para espaços vazios):" << endl;
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            cin >> tabuleiro[i][j];

    verificarJogoDaVelha(tabuleiro);

    return 0;
}

#include <iostream>
#include <iomanip>
using namespace std;

void notasAlunos() {
    const int nAlunos = 3;
    const int nTurmas = 2;
    double M[nTurmas][nAlunos][3]; // [turma][aluno][notas e média]
    double mediaTurma[nTurmas] = {0};

    // Leitura das notas
    for (int t = 0; t < nTurmas; t++) {
        cout << "Digite as notas dos alunos da turma " << t + 1 << ":" << endl;
        for (int a = 0; a < nAlunos; a++) {
            cout << "Notas do aluno " << a + 1 << ": ";
            cin >> M[t][a][0] >> M[t][a][1];
            M[t][a][2] = (M[t][a][0] + M[t][a][1]) / 2.0;
            mediaTurma[t] += M[t][a][2];
        }
        mediaTurma[t] /= nAlunos;
    }

    // Encontrar a turma com maior média
    int turmaMelhor = 0;
    for (int t = 1; t < nTurmas; t++)
        if (mediaTurma[t] > mediaTurma[turmaMelhor])
            turmaMelhor = t;

    cout << "Turma com maior média: Turma " << turmaMelhor + 1 << " com média " << fixed << setprecision(2) << mediaTurma[turmaMelhor] << endl;

    // Alunos com média maior que a média da turma
    for (int t = 0; t < nTurmas; t++) {
        cout << "Alunos da turma " << t + 1 << " com média maior que a média da turma:" << endl;
        for (int a = 0; a < nAlunos; a++)
            if (M[t][a][2] > mediaTurma[t])
                cout << "Aluno " << a + 1 << " com média " << fixed << setprecision(2) << M[t][a][2] << endl;
    }
}

int main() {
    notasAlunos();
    return 0;
}
