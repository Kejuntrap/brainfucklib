program = readline()
memorysize = 65536
arr = [ 0 for _ in 1:memorysize] # julia is 1-indexed.
pointer  = 1
bra = 0
i = 1

while i <= length(program)
    if program[i] == '+'
        if 0 <= pointer < memorysize
            global arr[pointer] += 1
        else
            print("Out Of Array Bounds At: ", i)
            return
        end
        global i += 1
    elseif program[i] == '-'
        if 0 <= pointer < memorysize
            global arr[pointer] -= 1
        else
            print("Out Of Array Bounds At: ", i)
            return
        end
        global i += 1
    elseif program[i] == '<'
        global pointer -= 1
        global i += 1
    elseif program[i] == '>'
        global pointer += 1
        global i += 1
    elseif program[i] == '.'
        print(Char(arr[pointer]))
        global i += 1
    elseif program[i] == ','
        inp = parse(Int, readline())
        arr[pointer] = inp
        global i += 1
    elseif program[i] == '['
        if arr[pointer] == 0
            global bra = 1
            while bra > 0
                global i += 1
                if i <= length(program) && program[i] == '['
                    global bra += 1
                elseif i <= length(program) && program[i] == ']'
                    global bra -= 1
                elseif i >= length(program)
                    println("EOF Reached.")
                    return
                end
            end
        else
            global i += 1
        end
    elseif program[i] == ']'
        if arr[pointer] != 0
            global bra = 1
            while bra > 0
                global i -= 1
                if i >= 0 && program[i] == '['
                    global bra -= 1
                elseif i >= 0 && program[i] == ']'
                    global bra += 1
                elseif i < 0
                    println("Out Of Program.")
                    return
                end
            end
        else
            global i += 1
        end
    else
        global i += 1
    end
end