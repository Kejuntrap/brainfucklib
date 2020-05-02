program = gets
program = program.chomp
memorysize = 65536
arr = Array.new(memorysize, 0)
pointer = 0
bra = 0
i = 0
while i < program.length do
  if program[i] == '+' then
    if 0 <= pointer and pointer < memorysize then
      arr[pointer] += 1
    else
      puts "Out of Array Bounds At:" + i.to_s
    end
    i += 1
  elsif program[i] == '-' then
    if 0 <= pointer and pointer < memorysize then
      arr[pointer] -= 1
    else
      puts "Out of Array Bounds At:" + i.to_s
    end
    i += 1
  elsif program[i] == '<' then
    pointer -= 1
    i += 1
  elsif program[i] == '>' then
    pointer += 1
    i += 1
  elsif program[i] == ',' then
    inp = gets.to_i
    arr[pointer] = inp
    i += 1
  elsif program[i] == '.' then
    print arr[pointer].chr
    i += 1
  elsif program[i] == '[' then
    if arr[pointer] == 0 then
      bra = 1
      while bra > 0
        i += 1
        if i < program.length and program[i] == '[' then
          bra += 1
        elsif i < program.length and program[i] == ']' then
          bra -= 1
        elsif i >= program.length then
          puts "EOF Reached"
          return
        end
      end
    else
      i += 1
    end
  elsif program[i] == ']' then
    if arr[pointer] != 0 then
      bra = 1
      while bra > 0
        i -= 1
        if i >= 0 and program[i] == '[' then
          bra -= 1
        elsif i >= 0 and program[i] == ']' then
          bra += 1
        elsif i < 0 then
          puts "Out Of Program."
          return
        end
      end
    else
      i += 1
    end
  else
    i += 1
  end
end