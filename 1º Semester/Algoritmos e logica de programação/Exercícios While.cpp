#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    const double precoInicial = 5.0;
    const double decrementoPreco = 0.5;
    const int ingressosIniciais = 120;
    const double despesas = 200.0;

    cout << "Tabela de Lucros Esperados\n";
    cout << "------------------------------------------------\n";
    cout << setw(10) << left << "Preço" << setw(15) << "Lucro Esperado" << setw(20) << "     Ingressos Vendidos\n";
    cout << "------------------------------------------------\n";

    double preco = precoInicial;
    double lucroMaximo = 0.0;
    double precoLucroMaximo = 0.0;
    int ingressosLucroMaximo = 0;

    while (preco >= 1.0) {
        int ingressos = ingressosIniciais + 26 * (precoInicial - preco) / decrementoPreco;
        double lucro = (preco * ingressos) - despesas;

        cout << fixed << setprecision(2);
        cout << setw(10) << left << "R$" << preco << setw(15) << lucro << setw(20) << ingressos << endl;

        if (lucro > lucroMaximo) {
            lucroMaximo = lucro;
            precoLucroMaximo = preco;
            ingressosLucroMaximo = ingressos;
        }

        preco -= decrementoPreco;
    }

    cout << "\nLucro Máximo Esperado:\n";
    cout << "Preço do Ingresso: R$" << precoLucroMaximo << endl;
    cout << "Quantidade de Ingressos Vendidos: " << ingressosLucroMaximo << endl;

    return 0;
}

void 3(){

#include <iomanip>
#include <vector> 


    int idade;
    vector<int> faixas(5, 0); 
    const int totalPessoas = 8;

    for (int i = 1; i <= totalPessoas; ++i) {
        cout << "Digite a idade da pessoa " << i << ": ";
        cin >> idade;

        if (idade <= 15) {
            faixas[0]++; // Até 15 anos
        } else if (idade <= 30) {
            faixas[1]++; // De 16 a 30 anos
        } else if (idade <= 45) {
            faixas[2]++; // De 31 a 45 anos
        } else if (idade <= 60) {
            faixas[3]++; // De 46 a 60 anos
        } else {
            faixas[4]++; // Acima de 60 anos
        }
    }

    cout << "\nQuantidade de pessoas em cada faixa etária:\n";
    cout << "Até 15 anos: " << faixas[0] << " pessoas\n";
    cout << "De 16 a 30 anos: " << faixas[1] << " pessoas\n";
    cout << "De 31 a 45 anos: " << faixas[2] << " pessoas\n";
    cout << "De 46 a 60 anos: " << faixas[3] << " pessoas\n";
    cout << "Acima de 60 anos: " << faixas[4] << " pessoas\n";

    double porcentagemPrimeiraFaixa = (static_cast<double>(faixas[0]) / totalPessoas) * 100;
    double porcentagemUltimaFaixa = (static_cast<double>(faixas[4]) / totalPessoas) * 100;

    cout << fixed << setprecision(2);
    cout << "\nPorcentagem de pessoas na primeira faixa etária: " << porcentagemPrimeiraFaixa << "%\n";
    cout << "Porcentagem de pessoas na última faixa etária: " << porcentagemUltimaFaixa << "%\n";

    return 0;
}


void 4(){

    int num;

    cout <<"Informe um número: ";
    cin >> num;

    for (int i=0; i <= 10; i++){
            cout << num << "x" << i << "=" << num*i << endl;
    } 
return 0;
}

void 5(){

int main() {

    for (int i = 1; i <= 10; ++i) {
        cout << "Tabuada do " << i << ":" << endl;


        for (int j = 1; j <= 10; ++j) {
            cout << i << " x " << j << " = " << (i * j) << endl;
        }


    cout << endl;
    }

    return 0;
}
}

