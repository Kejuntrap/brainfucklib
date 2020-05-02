program = readline()
arr = [ 0 for i in 1:65536] # julia is 1-indexed.
pointer  = 1
bra = 0
i = 1

while i <= length(program)
    println(global i)
    i += 1
end

