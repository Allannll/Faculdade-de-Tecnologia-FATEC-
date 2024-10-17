#include <iostream>
#include <limits>

using namespace std;

void ex1() {
    double peso, altura;
    double maiorPeso = numeric_limits<double>::lowest();
    double menorPeso = numeric_limits<double>::max();
    double maiorAltura = numeric_limits<double>::lowest();
    double menorAltura = numeric_limits<double>::max();
    double maiorIMC = numeric_limits<double>::lowest();
    double menorIMC = numeric_limits<double>::max();
    double somaPesos = 0.0, somaAlturas = 0.0, somaIMCs = 0.0;
    int contador = 0;

    char continuar;

    do {
        // Solicita o peso e altura
        cout << "Digite o peso da pessoa (kg): ";
        cin >> peso;
        cout << "Digite a altura da pessoa (m): ";
        cin >> altura;

        // Calcula o IMC
        double imc = peso / (altura * altura);

        // Atualiza as estatísticas
        maiorPeso = max(maiorPeso, peso);
        menorPeso = min(menorPeso, peso);
        maiorAltura = max(maiorAltura, altura);
        menorAltura = min(menorAltura, altura);
        maiorIMC = max(maiorIMC, imc);
        menorIMC = min(menorIMC, imc);

        // Acumula para médias
        somaPesos += peso;
        somaAlturas += altura;
        somaIMCs += imc;
        contador++;

        // Pergunta se o usuário deseja continuar
        cout << "Deseja digitar os dados de mais uma pessoa? (s/n): ";
        cin >> continuar;

    } while (continuar == 's' || continuar == 'S');

    // Calcula as médias
    double mediaPesos = contador > 0 ? somaPesos / contador : 0;
    double mediaAlturas = contador > 0 ? somaAlturas / contador : 0;
    double mediaIMCs = contador > 0 ? somaIMCs / contador : 0;

    // Exibe os resultados
    cout << "\nResultados:" << endl;
    cout << "Maior Peso: " << maiorPeso << " kg" << endl;
    cout << "Menor Peso: " << menorPeso << " kg" << endl;
    cout << "Maior Altura: " << maiorAltura << " m" << endl;
    cout << "Menor Altura: " << menorAltura << " m" << endl;
    cout << "Maior IMC: " << maiorIMC << endl;
    cout << "Menor IMC: " << menorIMC << endl;
    cout << "Media de Pesos: " << mediaPesos << " kg" << endl;
    cout << "Media de Alturas: " << mediaAlturas << " m" << endl;
    cout << "Media de IMCs: " << mediaIMCs << endl;

    //return 0;
}


void ex2(){

    int numero;
    unsigned long long fatorial = 1; // Usamos unsigned long long para suportar números grandes

    // Solicita ao usuário um número
    cout << "Digite um numero para calcular o fatorial: ";
    cin >> numero;

    // Verifica se o número é negativo
    if (numero < 0) {
        cout << "Fatorial nao e definido para numeros negativos." << endl;
    } else {
        int contador = numero; // Inicializa o contador com o número informado

        // Laço while para calcular o fatorial
        while (contador > 1) {
            fatorial *= contador; // Multiplica o fatorial pelo contador
            contador--; // Decrementa o contador
        }

        // Exibe o resultado
        cout << "O fatorial de " << numero << " e: " << fatorial << endl;
    }

    //return 0;
}
