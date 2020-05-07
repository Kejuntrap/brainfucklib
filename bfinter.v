import os

fn main(){
	program := os.input('')
	memorysize := 65536
	mut arr := []int{ len: memorysize, default: 0 }
	mut pointer := 0
	mut i := 0
	mut bra := 0
	for i < program.len {
		if program[i] == `+` {
			if 0 <= pointer && pointer < memorysize{
				arr[pointer] += 1
			}else{
				println("Out Of Array Bounds At: $i")
				return
			}
			i += 1
		}else if program[i] ==  `-` {
			if 0 <= pointer && pointer < memorysize{
				arr[pointer] -= 1
			}else{
				println("Out Of Array Bounds At: $i")
				return
			}
			i += 1
		}else if program[i] ==  `<` {
			pointer -= 1
			i = i + 1
		}else if program[i] ==  `>` {
			pointer += 1
			i += 1
		}else if program[i] ==  `,` {
			inp := int(os.input('')[0])
			arr[pointer] = inp
			i += 1
		}else if program[i] ==  `.` {
			print(byte(arr[pointer]))
			i += 1
		}else if program[i] == `[` {
			if arr[pointer] == 0{
				bra = 1
				for bra > 0{
					i += 1
					if i < program.len && program[i] == `[`{
						bra += 1
					}else if i < program.len && program[i] == `]`{
						bra -= 1
					}else if i>=program.len {
						println('EOF Reached')
						return
					}
				}
			}
			else{
				i += 1
			}
		}else if program[i] ==  `]` {
			if arr[pointer] != 0{
				bra = 1
				for bra > 0{
					i -= 1
					if i >= 0 && program[i] == `[`{
						bra -= 1
					}else if i >= 0 && program[i] == `]`{
						bra += 1
					}else if i < 0 {
						println('Out Of Program.')
						return
					}
				}
			}
			else{
				i += 1
			}
		}else{
			i += 1
		}
	}
}