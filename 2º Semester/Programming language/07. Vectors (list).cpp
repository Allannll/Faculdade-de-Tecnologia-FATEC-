#include <iostream>
#include <vector>

using namespace std;

void PrintList(const vector<int>& list){

    if(list.empty()){
        cout  << "The list is empty.";
    }else{
        cout << "List: ";
        for(int num  : list){
            cout << num << " ";
        }
    cout << endl;
    }
}

void InsertValue (vector<int>& list){

    int num, position;

    cout << "Enter the number you want insert:  " << endl;
    cin  >> num;
    cout << "Enter the position (0 to " << list.size() << " where you want to insert the number." << endl;
    cin >> position;

    if (position >= 0 && position <= list.size()){
        list.insert(list.begin() + position, num);
        cout <<  "Number added successfully.";
    }else{
       cout << "Invalid position.";
    }
}

void RemoveValue (vector<int>& list){

    if (list.empty()){
        cout << "The list is empty.";
        return;
    }

    int position;
       cout << "Enter the position (0 to " << list.size() - 1 << " where you want to remove." << endl;
       cin >> position;

    if (position >= 0 && position < list.size()){
        list.erase(list.begin() + position);
        cout <<  "Number remove successfully.";
    }else{
      cout  <<  "Invalid position.";
    }
}

int main(){

    vector<int>  list;
    int option;

    do{
        cout << "\nMenu:\n";
        cout << "1. Insert number\n";
        cout << "2. Remove number\n";
        cout << "3. Print list\n";
        cout << "0. Leave\n";
        cout << "Choose an option: ";
        cin >> option;

        switch(option){
            case 1:
                InsertValue(list);
            break;
            case 2:
                RemoveValue(list);
            break;
            case 3:
                PrintList(list);
            break;
            case 0:
            cout << "Leaving...\n";
            break;
            default:
            cout << "Invalid option.";
        }
    } while (option != 0);

    return 0;
}