void 6(){

    vector<int> valor_avista;
    vector<int>  valor_prazo;
    char codigo;
    int valor;
    int total_avista= 0;
    int total_prazo= 0;


for (int i = 0; i < 15; ++i){
    cout << "\nNúmero da transação: " << i+1 << "\n V- Avista \n P- Prazo\nInforme o código: ";
    cin >> codigo;

    cout << "\nNúmero da transação: " << i+1 << "\nInforme o valor da compra: ";
    cin >> valor;

    if (codigo == 'V' || codigo == 'v'){
        valor_avista.push_back(valor);
        total_avista += valor;
    }else if (codigo == 'P' || codigo == 'p'){
        valor_prazo.push_back(valor);
        total_prazo += valor;
    }else {
        cout << "Código inválido, insira V ou P." << endl;
        --i;
    }
    }

    int valor_total= total_avista + total_prazo;
    int primeira_prestacao= total_prazo/3;

    cout << "Valor das compras à vista: " << total_avista << endl;
    cout << "Valor das comprar à prazo: " <<  total_prazo << endl;
    cout << "Valor total das compras: " << valor_total << endl;
    cout << "Valor da primeira prestação das comprar a prazo: " << primeira_prestacao << endl;

    return 0;
}

void 7(){

    int idade;
    float altura, peso;
    int cinquenta, soma_altura, pessoas_altura, pessoas_peso, pessoas_qnt;
    

    for (int i = 0; i < 5; i++){
        cout << "Informe a idade da " << i+1 << "ª"<< " pessoa: ";
        cin >> idade;

        cout << "Informe a altura da " << i+1 << "ª"<< " pessoa: ";
        cin >> altura;

        cout << "Informe o peso em kg da " << i+1 << "ª"<< " pessoa: ";
        cin >> peso;

        if (idade > 50){
            cinquenta++;
        }
        if (idade >= 10 && idade <= 20){
            soma_altura += altura;
            pessoas_altura++;
        }
        if (peso < 40){
            pessoas_peso++;
        }
        pessoas_qnt++;
    }
    float media_altura= soma_altura/pessoas_altura;
    float pessoas_quarenta= (pessoas_qnt*pessoas_peso/100);
    if (pessoas_quarenta < 0){
        pessoas_quarenta= 0;
    } 

    cout << "Quantidade de pessoas com a idade superior a 50 anos: " << cinquenta << endl;
    cout << "Média da altura entre pessoas de 10 à 20 anos: " << media_altura << endl;
    cout << "Porcentagem de pessoas com o peso inferior a 40kg: " << pessoas_quarenta << "%" << endl;
    }

void 8(){

    int idade, cinquenta_setenta=0;
    int cinquenta_setenta= 0;
    int idade_150=0;
    int pessoas_150=0;
    int pessoas_pessoas=0;
    int olhos_azul=0;
    int cabelo_ruivo= 0; 
    float peso, altura;
    char olhos, cabelo; 

    for (int i = 0; i < 6; ++i){
        cout << "Informe a idade da " << i+1 << "ª"<< " pessoa: ";
        cin >> idade;

        cout << "Informe a altura da " << i+1 << "ª"<< " pessoa: ";
        cin >> altura;

        cout << "Informe o peso em kg da " << i+1 << "ª"<< " pessoa: ";
        cin >> peso;

        cout << "Cor dos olhos: \nA- Azul \nP- Preto \nV- Verde \nC- Castanho\n" << "Informe a cor dos olhos da " << i+1 << "ª"<< " pessoa: ";
        cin >> olhos;

        cout << "Cor dos cabelos: \nP- Preto \nC- Castanho \nL- Louro \nR-Ruivo " << "Informe a cor do cabelo da " << i+1 << "ª"<< " pessoa: ";
        cin >> cabelo;


        if (idade > 50 && peso < 60){
            cinquenta_setenta++;
        }
        if (altura < 1.50){
            idade_150 += idade;
            pessoas_150++;
        }
        if (olhos == 'A' && olhos == 'A'){
            olhos_azul++;
        }
        if ((cabelo == 'R' || cabelo  == 'r') && (olhos != 'A' || olhos != 'a')){
            cabelo_ruivo++; // wtf?
        }
    total_pessoas++; // pessoas*azul/100
    }

    double media_altura= idade_150/pessoas_150;
    double media_azul= (total_pessoas*olhos_azul/100);
    if (media_azul < 0){
        media_azul= 0;
    }

    cout << "Quantidade de pessoas com idade superior a 50 anos e peso inferior a 60kg: " << cinquenta_setenta << endl;
    cout << "Média das idades das pessoas com altura inferior a 1.50m: " << media_altura << endl;
    cout << "Média pessoas com olhos azuis: " << media_azul << "%." << endl;
    cout << "Quantidade de pessoas ruivas que não possuem olhos azuis: " << cabelo_ruivo << endl;
}

