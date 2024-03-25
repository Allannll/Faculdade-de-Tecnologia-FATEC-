#include <iostream> 
using namespace std;

    void ex1() {
    int main() {
    int nota1, nota2, nota3, nota4, notat;

    cout << "Informe sua primeira nota: ";
    cin >> nota1;
    cout << "Informe sua segunda nota: ";
    cin >> nota2;
    cout << "Informe sua terceira nota: ";
    cin >> nota3;
    cout << "Informe sua quarta nota: ";
    cin >> nota4;

    notat= (nota1+nota2+nota3+nota4)/4;

    cout << "Nota final: " << notat << "." << endl;

    return 0;
    }
    }

void ex2(){

    int nota1, nota2, notat;

    cout << "Informe sua primeira nota: ";
    cin >> nota1;
    cout << "Informe sua segunda nota: ";
    cin >> nota2;

    notat= (nota2+nota1)/2;

    if (notat <= 3) {
        cout <<"Sua nota é: " << notat << "\n Status: Reprovado" << endl;
    }
    else if(notat <= 7 ) {
        cout <<"Sua nota é: " << notat << "\n Status: Exame" << endl;
    }
    else{
        cout <<"Sua nota é: " << notat <<  "\n Status: Aprovado" << endl;
    }
    return 0; 
    }

void ex3(){
    
    int num1, num2;

    cout << "Informe o primeiro número: ";
    cin >> num1;
    cout << "Informe o segundo número: ";
    cin >> num2;

    if (num1 < num2){
        cout <<"O menor número é " << num1 << endl;

    }else{
        cout <<"O menor número é " << num2 << endl;

    }

}

void ex4(){

    int num1,num2, num3;

    cout << "Informe o primeiro número: ";
    cin >> num1;
    cout << "Informe o segundo número: ";
    cin >> num2;
    cout << "Informe o terceiro número: ";
    cin >> num3;

    if (num1 >= num2 && num1 >= num3){
        cout <<"O maior número é " << num1 << endl;

    }else if(num2 >= num1 && num2 >= num3){
        cout <<"O maior número é " << num2 << endl;
    }
    else {
        cout <<"O maior número é " << num3 << endl;

    }
}


