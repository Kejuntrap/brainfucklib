def main():
    program = input()
    memorysize = 65536
    arr = [0] * memorysize
    pointer = 0
    bra = 0
    i = 0
    while i < len(program):
        if program[i] == '+':
            if 0 <= pointer < memorysize:
                arr[pointer] += 1
            else:
                print("Out Of Array Bounds At: ", i)
                return
            i += 1
        elif program[i] == '-':
            if 0 <= pointer < memorysize:
                arr[pointer] -= 1
            else:
                print("Out Of Array Bounds At: ", i)
                return
            i += 1
        elif program[i] == '<':
            pointer -= 1
            i += 1
        elif program[i] == '>':
            pointer += 1
            i += 1
        elif program[i] == '.':
            print(chr(arr[pointer]), end='')
            i += 1
        elif program[i] == ',':
            inp = int(input())
            arr[pointer] = inp
            i += 1
        elif program[i] == '[':
            if arr[pointer] == 0:
                bra = 1
                while bra > 0:
                    i += 1
                    if i < len(program) and program[i] == '[':
                        bra += 1
                    elif i < len(program) and program[i] == ']':
                        bra -= 1
                    elif i >= len(program):
                        print("EOF Reached.")
                        return
            else:
                i += 1
        elif program[i] == ']':
            if arr[pointer] != 0:
                bra = 1
                while bra > 0:
                    i -= 1
                    if i >= 0 and program[i] == '[':
                        bra -= 1
                    elif i >= 0 and program[i] == ']':
                        bra += 1
                    elif i < 0:
                        print("Out Of Program")
                        return
            else:
                i += 1


if __name__ == "__main__":
    main()
