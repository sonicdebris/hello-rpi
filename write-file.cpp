#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    cout << "Hello World!" << endl;
    ofstream fs("test.txt");
    fs << "hello file!";
    fs.close();
    return 0;
}
