#include <iostream>
#include <thread>
#include <fstream>

using namespace std;

int main()
{
    cout << "Hello World!" << endl;
    ofstream fs("test.txt");
    fs << "hello file!";
    fs.close();
    //std::thread t([](){});
    //t.join();
    return 0;
}
