#include <iostream>
using namespace std;

double calcularFuncao(double x) {
    double resultado = x * x - 3 * x + 5;
    return resultado;
}

int main() {
    double numeroReal;

    std::cout << "Digite um numero real para função >> f(x) = x² - 3x + 5 <<: ";
    std::cin >> numeroReal;

    double resultado = calcularFuncao(numeroReal);

    std::cout << "O valor de f(" << numeroReal << ") é: " << resultado << std::endl;

    return 0;
}

void 2{

    float nota1,nota2,nota3;
    float media, mediadaturma;

    cout << "Informe a nota da primeira prova: ";
    cin >> nota1;
    cout << "Informe a nota da segunda prova: ";
    cin >> nota2;
    cout << "Informe a nota da terceiro prova: ";
    cin >> nota3;

    media= (nota1+nota2+nota3)/3;
    mediadaturma= 5;

    if(media >= mediadaturma){
        cout <<"Sua média é: " << media << "/nVocê está abaixo da média da turma (5)." << endl;
    }
    else{
        cout <<"Sua média é: " << media << "/nVocê está abaixo da média da turma (5)." << endl;
    }
    
return 0;
}

void 3{

    int numero

    cout << "Informe um número inteiro: "
    cin >> numero

    


}