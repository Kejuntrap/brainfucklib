tmp = io.read("*l")
program = {}
for i=1, string.len(tmp)  do    --Lua is 1-indexed.
    program[i] = string.char(tmp:byte(i))
end
memorysize = 65536; --64KB
pointer = 1;
i = 1;
bra = 0;
arr = {};
for tmp = 0, memorysize-1  do
    table.insert(arr, 0)
end
while i <= #program do
    if program[i] == '+' then
        if 0 <= pointer and pointer < memorysize then
            arr[pointer] = arr[pointer] + 1;
        else
            print("Out Of Array Bounds At: " + i);
            return;
        end
        i = i + 1;
    elseif program[i] == '-' then
        if 0 <= pointer and pointer < memorysize then
            arr[pointer] = arr[pointer] - 1;
        else
            print("Out Of Array Bounds At: " + i);
            return;
        end
        i = i + 1;
    elseif program[i] == '<' then
        pointer = pointer - 1
        i = i + 1;
    elseif program[i] == '>' then
        pointer = pointer + 1
        i = i + 1;
    elseif program[i] == '.' then
        --print(arr[pointer])
        io.write(string.char(arr[pointer]))
        i = i + 1;
    elseif program[i] == ',' then
        inp = io.read("*n")
        arr[pointer] = inp
        i = i + 1
    elseif program[i] == '[' then
        if arr[pointer] == 0 then
            bra = 1;
            while bra > 0 do
                i = i + 1;
                if i <= #program and program[i] == '[' then
                    bra = bra + 1;
                elseif i < #program and program[i] == ']' then
                    bra = bra - 1;
                elseif i >= #program then
                    print("EOF Reached");
                end
            end
        else
            i = i + 1;
        end
    elseif program[i] == ']' then
        if arr[pointer] ~= 0 then
            bra = 1;
            while bra > 0 do
                i = i - 1;
                if i >= 0 and program[i] == '[' then
                    bra = bra - 1;
                elseif i >= 0 and program[i] == ']' then
                    bra = bra + 1;
                elseif i < 0 then
                    print("Out Of Program.");
                    return
                end
            end
        else
            i = i + 1;
        end
    else
        i = i + 1;
    end
end