#include <iostream>

using namespace std;

private function

void ex1() {
    int x, numero, somaPares = 0;

    // Solicita ao usuário a quantidade de números a serem lidos
    cout << "Digite a quantidade de numeros (x): ";
    cin >> x;

    // Lê x números
    for (int i = 0; i < x; i++) {
        cout << "Digite o numero " << (i + 1) << ": ";
        cin >> numero;

        // Verifica se o número é par
        if (numero % 2 == 0) {
            somaPares += numero; // Adiciona à soma se for par
        }
    }

    // Exibe a somatória dos números pares
    cout << "A somatoria dos numeros pares e: " << somaPares << endl;

    return 0;
}


void ex2(){
        int n;
    double temperatura, somaTemperaturas = 0.0;

    // Solicita ao usuário a quantidade de temperaturas a serem lidas
    cout << "Digite a quantidade de temperaturas (N): ";
    cin >> n;

    // Verifica se a quantidade é positiva
    if (n <= 0) {
        cout << "A quantidade de temperaturas deve ser maior que zero." << endl;
        return 1;
    }

    // Lê N temperaturas
    for (int i = 0; i < n; i++) {
        cout << "Digite a temperatura " << (i + 1) << ": ";
        cin >> temperatura;
        somaTemperaturas += temperatura; // Acumula a soma das temperaturas
    }

    // Calcula a média
    double mediaTemperaturas = somaTemperaturas / n;

    // Exibe a média das temperaturas
    cout << "A media das temperaturas e: " << mediaTemperaturas << endl;

    return 0;
}


void ex3(){

    int n;
    double temperatura, somaTemperaturas = 0.0;

    // Solicita ao usuário a quantidade de temperaturas a serem lidas
    cout << "Digite a quantidade de temperaturas (N): ";
    cin >> n;

    // Verifica se a quantidade é positiva
    if (n <= 0) {
        cout << "A quantidade de temperaturas deve ser maior que zero." << endl;
        return 1;
    }

    // Lê N temperaturas
    for (int i = 0; i < n; i++) {
        cout << "Digite a temperatura " << (i + 1) << ": ";
        cin >> temperatura;
        somaTemperaturas += temperatura; // Acumula a soma das temperaturas
    }

    // Calcula a média
    double mediaTemperaturas = somaTemperaturas / n;

    // Exibe a média das temperaturas
    cout << "A media das temperaturas e: " << mediaTemperaturas << endl;

    return 0;
}


void ex4(){

    // Função que calcula o fatorial de um número
unsigned long long calcularFatorial(int n) {
    if (n < 0) {
        return 0; // Fatorial não é definido para números negativos
    }
    unsigned long long fatorial = 1; // Inicializa o fatorial
    for (int i = 1; i <= n; i++) {
        fatorial *= i; // Multiplica para calcular o fatorial
    }
    return fatorial;
}
}