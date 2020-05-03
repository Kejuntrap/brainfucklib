import std.stdio;
import std.conv;
import std.algorithm;
import std.array;

void main()
{
  immutable int memorysize = 65536;
  int pointer = 0;
  int i = 0;
  int bra = 0;
  string program = readln();
  int[] arr = new int[memorysize];
  int len = 0;
  while (program[len] != '\n')
  {
    len++;
  }
  fill(arr, 0);
  while (i < len)
  {
    if (program[i] == '+')
    {
      if (0 <= pointer && pointer < memorysize)
      {
        arr[pointer]++;
      }
      else
      {
        writeln("Out Of Array Bounds At:" ~ i.to!string);
        return;
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
        writeln("Out Of Array Bounds At:" ~ i.to!string);
        return;
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
    else if (program[i] == ',')
    {
      immutable int inp = readln().to!int;
      arr[pointer] = inp;
      i++;
    }
    else if (program[i] == '.')
    {
      write(arr[pointer].to!char);
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
          if (i < len && program[i] == '[')
          {
            bra++;
          }
          else if (i < len && program[i] == ']')
          {
            bra--;
          }
          else if (i >= len)
          {
            writeln("EOF Reached.");
            return;
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
            writeln("Out of Program");
            return;
          }
        }
      }
      else
      {
        i++;
      }
    }
    else
    {
      i++;
    }
  }
}
