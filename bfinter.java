import java.util.Scanner;
import java.util.Arrays;

public class bfinter {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String program = sc.nextLine();
        int memorySize = 65536;
        int[] arr = new int[memorySize];
        Arrays.fill(arr, 0);
        int pointer = 0;
        int bra = 0;
        int i = 0;
        while (i < program.length()) {
            if (program.charAt(i) == '+') {
                if (0 <= pointer && pointer < memorySize) {
                    arr[pointer]++;
                } else {
                    System.out.println("Out Of Array Bounds At:" + i);
                    return;
                }
                i++;
            } else if (program.charAt(i) == '-') {
                if (0 <= pointer && pointer < memorySize) {
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
                int inp = sc.nextInt();
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
                        } else {
                            //Other charcters.
                        }
                    }
                } else {
                    i++;
                }
            }
        }
    }
}
