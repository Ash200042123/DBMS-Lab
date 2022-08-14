
#include <iostream>
#include<fstream>
#include<sstream>
#include<string>
using namespace std;

int main()
{
	ifstream file1("grades.txt");

	double highestGrade = 0;
	int studentID;

	if (file1.is_open()) {

		string line;
		while (getline(file1, line)) {

			stringstream ss(line);

			int ID;
			string ID1,grade1,semester;
			double grade;

			getline(ss, ID1,';');
			ID = stoi(ID1);

			getline(ss, grade1,';');
			grade = stof(grade1);

			getline(ss, semester, ';');

			if (grade > highestGrade) {
				highestGrade = grade;
				studentID = ID;
			}
		}
		cout << "Highest grade is: " << highestGrade<<" of ID: "<< studentID<< endl;
	}
}

