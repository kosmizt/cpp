#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    if (n < 10 || n > 99) {
        cerr << "Error\n";
        return 1;
    }

    cout << n / 10 << " " << n % 10 << '\n';
    return 0;
}
