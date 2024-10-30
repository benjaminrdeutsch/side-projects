// B. Deutsch (10/29/24)

/*
 * Absurdly condensed way of solving printNDots problem. (Just run the program to see expected output of the puzzle.)
 */

class PrintNDots {
    private static void printNDots(int n) { printNDots(n, false, n-1); }
    public static void printNDots(int n, boolean r, int count) {
        for (int i = 0; i < (!r?n:n-1); System.out.print(("\n"+i+++count--).charAt(0)))
            for (int j = -1; j < n-1; System.out.print((++j+(j<count!=r?".":j+1).toString()).charAt(1))){}
        if (r == false) printNDots(n, true, n-1);
    }
    public static void main(String[] args) { printNDots(5); }
}
