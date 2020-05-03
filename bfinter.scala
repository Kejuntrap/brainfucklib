object MyApp {
  def main(args: Array[String]): Unit = {
    val program = io.StdIn.readLine()
    val memorysize = 65536
    var pointer = 0
    var bra = 0
    var i = 0
    var arr = new Array[Int](memorysize)
    while (i < program.length) {
      if (program(i) == '+') {
        if (0 <= pointer && pointer < memorysize) {
          arr.update(pointer, arr(pointer) + 1)
        }
        else {
          System.out.println("Out Of Array Bounds At:" + i)
          return
        }
        i += 1
      } else if (program(i) == '-') {
        if (0 <= pointer && pointer < memorysize) {
          arr.update(pointer, arr(pointer) - 1)
        }
        else {
          System.out.println("Out Of Array Bounds At:" + i)
          return
        }
        i += 1
      } else if (program(i) == '<') {
        pointer -= 1
        i += 1
      } else if (program(i) == '>') {
        pointer += 1
        i += 1
      } else if (program(i) == ',') {
        val inp = io.StdIn.readLine().asInstanceOf[Int]
        arr(pointer) = inp
        i += 1
      } else if (program(i) == '.') {
        print(arr(pointer).asInstanceOf[Char])
        i += 1
      } else if (program(i) == '[') {
        if( arr(pointer) == 0){
          bra = 1
          while(bra >0 ){
            if( i< program.length && program(i) == '['){
              bra+=1
            }else if( i< program.length && program(i) == ']'){
              bra-=1
            }else if(i  >= program.length){
              println("EOF Reached.")
              return
            }
          }
        } else{
          i += 1
        }
      } else if (program(i) == ']') {
        if( arr(pointer) != 0){
          bra = 1
          while(bra >0){
            i-=1
            if(i >=0 && program(i) == '['){
              bra-=1
            }else if(i >= 0 && program(i) == ']'){
              bra+=1
            }else if(i <0){
              println("Out Of Program")
              return
            }
          }
        } else{
          i += 1
        }
      } else {
        i += 1
      }
    }
  }
}