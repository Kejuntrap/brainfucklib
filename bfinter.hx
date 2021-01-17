import haxe.io.Int32Array;

class Bfinter {
	static public function main():Void {
		var program:String = Sys.stdin().readLine();
		var memorySize = 65536;
		var arr:Array<Int> = new Array();
		var pointer:Int = 0;
		var bra:Int = 0;
		var i:Int = 0;
		for (i in 0...memorySize) {
			arr.push(0);
		}
		while (i < program.length) {
			switch (program.charAt(i)) {
				case '+':
					if (0 <= pointer && pointer < memorySize) {
						arr[pointer]++;
					} else {
						Sys.println("Out Of Array Bounds At:" + i);
						return;
					}
					i++;
				case '-':
					if (0 <= pointer && pointer < memorySize) {
						arr[pointer]--;
					} else {
						Sys.println("Out Of Array Bounds At:" + i);
						return;
					}
					i++;
				case '<':
					pointer--;
					i++;
				case '>':
					pointer++;
					i++;
				case ',':
					var inp:Int = Sys.stdin().readLine().charCodeAt(0);
					arr[pointer] = inp;
					i++;
				case '.':
					Sys.print(String.fromCharCode(arr[pointer]));
					i++;
				case '[':
					if (arr[pointer] == 0) {
						bra = 1;
						while (bra > 0) {
							i++;
							if (i < program.length && program.charAt(i) == '[') {
								bra++;
							} else if (i < program.length && program.charAt(i) == ']') {
								bra--;
							} else if (i >= program.length) {
								Sys.println("EOF Reached");
								return;
							} else {}
						}
					} else {
						i++;
					}
				case ']':
					if (arr[pointer] != 0) {
						bra = 1;
						while (bra > 0) {
							i--;
							if (i >= 0 && program.charAt(i) == '[') {
								bra--;
							} else if (i >= 0 && program.charAt(i) == ']') {
								bra++;
							} else if (i < 0) {
								Sys.println("Out of Program");
								return;
							} else {
								// Other charcters.
							}
						}
					} else {
						i++;
					}
				default:
					return;
			}
		}
	}
}