void 9(){

int idade[10];
float peso[10];
float altura[10];

    for (int i=0; i<10; ++i){
        cout << "Informe a idade da " << i+1 << "ª"<< " pessoa: ";
        cin >> idade[i];

        cout << "Informe o peso em kg da " << i+1 << "ª"<< " pessoa: ";
        cin >> peso[i];

        cout << "Informe a altura da " << i+1 << "ª"<< " pessoa: ";
        cin >> altura[i];
    }

    int soma_idades=0;
    for(int i=0; i<10; ++i){
        soma_idades += idade[i];
    }
    float media_idade= soma_idades/10;

    int pessoas_peso_altura=0;
    for(int i=0; i<10; ++i){
        if (peso[i] > 90 && altura[i] < 1.50){
            pessoas_peso_altura++;
        }
    }

    int pessoas_idade_altura=0;
    for(int i=0; i<10; ++i){
        if (idade[i] > 10 && idade[i] < 30 && altura[i] > 1.90){
            pessoas_idade_altura++;
        }
    }
    float porcentagem_idade_altura= ((pessoas_idade_altura/10))*100;




    cout << "Média das idades das dez pessoas: " << media_idade << endl;
    cout << "Quantidade de pessoas com peso superior a 90kg e altura inferior a 1.50m: " << pessoas_peso_altura << endl;
    cout << "Porcentagem de pessoas com idade entre 10 à 30 anos e altura maior que 1.90m: " << porcentagem_idade_altura << "%" << endl;

}

void 10(){

    bool isPrime(int n){
        if (n <= 1){
            return false;

        for (int i = 2; i*i <= n; i++){
            if (n % i == 0){
                return false;
            }
        }
        }
        return true;
    }

    int numeros[10];
    int soma_pares = 0;
    int soma_impares = 0;

    for (int i=0; i<10; ++i){
        cout << "Informe o " << i+1 << "º número inteiro: " << endl;
        cin >> numeros[i];
    }

    for (int i = o; i < 10; ++i){
        if(numeros[i] % 2 == 0){
            soma_impares += numeros[i];
        }
        if (isPrime(numeros[i])){
            soma_pares += numeros[i];
        }
    }

    cout << "Soma dos números impares: " << soma_impares << endl;
    cout << "Soma dos números pares: " << soma_pares << endl;

return 0;
}

void 11(){

    #include <vector>
    #include <iomanip>

    struct Parcela {
    double preco_final;
    string quantidade_parcelas;
    double valor_parcela;
};

vector<Parcela> calcular_parcelas(double preco_carro) {
    // Calcula o preço final com desconto à vista
    double preco_final_vista = preco_carro * 0.8;

    // Define a lista de quantidades de parcelas
    vector<int> parcelas = {6, 12, 18, 24, 30, 36, 42, 48, 54, 60};

    // Cria um vetor de Parcela para armazenar os resultados
    vector<Parcela> tabela;

    // Para cada quantidade de parcelas, calcula o preço e o valor da parcela
    for (int qtd_parcelas : parcelas) {
        double percentual_acrescimo = qtd_parcelas * 0.03;
        double preco_com_acrescimo = preco_carro * (1 + percentual_acrescimo);
        double valor_parcela = preco_com_acrescimo / qtd_parcelas;
        tabela.push_back({preco_com_acrescimo, to_string(qtd_parcelas), valor_parcela});
    }

    // Adiciona a opção de compra à vista na tabela
    tabela.insert(tabela.begin(), {preco_final_vista, "À vista", 0.0});

    return tabela;
}

void exibir_tabela(const vector<Parcela>& tabela) {
    // Exibe os resultados formatados em uma tabela
    cout << setw(15) << left << "Preço Final" << setw(23) << left << "Quantidade de Parcelas" << setw(20) << left << "Valor da Parcela" << endl;
    for (const Parcela& linha : tabela) {
        cout << setw(15) << left << fixed << setprecision(2) << linha.preco_final << setw(23) << left << linha.quantidade_parcelas;
        if (linha.quantidade_parcelas != "À vista") {
            cout << setw(20) << left << fixed << setprecision(2) << linha.valor_parcela;
        }
        cout << endl;
    }
}

int main() {
    double preco_carro;
    cout << "Digite o preço do carro: R$ ";
    cin >> preco_carro;

    vector<Parcela> tabela_resultados = calcular_parcelas(preco_carro);
    exibir_tabela(tabela_resultados);

    return 0;
}

}

