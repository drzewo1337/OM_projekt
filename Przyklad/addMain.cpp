#include <iostream>
#include <string>

using namespace std;

extern "C" int fun(int x, int y);
extern "C" int fun2(int* array, int count);
extern "C" int fun3(int* array, int count);

int silnia(int n)
{
    __asm
    {
        mov eax, 1
        lea esi, n
        mov ecx, [esi]
        petla :
        mul ecx
            loop petla
            mov[esi], eax
    }
    return n;
}

int symbol_newtona(int n, int k)
{
    int roznica = n - k;
    n = silnia(n);
    k = silnia(k);

    __asm
    {
        lea esi, n
        mov eax, [esi]
        lea esi, k
        mov ebx, [esi]
        div ebx
        lea esi, roznica
        mov ebx, [esi]
        div ebx
        lea esi, n
        mov [esi], eax
    }

    return n;
}

int potegowanie(int a, int b)
{
    int wynik = 0;
    __asm
    {
        lea esi, a
        mov ebx, [esi]
        mov eax, 1
        lea esi, b
        mov ecx, [esi]
        petla:

        mul ebx
            loop petla

            lea esi, wynik
            mov[esi], eax
    }

    return wynik;
}



int main()
{
    int wybor;
    int n;
    int k;
    string tekst;
    string klucz;
    int* tablica = nullptr; 

    for (int i = 0; i < 6; i++)
    {
        cout << "\n";
        cout << "Wybierz podprogram napisany w MASM:\n";
        cout << "Funkcje zewnêtrzne\n";
        cout << "1. NWD\n";
        cout << "2. Suma elementow tablicy\n";
        cout << "3. Œrednia arytmetyczna elementow tablicy\n";

        cout << "Funkcje wstawione do programu C++\n";
        cout << "4. Silnia\n";
        cout << "5. Dwumian Newtona\n";
        cout << "6. Potêgowanie\n";

        cin >> wybor;

        switch (wybor)
        {
        case 1:
            cout << "Podaj pierwsza liczbe: ";
            cin >> n;
            cout << "Podaj druga liczbe: ";
            cin >> k;
            cout << "NWD tych liczb to:" << fun(n, k);
            break;

        case 2:
            cout << "Podaj rozmiar tablicy: ";
            cin >> n;
            delete[] tablica;

            tablica = new int[n];

            cout << "Wprowadz " << n << " liczb do tablicy:" << endl;
            for (int i = 0; i < n; ++i) {
                cout << "Element " << i << ": ";
                cin >> tablica[i];
            }

            cout << "Suma elementow tablicy wynosi:" << fun2(tablica, n);
            break;

        case 3:
            cout << "Podaj rozmiar tablicy: ";
            cin >> n;
            delete[] tablica;

            tablica = new int[n];

            cout << "Wprowadz " << n << " liczb do tablicy:" << endl;
            for (int i = 0; i < n; ++i) {
                cout << "Element " << i << ": ";
                cin >> tablica[i];
            }

            cout << "Srednia arytmetyczna wartosci w tablicy wynosi: " << fun3(tablica, n);
            break;

        case 4: //silnia
            cout << "Podaj liczbe: ";
            cin >> n;
            cout << silnia(n);
            break;

        case 5: //dwumian newtona

            cout << "Dwumian Newtona\n";
            cout << "/ n \\";
            cout << "\n";
            cout << "\\ k /";

            cout << "\n";
            cout << "Podaj n: ";
            cin >> n;
            cout << "Podaj k: ";
            cin >> k;

            cout << symbol_newtona(n, k);


            break;
        case 6: //potegowanie
            cout << "Podaj podstawê a:";
            cin >> n;
            cout << "Podaj wyk³adnik b:";
            cin >> k;
            cout << "a^b = " << potegowanie(n, k);
            break;
        }

    }
}
