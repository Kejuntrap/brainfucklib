from strutils import Digits, parseInt

var program = readline(stdin)
var memorysize = 65536
var bra = 0
var i = 0
var pointer = 0
var arr: seq[int]
newSeq(arr, memorysize)

while i < len(program):
    if program[i] == '+':
        if 0 <= pointer and pointer < memorysize:
            arr[pointer] += 1
        else:
            echo "Out of Array Bounds At:" , i
            quit(1)
        i += 1
    elif program[i] == '-':
        if 0 <= pointer and pointer < memorysize:
            arr[pointer] -= 1
        else:
            echo "Out of Array Bounds At:" , i
            quit(1)
        i += 1
    elif program[i] == '<':
        pointer -= 1
        i += 1
    elif program[i] == '>':
        pointer += 1
        i += 1
    elif program[i] == ',':
        var inp =parseInt(readline(stdin))
        arr[pointer] = inp
        i += 1
    elif program[i] == '.':
        stdout.write chr(arr[pointer])
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
                    echo "EOF Reached"
                    quit(1)
        else:
            i += 1
    elif program[i] == ']':
        if arr[pointer] != 0:
            bra = 1
            while bra > 0:
                i -= 1
                if i >= 0 and program[i] == ']':
                    bra += 1
                elif i >= 0 and program[i] == '[':
                    bra -= 1
                elif i < 0:
                    echo "Out of Program"
                    quit(1)
        else:
            i += 1
    else:
        i += 1