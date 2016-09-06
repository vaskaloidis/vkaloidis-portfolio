package project5;

public class binSearch {
    public binSearch(String[] input, String toSearch){
        inp = input;
        search = toSearch;
    }
    public static int search() {
        int begin = 0;

        int end = inp.length;
        
        while(begin < end){

            int middle = (begin + end) / 2;

            if(search.compareTo(inp[middle]) < 0){
                end = middle;

            } else if(search.compareTo(inp[middle]) > 0){
                begin = middle + 1;

            } else {
                return middle;
            }
        }

        return -(begin + 1);
    }

    private static String[] inp;
    private static String search;

}
