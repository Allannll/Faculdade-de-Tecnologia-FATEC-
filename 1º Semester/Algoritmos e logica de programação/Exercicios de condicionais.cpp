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

        float salario, salarioAjustado, aumento;

        cout << "Digite o seu salário: ";
        cin >> salario;

        if (salario <= 300) {
            salarioAjustado = salario + (15.0 / 100) * salario;
            aumento = salarioAjustado - salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        } else if (salario <= 600) {
            salarioAjustado = salario + (10.0 / 100) * salario;
            aumento = salarioAjustado - salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        } else if (salario <= 900) {
            salarioAjustado = salario + (5.0 / 100) * salario;
            aumento = salarioAjustado - salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        } else {
            aumento = salario;
            cout << "Seu aumento foi de: R$ " << aumento << endl;
        }

        return 0;
}

void ex12 (){

        float salariob, salarioL;

        cout <<"Digite seu salário bruto: ";
        cin >> salariob;

        if (salariob <= 350){;
            salarioL= salariob+100;
            salarioL= salarioL-((7.0/100)/salario)
            cout <<"Salário líquido: R$" << salarioL << endl;
            }
        else if (salariob <= 600){
            salarioL= salariob+75
            salarioL= salarioL-((7.0/100)/salario)
            }
        else if (salairob <= 900){
            salarioL= salariob+50
            salarioL= salarioL-((7.0/100)/salario)
            }
        else{
            salarioL= salariob+35
            salarioL= salarioL-((7.0/100)/salario)
            } 
    return 0;
    }


void ex13 (){

#include <iostream>

    float preco, novoPreco;
    
    cout << "Digite o preco do produto: R$ ";
    cin >> preco;
    

    int percentual;
    if (preco <= 50.00) {
        percentual = 5;
    } else if (preco <= 100.00) {
        percentual = 10;
    } else {
        percentual = 15;
    }
    

    novoPreco = preco + (preco * percentual / 100.0);
    
    string classificacao;
    if (novoPreco <= 80.00) {
        classificacao = "Barato";
    } else if (novoPreco <= 120.00) {
        classificacao = "Normal";
    } else if (novoPreco <= 200.00) {
        classificacao = "Caro";
    } else {
        classificacao = "Muito caro";
    }
    
    cout << "Novo preco: R$ " << novoPreco << endl;
    cout << "Classificacao: " << classificacao << endl;
    
    return 0;
}

void 14 (){

float salario, salarioNovo, aumento;

    cout << "Informe seu salário: R$ ";
    cin >> salario;

    if (salario <= 300){
        salario= salario+(salario * 50/100);
    }
    else if(salario <= 500){
        salario= salario+(salario * 40/100);
    }       
    else if(salario <= 700){
        salario= salario+(salario * 30/100);   
    }
    else if(salario <= 800){
        salario= salario+(salario * 20/100);   
    }
        else if(salario <= 1000){
        salario= salario+(salario * 10/100);   
    }
            else{
        salario= salario+(salario * 5/100);   
    }

    cout <<"Aumento do salário: R$ " << salario << endl;

return 0;
}

void 15(){

    int tipo;
    float valor;

    cout <<"Informe o valor do investimento: R$ ";
    cin >> valor;

    cout << "Informe o tipo de investimento: " << endl
         << "1-Poupança (3% de rendimento mensal)" << endl 
         << "2-Fundos de renda fixa (4% de rendimento mensal)" << endl;
    cin >> tipo;
    
    if (tipo=1){
        valor= valor+(valor*3/100);
    }else{
        valor= valor+(valor*4/100);
    }
    cout <<"Valor do corrigido do investimento: " << valor <<endl;

    return 0;
}

void 16(){

    int codigo;
    float valor;

    cout << "Informe o código do produto: ";
    cin >> codigo;
    cout << "Informe o valor do produto: ";
    cin >> valor;

    if (valor <= 30){
        valor= valor;
    }else if(valor <= 100){
        valor= valor-(valor*10/100);
    }else{
        valor=valor-(valor*15/100);
    }

    cout << "Valor com desconto do produto: " << valor << endl;

return 0;
}

void 17(){
    
    int senha;

    cout << "informe a senha: ";
    cin >> senha;

    if (senha == 4531){
        cout << "Permissão concedida: Senha correta!" << endl;
    }else{
        cout <<"Permissão negada: Senha incorreta!" << endl;
    }
return 0;
}

void 18(){

    int idade;

    cout << "Informe sua idade: ";
    cin >> idade;

    if (idade >= 18){
        cout << "Você é maior de idade!";
    }else{
        cout << "Você é menor de idade!";
    }
return 0;
}

void 19(){

    float altura, peso;
    int sexo;

    cout << "Informe sua altura: ";
    cin >> altura;

    cout << "Informe seu sexo: " << endl
         << "1- Masculino" << endl 
         << "2- Feminino" << endl;
    cin >> sexo;

    if (sexo == 1){
        peso=(72.7*altura)-58;
    }else{
        peso=(72.1*altura)-44.7;
    }
    cout << "Seu peso ideal é: " << peso << "kg" << endl;

    return 0; 
}

