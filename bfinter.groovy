public class bfinter {
  public static void main(String[] args) {
    def program = System.in.newReader().readLine();
    def memorysize = 65536;
    def pointer = 0;
    def bra = 0;
    def i = 0;
    def arr = new int[memorysize];
    while (i < program.length()) {
			if (program.charAt(i) == '+') {
				if (0 <= pointer && pointer < memorysize) {
					arr[pointer]++;
				} else {
					System.out.println("Out Of Array Bounds At:" + i);
					return;
				}
				i++;
			} else if (program.charAt(i) == '-') {
				if (0 <= pointer && pointer < memorysize) {
					arr[pointer]--;
				} else {
					System.out.println("Out Of Array Bounds At:" + i);
					return;
				}
				i++;
			} else if (program.charAt(i) == '<') {
				pointer--;
				i++;
			} else if (program.charAt(i) == '>') {
				pointer++;
				i++;
			} else if (program.charAt(i) == ',') {
				def inp = (int) System.in.newReader().readLine();
				arr[pointer] = inp;
				i++;
			} else if (program.charAt(i) == '.') {
				System.out.print((char) arr[pointer]);
				i++;
			} else if (program.charAt(i) == '[') {
				if (arr[pointer] == 0) {
					bra = 1;
					while (bra > 0) {
						i++;
						if (i < program.length() && program.charAt(i) == '[') {
							bra++;
						} else if (i < program.length() && program.charAt(i) == ']') {
							bra--;
						} else if (i >= program.length()) {
							System.out.println("EOF Reached");
							return;
						} else {
						}
					}
				} else {
					i++;
				}
			} else if (program.charAt(i) == ']') {
				if (arr[pointer] != 0) {
					bra = 1;
					while (bra > 0) {
						i--;
						if (i >= 0 && program.charAt(i) == '[') {
							bra--;
						} else if (i >= 0 && program.charAt(i) == ']') {
							bra++;
						} else if (i < 0) {
							System.out.println("Out of Program");
							return;
						}
					}
				} else {
					i++;
				}
			}
		}
	}
}