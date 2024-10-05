#include <iostream>
using namespace std;

class bolsonaro{
    public:
    //Funções para calculo
    int MédiaPonderada (int a, int b){

        int média = (a+b)/2;

        return média;

    }

    void ex1(){

        int nota1;
        int nota2;

        cout << "Informe a 1ª nota do aluno" << endl;
        cin >> nota1;
        cout << "Informe a 2ª nota do aluno" << endl;
        cin >> nota2;

        float mediaFinal = MédiaPonderada(nota1,nota2);

        string status;

        if (mediaFinal >= 6){
            status = "Aprovado";
        }else{
            status = "Reprovado";
        }

        cout << "O aluno foi: " << status << endl << "A média final do aluno é: " << mediaFinal << endl;

    }

    void ex2(){

        int num;

        cout << "Informe o número: ";
        cin >> num;

        string classe;

        if (num >= 28 || num <= 30){
            classe = "A";
        }else if (num >= 35 || num <= 100){
            classe = "B";
        }else if (num >= 100 || num <= 600){
            classe = "C";
        }else {
            classe = "Nenhuma classe";
        }

        cout << "Seu número se encaixa na seguinte classe: " << classe << endl;

    }

    void ex3(){
        
    double a, b, c;

    cout << "Digite o comprimento do primeiro lado: ";
    cin >> a;
    cout << "Digite o comprimento do segundo lado: ";
    cin >> b;
    cout << "Digite o comprimento do terceiro lado: ";
    cin >> c;
    if ((a + b > c) && (a + c > b) && (b + c > a)) {
        if (a == b && b == c) {
            cout << "Os lados formam um triângulo equilátero." << endl;
        } else if (a == b || b == c || a == c) {
            cout << "Os lados formam um triângulo isósceles." << endl;
        } else {
            cout << "Os lados formam um triângulo escaleno." << endl;
        }
    } else {
        cout << "As medidas fornecidas não formam um triângulo." << endl;
    }
}

    void ex4(){
            char operacao;
    double num1, num2, resultado;

    cout << "Digite o primeiro número: ";
    cin >> num1;
    cout << "Digite o segundo número: ";
    cin >> num2;
    cout << "Digite a operação (+, -, *, /): ";
    cin >> operacao;

    switch (operacao) {
        case '+':
            resultado = num1 + num2;
            cout << "Resultado: " << resultado << endl;
            break;
        case '-':
            resultado = num1 - num2;
            cout << "Resultado: " << resultado << endl;
            break;
        case '*':
            resultado = num1 * num2;
            cout << "Resultado: " << resultado << endl;
            break;
        case '/':

            if (num2 != 0) {
                resultado = num1 / num2;
                cout << "Resultado: " << resultado << endl;
            } else {
                cout << "Erro: Divisão por zero não é permitida." << endl;
            }
            break;
        default:
            cout << "Operação inválida. Por favor, escolha entre +, -, * ou /." << endl;
            break;
    }

}

    int main(){

        char escolha;

        cout << "Escolha o exercício:" << endl << "1-Média Ponderada  2-Verificação de classe  3-Medida de triângulo  4-Calculadora" << endl;
        cin >> escolha;

        switch(escolha){
            case 1:
                ex1();
                break;
            case 2:
                ex2();
                break;
            case 3:
                ex3();
                break;
            case 4:
                ex4();
                break;
        default:
        cout << "Operador inválido, digite as alternativas mencionadas.";

        return 0;
    }
}
};