
#include <iostream>
#include<vector>
#include<map>
#include<fstream>
#include<sstream>
using namespace std;

int main()
{
	ifstream file2("grades.txt");

	while (1) {

		ofstream file1;
		file1.open("grades.txt", ios_base::app);

		cout << "Enter the details" << endl;

		int ID, f=0;
		string semester;
		double GPA;

		cin >> ID >> GPA >> semester;

		if (file2.is_open()) {

			string line;
			while (getline(file2, line)) {
				stringstream ss(line);

				int ID2;
				string ID1, grade1, semester1;
				double grade;

				getline(ss, ID1, ';');
				ID2 = stoi(ID1);

				getline(ss, grade1, ';');
				getline(ss, semester1, ';');

				if (ID==ID2 && semester==semester1) {
					f = 1;
					break;
				}
			}
			if (f == 1) {
				cout << "Info can't be added" << endl;
			}
			else {
				file1 << ID << ";" << GPA << ";" << semester<<"\n";
			}
		}	
	}
	return 0;
}

