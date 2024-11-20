#include <iostream>
#include <iomanip>
#include <vector>

using namespace std;

void expectedProfit() {
    const double initialPrice = 5.0;
    const double priceDecrement = 0.5;
    const int initialTickets = 120;
    const double expenses = 200.0;

    cout << "Expected Profit Table\n";
    cout << "------------------------------------------------\n";
    cout << setw(10) << left << "Price" << setw(15) << "Expected Profit" << setw(20) << "Tickets Sold\n";
    cout << "------------------------------------------------\n";

    double price = initialPrice;
    double maxProfit = 0.0;
    double maxProfitPrice = 0.0;
    int maxProfitTickets = 0;

    while (price >= 1.0) {
        int tickets = initialTickets + 26 * (initialPrice - price) / priceDecrement;
        double profit = (price * tickets) - expenses;

        cout << fixed << setprecision(2);
        cout << setw(10) << left << "R$" << price << setw(15) << profit << setw(20) << tickets << endl;

        if (profit > maxProfit) {
            maxProfit = profit;
            maxProfitPrice = price;
            maxProfitTickets = tickets;
        }

        price -= priceDecrement;
    }

    cout << "\nMaximum Expected Profit:\n";
    cout << "Ticket Price: R$" << maxProfitPrice << endl;
    cout << "Tickets Sold: " << maxProfitTickets << endl;
}

void ageRanges() {
    int age;
    vector<int> ageRanges(5, 0);
    const int totalPeople = 8;

    for (int i = 1; i <= totalPeople; ++i) {
        cout << "Enter age of person " << i << ": ";
        cin >> age;

        if (age <= 15) {
            ageRanges[0]++;
        } else if (age <= 30) {
            ageRanges[1]++;
        } else if (age <= 45) {
            ageRanges[2]++;
        } else if (age <= 60) {
            ageRanges[3]++;
        } else {
            ageRanges[4]++;
        }
    }

    cout << "\nPeople in each age range:\n";
    cout << "Up to 15 years: " << ageRanges[0] << " people\n";
    cout << "16 to 30 years: " << ageRanges[1] << " people\n";
    cout << "31 to 45 years: " << ageRanges[2] << " people\n";
    cout << "46 to 60 years: " << ageRanges[3] << " people\n";
    cout << "Above 60 years: " << ageRanges[4] << " people\n";

    double percentageFirstRange = (static_cast<double>(ageRanges[0]) / totalPeople) * 100;
    double percentageLastRange = (static_cast<double>(ageRanges[4]) / totalPeople) * 100;

    cout << fixed << setprecision(2);
    cout << "\nPercentage in the first age range: " << percentageFirstRange << "%\n";
    cout << "Percentage in the last age range: " << percentageLastRange << "%\n";
}


void multiplicationTable() {
    int num;
    cout << "Enter a number: ";
    cin >> num;

    for (int i = 0; i <= 10; i++) {
        cout << num << " x " << i << " = " << num * i << endl;
    }
}


void fullMultiplicationTable() {
    for (int i = 1; i <= 10; ++i) {
        cout << "Multiplication table of " << i << ":\n";
        for (int j = 1; j <= 10; ++j) {
            cout << i << " x " << j << " = " << (i * j) << endl;
        }
        cout << endl;
    }
}

void transactionClassification() {
    vector<int> cashValues;
    vector<int> creditValues;
    char code;
    int value;
    int totalCash = 0;
    int totalCredit = 0;

    for (int i = 0; i < 15; ++i) {
        cout << "\nTransaction number: " << i + 1 << "\nV- Cash\nP- Credit\nEnter code: ";
        cin >> code;

        cout << "Transaction number: " << i + 1 << "\nEnter the purchase amount: ";
        cin >> value;

        if (code == 'V' || code == 'v') {
            cashValues.push_back(value);
            totalCash += value;
        } else if (code == 'P' || code == 'p') {
            creditValues.push_back(value);
            totalCredit += value;
        } else {
            cout << "Invalid code, enter V or P." << endl;
            --i;
        }
    }

    int totalAmount = totalCash + totalCredit;
    int firstInstallment = totalCredit / 3;

    cout << "Cash purchases: " << totalCash << endl;
    cout << "Credit purchases: " << totalCredit << endl;
    cout << "Total amount: " << totalAmount << endl;
    cout << "First installment of credit purchases: " << firstInstallment << endl;
}

void statistics() {
    int age;
    float height, weight;
    int above50 = 0, totalHeight = 0, totalHeightPeople = 0, under40Weight = 0, totalPeople = 5;

    for (int i = 0; i < 5; i++) {
        cout << "Enter age of person " << i + 1 << ": ";
        cin >> age;
        cout << "Enter height of person " << i + 1 << ": ";
        cin >> height;
        cout << "Enter weight of person " << i + 1 << ": ";
        cin >> weight;

        if (age > 50) above50++;
        if (age >= 10 && age <= 20) {
            totalHeight += height;
            totalHeightPeople++;
        }
        if (weight < 40) under40Weight++;
    }

    float averageHeight = totalHeight / totalHeightPeople;
    float under40Percentage = (static_cast<float>(under40Weight) / totalPeople) * 100;

    cout << "People above 50 years: " << above50 << endl;
    cout << "Average height of people aged 10-20: " << averageHeight << endl;
    cout << "Percentage of people with weight under 40kg: " << under40Percentage << "%" << endl;
}

int main() {
    int choice;

    do {
        cout << "\nSelect an exercise:\n";
        cout << "1- Expected Profit Calculation\n";
        cout << "2- Age Range Calculation\n";
        cout << "3- Multiplication Table\n";
        cout << "4- Full Multiplication Tables\n";
        cout << "5- Transaction Classification\n";
        cout << "6- Various Statistics\n";
        cout << "0- Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1:
                expectedProfit();
                break;
            case 2:
                ageRanges();
                break;
            case 3:
                multiplicationTable();
                break;
            case 4:
                fullMultiplicationTable();
                break;
            case 5:
                transactionClassification();
                break;
            case 6:
                statistics();
                break;
            case 0:
                cout << "Exiting program.\n";
                break;
            default:
                cout << "Invalid choice. Please try again.\n";
        }
    } while (choice != 0);

    return 0;
}
