#include <iostream>
#include <stack>
#include <queue>
using namespace std;

void menuPilha();
void menuFila();

int main() {
    int opcao;

    do {
        cout << "\nMenu Principal:\n";
        cout << "1. Trabalhar com Pilha\n";
        cout << "2. Trabalhar com Fila\n";
        cout << "9. Sair\n";
        cout << "Escolha uma opção: ";
        cin >> opcao;

        switch(opcao) {
            case 1:
                menuPilha();
                break;
            case 2:
                menuFila();
                break;
            case 9:
                cout << "Saindo...\n";
                break;
            default:
                cout << "Opção inválida.\n";
                break;
        }
    } while(opcao != 9);

    return 0;
}

void menuPilha() {
    stack<int> pilha;
    int opcao, valor;

    do {
        cout << "\nMenu - Pilha:\n";
        cout << "1. PUSH (inserir)\n";
        cout << "2. POP (remover)\n";
        cout << "3. IMPRIMIR\n";
        cout << "9. Voltar ao Menu Principal\n";
        cout << "Escolha uma opção: ";
        cin >> opcao;

        switch(opcao) {
            case 1:
                cout << "Digite o valor a ser inserido na pilha: ";
                cin >> valor;
                pilha.push(valor);
                cout << "Valor inserido na pilha.\n";
                break;
            case 2:
                if (!pilha.empty()) {
                    cout << "Valor removido da pilha: " << pilha.top() << endl;
                    pilha.pop();
                } else {
                    cout << "A pilha está vazia!\n";
                }
                break;
            case 3:
                if (!pilha.empty()) {
                    stack<int> temp = pilha;
                    cout << "Conteúdo da pilha: ";
                    while (!temp.empty()) {
                        cout << temp.top() << " ";
                        temp.pop();
                    }
                    cout << endl;
                } else {
                    cout << "A pilha está vazia!\n";
                }
                break;
            case 9:
                cout << "Voltando ao Menu Principal...\n";
                break;
            default:
                cout << "Opção inválida.\n";
                break;
        }
    } while(opcao != 9);
}

void menuFila() {
    queue<int> fila;
    int opcao, valor;

    do {
        cout << "\nMenu - Fila:\n";
        cout << "1. Inserir\n";
        cout << "2. Remover\n";
        cout << "3. IMPRIMIR\n";
        cout << "9. Voltar ao Menu Principal\n";
        cout << "Escolha uma opção: ";
        cin >> opcao;

        switch(opcao) {
            case 1:
                cout << "Digite o valor a ser inserido na fila: ";
                cin >> valor;
                fila.push(valor);
                cout << "Valor inserido na fila.\n";
                break;
            case 2:
                if (!fila.empty()) {
                    cout << "Valor removido da fila: " << fila.front() << endl;
                    fila.pop();
                } else {
                    cout << "A fila está vazia!\n";
                }
                break;
            case 3:
                if (!fila.empty()) {
                    queue<int> temp = fila;
                    cout << "Conteúdo da fila: ";
                    while (!temp.empty()) {
                        cout << temp.front() << " ";
                        temp.pop();
                    }
                    cout << endl;
                } else {
                    cout << "A fila está vazia!\n";
                }
                break;
            case 9:
                cout << "Voltando ao Menu Principal...\n";
                break;
            default:
                cout << "Opção inválida.\n";
                break;
        }
    } while(opcao != 9);
}