void 12 (){

    bool numero_primo(int num){
        if (num <= 1){
            return false;
        }
        for (int i = 2; i * i; i++){
            if (num % i == 0){
                return false;
            }
        }
    return true;
    }


    int main(){
    int numeros[10];
    int qtd_primos;

    for (int i = 0; i < 10; ++i);
        cout << "Informe o " << i+1 << "º número inteiro" << endl;
        cin >> numeros[i];

    for(int i = 0; i < 10; ++i){
        if (numeros % 2 == 0){
            if (numero_primo(numeros[i])){
                qtd_primos++;
            }
        }  
    }
    cout >> "Quantidade de números primos é: " << qtd_primos << endl;
    }
}

void 13(){

    int idade[15];
    float peso[15];
    int pessoas_10, pessoas_20, pessoas_30, pessoas_31, qnt_10, qnt_20, qnt_30, qnt_31;

    for (int i = 0; i < 15; ++i){
        cout << "Informe a idade da " << i+1 << "ª pessoa: "
        cin >> idade[i];
        cout << "Informe o peso da " << i+1 << "ª pessoa: " << endl;
        cin >> peso[i];
    }

    for (int i = 0; i < 15; ++i){
        if (idade[i] <= 10){
           pessoas_10 += peso[i]; 
           qnt_10++;
        }
        if else (idade[i] <= 20){
            pessoas_20 += peso[i];
            qnt_20++;
        }
        if else (idade[i] <= 30){
            pessoas_30 += peso[i];
            qnt_30++;
        }
        else{
            pessoas_31 += peso[i];
            qnt_31++
        }
    }
    float media_10= pessoas_10/qnt_10;
    float media_20= pessoas_20/qnt_20;
    float media_30= pessoas_30/qnt_30;
    float media_31= pessoas_31/qnt_31;    

    cout << "Média de peso das pessoas entre 1 à 10 anos: " << media_10 << endl;
    cout << "Média de peso das pessoas entre 11 à 20 anos: " << media_20 << endl;   
    cout << "Média de peso das pessoas entre 21 à 30 anos: " << media_30 << endl;
    cout << "Média de peso das pessoas entre 31 anos para cima: " << media_31 << endl;

return 0;
}

void 14(){

    int idade[15];
    float nota[15];
    int soma_idades, qnt_otimo, qnt_regular, qnt_bom;

    for (int i = 0; i < 15; ++i){
        cout << "Informe a idade da " << i+1 << "ª pessoa: "
        cin >> idade[i];
        cout << "Informe sua nota: " << endl
             << "1- Regular" << endl
             << "2- Bom" << endl
             << "3- Ótimo" << endl;
        cin >> nota[i];

        if (nota == 3){
            soma_idades += idade;
            qnt_otimo++;
        }
        else if (nota == 1){
            qnt_regular++;
        }
        else{ //qnt_bom*100/15
            qnt_bom++;
        }
    }
    float idade_otimo = soma_idades / qnt_otimo;
    float porcentagem_bom = (qnt_bom * 100) / 15;

    cout << "Média das idades entre a reposta ótimo: " << idade_otimo << endl;
    cout << "Quantidade de pessoa que responderam regular: " << qnt_regular << endl;
    cout << "Porcentagem de pessoas que responderam bom: " << porcentagem_bom << endl;
}

void 15(){
    
}