void ex5() {

    float num1, num2;
    int escolha;

    cout << "Digite o primeiro número: ";
    cin >> num1;
    cout << "Ditite o segundo número: ";
    cin >> num2;

    cout <<"Escolha uma opção:" << endl;
    cout << "1. Média entre os números digitados" << endl;
    cout << "2. Diferença do maior pelo menor" << endl;
    cout <<" 3. Produto entre os números digitados" << endl;
    cout <<" 4. Divisão do primeiro pelo segundo" << endl;
    cin >> escolha;

switch(escolha){

    case 1:
        cout << "A média entre os número é " << (num1+num2)/2 << endl;
    break;

    case 2:
        if (num1 > num2){
            cout << "A diferença entre o maior pelo menor é " << num1-num2 << endl;
    }
    else {
        cout << "A diferença entre o maior pelo menor é " << num2-num1 << endl;
    }
    break;

    case 3:
        cout << "O produto entre os dois números: " << num1*num2 << endl;
    break;

    case4:
        if (num2 != 0){
            cout << "A divisão do primeiro pelo segundo é " << num1/num2 << endl;
    }
    else{
        cout << "A divisão não pode ser feita por zero.";
    break;

    default:
        cout <<"Opção inválida" << endl;
    return 1;
    }

    return 0;
}


void ex6(){

    #include <cmath>

    double num1, num2;
    int escolha;

    cout << "Digite o primeiro número: ";
    cin >> num1;
    cout << "Ditite o segundo número: ";
    cin >> num2;

    cout <<"Escolha uma opção:" << endl;
    cout << "1. O primeiro número elevado ao segundo número." << endl;
    cout << "2. Raiz quadrada de cada um dos números." << endl;
    cout <<" 3. Raiz cúbica de cada um dos números." << endl;

    cin >> escolha;

    switch(escolha){
        case 1:
            cout << "O resultado da potência é: " << pow(num1, num2) << endl;
        break;

        case 2: 
            cout << "A raiz quadrada do primeiro número é: " << sqrt(num1) << endl;
            cout << "A raiz quadrada do segundo número é: " << sqrt(num2) << endl;
        break;

        case 3:
            cout << "A raiz cúbica do primeiro número é: " << cbrt(num1) << endl;
            cout << "A raiz cúbica do segundo número é: " << cbrt(num2) << endl;

        default:
            cout <<"Opção inválida" << endl;
        return 1; 
    }
    return 0;
}


void ex7(){

    float salario, salarior, ajuste;

    cout << " Informe seu salário: ";
    cin >> salario;

        if (salario <= 500){
            ajuste= (30.0/100)*salario;
            salarior= salario + ajuste;
            cout << "Seu salário passará a ser: " << salarior << "\n Seu aumento foi de: " << ajuste << endl;
    }
        else{
            cout << "Você não tem direito ao aumento.";
    }
}

void ex8 (){

    float salario, salariot;

    cout << "Informe seu salário: ";
    cin >> salario;

        if (salario <= 300){
            salariot= (35.0/100)*salario;
            salario= salario+salariot;
            cout << "Seu salário foi reajustado para: " << salario << endl;
    }
        else {
            salariot= (15.0/100)*salario;
            salario= salario+salariot;
            cout << "Seu salário foi reajustado para: " << salario << endl;
    }

}

void ex9 (){

        float salario, credito;

        cout <<"Informe seu salário: ";
        cin >> salario;

            if (salario >= 400){
                credito= (30.0/100)*salario;
                cout <<"Seu crédito é: " << credito << endl;
            }
            else if (salario <= 300){
                credito= (25.0/100)*salario;
                cout <<"Seu crédito é: " << credito << endl;
            }
            else if (salario <= 200){
                credito= (20.0/100)*salario;
                cout <<"Seu crédito é: " << credito << endl;
            }
            else{
                credito= (10.0/100)*salario;
                cout <<"Seu crédito é: " << credito << endl;
            }
}

void ex10 (){


        float custoFabrica, precoConsumidor;

        cout << "Digite o custo de fábrica do carro: R$ ";
        cin >> custoFabrica;

        if (custoFabrica <= 12000) {
            precoConsumidor = custoFabrica;
        } else if (custoFabrica <= 25000) {
            precoConsumidor = custoFabrica + (custoFabrica * 0.15) + (custoFabrica * 0.05);
        } else {
            precoConsumidor = custoFabrica + (custoFabrica * 0.20) + (custoFabrica * 0.05);
        }

        cout << "O preço ao consumidor do carro é: R$ " << precoConsumidor << endl;

        return 0;
}

void ex11 (){

        float salario, salarioajustado, aumento;

        cout << "Digite o seu salário: ";
        cin >> salario;

        if (salario <= 300) {
            salarioajustado = salario + (15.0 / 100) * salario;
            aumento = salarioajustado - salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        } else if (salario <= 600) {
            salarioajustado = salario + (10.0 / 100) * salario;
            aumento = salarioajustado - salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        } else if (salario <= 900) {
            salarioajustado = salario + (5.0 / 100) * salario;
            aumento = salarioajustado - salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        } else {
            aumento = salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        }

        return 0;
}

void ex12 (){

    int main (){
        float salariob, salariol;

        cout <<"Digite seu salário bruto: ";
        cin >> salariob;

        if (salariob <= 350){;
            salariol= salariob+100;
            salariol= salariol-((7.0/100)/salario)
            cout <<"Salário líquido: R$" << salariol << endl;
            }
        else if (salariob <= 600){
            salariol= salariob+75
            salariol= salariol-((7.0/100)/salario)
            }
        else if (salairob <= 900){
            salariol= salariob+50
            salariol= salariol-((7.0/100)/salario)
            }
        else{
            salariol= salariob+35
            salariol= salariol-((7.0/100)/salario)
            } 
    return 0;
    }
}

void ex13 (){



}

