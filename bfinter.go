package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	program, _ := reader.ReadString('\n')
	memorysize := 65536
	pointer := 0
	arr := make([]int, memorysize)
	bra := 0
	i := 0
	for i < len(program) {
		if program[i] == '+' {
			if 0 <= pointer && pointer < memorysize {
				arr[pointer]++
			} else {
				fmt.Printf("Out Of Array Bounds At: %v\n", i)
			}
			i++
		} else if program[i] == '-' {
			if 0 <= pointer && pointer < memorysize {
				arr[pointer]--
			} else {
				fmt.Printf("Out Of Array Bounds At: %v\n", i)
			}
			i++
		} else if program[i] == '<' {
			pointer--
			i++
		} else if program[i] == '>' {
			pointer++
			i++
		} else if program[i] == ',' {
			tmp, _ := reader.ReadString('\n')
			inp, _ := strconv.Atoi(tmp)
			arr[pointer] = inp
			i++
		} else if program[i] == '.' {
			fmt.Printf("%c", arr[pointer])
			i++
		} else if program[i] == '[' {
			if arr[pointer] == 0 {
				bra = 1
				for bra > 0 {
					i++
					if i < len(program) && program[i] == '[' {
						bra++
					} else if i < len(program) && program[i] == ']' {
						bra--
					} else if i >= len(program) {
						fmt.Println("EOF Reached")
						return
					} else {
					}
				}
			} else {
				i++
			}
		} else if program[i] == ']' {
			if arr[pointer] != 0 {
				bra = 1
				for bra > 0 {
					i--
					if i >= 0 && program[i] == '[' {
						bra--
					} else if i >= 0 && program[i] == ']' {
						bra--
					} else if i < 0 {
						fmt.Println("Out Of Program.")
						return
					} else {
					}
				}
			} else {
				i++
			}
		} else {
			i++
		}
	}
}