void 20(){

    int idade;

    cout << "Informe sua idade: ";
    cin >> idade;

    if (idade <= 7){
        cout << "Sua idade " << idade << endl
             << "Categoria: Infantil";
    }else if(idade <= 10){
        cout << "Sua idade " << idade << endl
             << "Categoria: Juvenil";
    }else if(idade <= 15){
        cout << "Sua idade " << idade << endl
             << "Categoria: Adolescente";  
    }else if(idade <= 30){
        cout << "Sua idade " << idade << endl
             << "Categoria: Adulto";  
    }else{
        cout << "Sua idade" << idade << endl
        << "Categoria: Adulto";     
    }
return 0;
}
void 21(){

float valor;
int codigo;
string procedencia;

cout << "Informe o valor do produto: ";
cin >> valor;
cout << "Ifnorme o código do produto: ";
cin >> codigo;

if (codigo == 1){
    procedencia= "Sul";
}else if(codigo == 2){
    procedencia= "Norte";
}else if(codigo == 3){
    procedencia= "Leste";
}else if(codigo == 4){
    procedencia= "Oeste";
}else if (codigo <= 6 ){
    procedencia= "Nordeste";
}else if(codigo <= 9){
    procedencia= "Sudeste";
}else if(codigo <= 20){
    procedencia= "Centro-Oeste";
}else if(codigo <= 30){
    procedencia= " Nordeste";
}else{
    procedencia= "Não encontrado na base de códigos";
}
cout << "Valor do produto: " << valor << endl
     << "Procedência: " << procedencia << endl;

return 0;
}

void 22(){

int idade;
int grupoDeRisco;
float peso;

cout << "Informe seu peso: ";
cin >> peso;
cout << "Informe sua idade: ";
cin >> idade;

if (idade <= 20){
    if (peso <= 60){
        grupoDeRisco= 9;
    }else if(peso <= 90)
        grupoDeRisco= 8;
    else{
        grupoDeRisco= 7;
    }    
}else if(idade <= 50){
    if (peso <= 60){
        grupoDeRisco= 6;
    }else if(peso <= 90)
        grupoDeRisco= 5;
    else{
        grupoDeRisco= 4;
    }
}
else{
        if (peso <= 60){
        grupoDeRisco= 3;
    }else if(peso <= 90)
        grupoDeRisco= 2;
    else{
        grupoDeRisco= 1;
    }
}
cout << "Seu grupo de risco é: " << grupoDeRisco << endl;

return 0;
}

void 23(){

    int codigo, quantidade, precoUnitario, precoFinal, desconto;

    cout << "Insira o código do produto: ";
    cin >> codigo;
    cout << "Insira a quantidade: ";
    cin >> quantidade;

    if (codigo <= 10){
        precoUnitario= 10;
            cout << "Preço unitário do produto: "<< precoUnitario << endl;
        precoFinal= precoUnitario*quantidade;
            cout << "Preço final sem desconto: " << precoFinal << endl;
        if (precoFinal <= 250){
            desconto= 5;
            precoFinal= precoFinal-(precoFinal*desconto/100);
        }else if (precoFinal <= 500){
            desconto=10;
            precoFinal= precoFinal-(precoFinal*desconto/100);
        }else{
            desconto=15;
            precoFinal= precoFinal-(precoFinal*desconto/100);
        }
    cout <<"Valor final com desconto de " << desconto << "%: " << precoFinal << endl;
    }
return 0;
}

void 24(){

    int preco, categoria, aumento, imposto; 
    char situacao;
    string classificacao;

    cout << "Informe o preço: ";
    cin >> preco;
    cout << "1- Limpeza" << endl
         << "2- Alimentação" << endl
         << "3- Vestuário" << endl
         << "Selecione a categoria: ";
    cin >> categoria;
    if(categoria > 3){
        cout << "Categoria inválida.";
    return 0;
    }
    cout << "R- Produtos que necessitam de refrigeração" << endl
         << "N- Produtos que não necessitam de refrigeração" << endl
         << "Selecione a situação: ";
    cin >> situacao;
     if(situacao != 'R' && situacao != 'N'){
        cout << "Situação inválida." <<  endl;
    return 0;
    }

    if (preco <= 25){
        if (categoria == 1){
            aumento=5;
            preco=preco+(preco*aumento/100);
        }else if(categoria == 2){
            aumento=8;
            preco=preco+(preco*aumento/100);
        }else{
            aumento=10;
            preco=preco+(preco*aumento/100);    
        }
    }else{
        if (categoria == 1){
            aumento=12;
            preco=preco+(preco*aumento/100);
        }else if(categoria == 2){
            aumento=15;
            preco=preco+(preco*aumento/100);
        }else {
            aumento=18;
            preco=preco+(preco*aumento/100);    
        }
    }
    cout <<"\nO aumento foi de " << aumento << "%." << "\nO valor foi ajustado para: R$ " << preco << endl;

        if (situacao == 'R' && categoria == 2){
            imposto= 5;
            preco= preco-(preco*imposto/100);
        }else{
            imposto= 8;
            preco=preco-(preco*imposto/100);
        }
    cout << "Valor final com " << imposto << "% de imposto: R$ " << preco << endl;

    if (preco <= 50){
        classificacao= "Barato";
    }else if(preco <= 120){
        classificacao= "Normal";
    }else {
        classificacao= "Caro";
    }
    cout << "A classificação do produto: " << classificacao << endl;

    return 0;
}

void 25(){

    int horas_extras, horas_falta;
    double premio;

    cout << "Digite o número de horas extras trabalhadas: ";
    cin >> horas_extras;

    cout << "Digite o número de horas que o funcionário faltou: ";
    cin >> horas_falta;

    double H = horas_extras - (2.0 / 3.0 * (horas_falta));

    if (H >= 2400) {
        premio = 500.0;
    } else if (H >= 1800 && H < 2400) {
        premio = 400.0;
    } else if (H >= 1200 && H < 1800) {
        premio = 300.0;
    } else if (H >= 600 && H < 1200) {
        premio = 200.0;
    } else {
        premio = 100.0;
    }

    cout << "O prêmio de Natal é: R$ " << premio << endl;

    return 0;
}