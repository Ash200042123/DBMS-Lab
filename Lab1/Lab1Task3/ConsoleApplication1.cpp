
#include <iostream>
#include<vector>
#include<map>
#include<fstream>
#include<sstream>

using namespace std;

int main()
{
	ifstream file1("grades.txt");
	ifstream file2("studentInfo.txt");
	while (1) {
		cout << "Enter the Student ID to search for: " << endl;

		int ID, f = 0;
		double sum = 0, occ = 0, avg;
		string name;
		cin >> ID;

		if (file2.is_open()) {

			string line;
			while (getline(file2, line)) {

				stringstream ss(line);

				int ID2;
				string ID1, name1, age, blood_group, dept; 
				double grade;
				double* mem = &grade;

				getline(ss, ID1, ';');
				ID2 = stoi(ID1);

				getline(ss, name1, ';');
				getline(ss, age, ';');
				getline(ss, blood_group, ';');
				getline(ss, dept, ';');

				if (ID == ID2) {
					name = name1;
					f = 1;
					break;
				}
			}
			
			while (getline(file1, line)) {
				istringstream ss(line);

				double grade;
				string ID3, grade1, semester;
				int ID4;

				getline(ss, ID3, ';');
				ID4 = stoi(ID3);

				getline(ss, grade1, ';');
				grade = stof(grade1);

				getline(ss, semester, ';');
				if (ID4 == ID) {
					sum += grade;
					occ++;
				}
			}
			avg = sum / occ;
		}
		if (f == 1) {
			cout << "Name: " << name << endl << "CGPA: " << avg << endl;
		}
		else {
			cout << "Student doesn't exist" << endl;
		}
	}
	return 0;
}

