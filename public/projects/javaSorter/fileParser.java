

package project5;

import java.io.*;

public class fileParser {
    public fileParser(String inputFile){
        fileName = inputFile;
    }
    public String[][] getArray() throws IOException{
        FileReader fr = new FileReader(fileName);
        BufferedReader br = new BufferedReader(fr);

        int rowCount = 0;
        while((lineCounter = br.readLine()) != null) {
            rowCount++;
        }

        String[][] data = new String[rowCount][7];
        count = 0;

        while((lineString = br.readLine()) != null) { //To read each file line individually

                String [] lineArray = lineString.split("-");

                for(int x = 0; x < lineArray.length; x++){
                        data[count][x] = lineArray[x];
                }
                System.out.println("");
                count++;
        }

        return data;

    }
    private static String fileName, lineString, lineCounter;
    private static int count = 0;

}
