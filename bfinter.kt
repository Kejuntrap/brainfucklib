import java.util.*

fun main(args: Array<String>) {
    val sc = Scanner(System.`in`)
    val program = sc.nextLine()
    val memorySize = 65536  //64KB
    val arr = IntArray(memorySize) { 0 }
    var pointer = 0
    var bra: Int = 0
    var i = 0
    while (i < program.length) {
        if (program[i] == '+') {
            if (pointer in 0 until memorySize) {
                arr[pointer]++
            } else {
                println("Out Of Array Bounds At: $i")
                return
            }
            i++
        } else if (program[i] == '-') {
            if (pointer in 0 until memorySize) {
                arr[pointer]--
            } else {
                println("Out Of Array BoundsAt: $i")
                return
            }
            i++
        } else if (program[i] == '<') {
            pointer--
            i++
        } else if (program[i] == '>') {
            pointer++
            i++
        } else if (program[i] == '[') {
            if (arr[pointer] == 0) {
                bra = 1
                while (bra > 0) {
                    i++
                    if (i < memorySize && program[i] == '[') {
                        bra++
                    } else if (i < memorySize && program[i] == ']') {
                        bra--
                    } else if (i >= memorySize) {
                        println("EOF Reached.")
                        return
                    } else {
                    }
                }
            } else {
                i++
            }
        } else if (program[i] == ']') {
            if (arr[pointer] != 0) {
                bra = 1
                while (bra > 0) {
                    i--
                    if (i >= 0 && program[i] == '[') {
                        bra--
                    } else if (i >= 0 && program[i] == ']') {
                        bra++
                    } else if (i < 0) {
                        println("Out Of Program.")
                        return
                    } else {
                    }
                }
            } else {
                i++
            }
        } else if (program[i] == ',') {
            var inp = sc.nextInt()
            arr[pointer] = inp
            i++
        } else if (program[i] == '.') {
            print(arr[pointer].toChar())
            i++
        } else {
            //Other characters.
        }
    }
}
