#include <bits/stdc++.h>

using namespace std;

int main()
{
	string program;
	int memorysize = 65536;
	vector<int> arr(memorysize, 0);
	int pointer = 0;
	int bra = 0;
	int i = 0;
	cin >> program;
	while (i < program.length())
	{
		if (program[i] == '+')
		{
			if (0 <= pointer && pointer < memorysize)
			{
				arr[pointer]++;
			}
			else
			{
				cout << "Out Of Array Bounds At:" + i << endl;
				return 0;
			}
			i++;
		}
		else if (program[i] == '-')
		{
			if (0 <= pointer && pointer < memorysize)
			{
				arr[pointer]--;
			}
			else
			{
				cout << "Out Of Array Bounds At:" + i << endl;
				return 0;
			}
			i++;
		}
		else if (program[i] == '<')
		{
			pointer--;
			i++;
		}
		else if (program[i] == '>')
		{
			pointer++;
			i++;
		}
		else if (program[i] == '[')
		{
			if (arr[pointer] == 0)
			{
				bra = 1;
				while (bra > 0)
				{
					i++;
					if (i < program.length() && program[i] == '[')
					{
						bra++;
					}
					else if (i < program.length() && program[i] == ']')
					{
						bra--;
					}
					else if (i >= program.length())
					{
						cout << "EOF Reached" << endl;
						return 0;
					}
					else
					{
					}
				}
			}
			else
			{
				i++;
			}
		}
		else if (program[i] == ']')
		{
			if (arr[pointer] != 0)
			{
				bra = 1;
				while (bra > 0)
				{
					i--;
					if (i >= 0 && program[i] == '[')
					{
						bra--;
					}
					else if (i >= 0 && program[i] == ']')
					{
						bra++;
					}
					else if (i < 0)
					{
						cout << "Out of Program" << endl;
						return 0;
					}
					else
					{
					}
				}
			}
			else
			{
				i++;
			}
		}
		else if (program[i] == '.')
		{
			cout << ((char)arr[pointer]);
			i++;
		}
		else if (program[i] == ',')
		{
			int inp;
			cin >> inp;
			arr[pointer] = inp;
			i++;
		}
		else
		{
			i++;
		}
	}
	return 0;
}
