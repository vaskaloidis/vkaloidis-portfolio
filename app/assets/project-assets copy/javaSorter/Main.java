
package project5;
›import java.util.*;
import java.io.*;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        Scanner in = new Scanner(System.in);
        System.out.println("Enter the name of the file containing the directory you would like to load:");
		String fileName = in.nextLine();

        fileName = "directory.txt";

        FileReader fr = new FileReader(fileName);
        BufferedReader br = new BufferedReader(fr);

        int rowCount = 0;

        ArrayList tempRows = new ArrayList();
        ArrayList<ArrayList<String>> dir = new ArrayList<ArrayList<String>>();

        while((lineString = br.readLine()) != null) {

            dir.add(rowCount, new ArrayList<String>());
            String [] tmpArray = lineString.split("-");
            for(int x = 0; x < 7; x++){
                dir.get(rowCount).add(tmpArray[x]);
            }
            
            tempRows.add(rowCount, lineString);
            rowCount++;
        }

        while(menu){

            System.out.println("********* CURRENT DIRECTORY LOADED ***********");
            for(int x = 0; x < dir.size(); x++){
                for(int y = 0; y < 5; y++){
                    System.out.print(dir.get(x).get(y) + " - ");
                }
                System.out.println(dir.get(x).get(6));
                System.out.println("");
            }
            System.out.println("***********************************************");
            System.out.println("");
            System.out.println("1) View the contentents of a perticular entry");
            System.out.println("2) Sort the entire directory");
            System.out.println("3) Insert an entry");
            System.out.println("4) Delete an entry");
            System.out.println("5) Save the directory to a file and exit");
            System.out.println("");
            Double input = in.nextDouble();
            System.out.println("");


            if(input == 1){ //If the user wants to view a specific entry
                System.out.println("Directory Entries: (last, first)");
                System.out.println("");
                for(int x = 0; x < dir.size(); x++){ //We display the first and last names to the user
                    for(int y = 0; y < 2; y ++){
                        System.out.print(dir.get(x).get(y));
                        if(y!=1){
                            System.out.print(", ");
                        }

                    }
                    System.out.println(" ");
                }

                //We ask the user what last name he would like to view more about
                System.out.println("Please enter the last name of the person you would like to view");
                String inp = in.next();

                String[] data = new String[dir.size()];

                for(int x = 0; x < dir.size(); x++){
                    data[x] = dir.get(x).get(0);
                }
                
                binSearch bs = new binSearch(data, inp); //BINARY SEARCH

                System.out.println("");
                System.out.println("");

                entryRequest = bs.search();

                System.out.println(entryRequest);
                System.out.println("****");

                for(int x = 0; x < data.length; x++){
                    System.out.println(x + " - " + data[x]);
                }

                if(entryRequest < 0){
                    System.out.println("That entry does not exist");
                } else {
                    System.out.println(entryRequest);
                    for(int x = 0; x < 5; x++){
                        System.out.print(dir.get(entryRequest).get(x) + " - ");
                    }
                    System.out.println("");
                }
            } else if(input == 3){

                System.out.println("");
                System.out.println("Here you may enter a new person into the directory");
                System.out.println("Enter it in the format of:");
                System.out.println("Last name - first name - road - city - state - zip code - phone number");
                System.out.println("Seperated by brackets");
                System.out.println("");
                String addInp = in.next();
                String [] tmpAddInp = addInp.split("-");
                int dirSize = dir.size();
                dir.add(dirSize, new ArrayList<String>());
                for(int x = 0; x < tmpAddInp.length; x++){
                    
                    dir.get(dirSize).add(x, tmpAddInp[x]);
                }

                
                System.out.println("Entry successfully added!");

            } else if(input == 2){

                String[] lastNames = new String[dir.size()];
                
                for(int x = 0; x < dir.size(); x++){
                    lastNames[x] = dir.get(x).get(0);
                }

                ArrayList<ArrayList<String>> dirTemp = new ArrayList<ArrayList<String>>();

                Arrays.sort(lastNames);

                for(int x = 0; x < dir.size(); x++){
                    for(int y = 0; y < 5; y++){
                        System.out.print(dirTemp.get(x).get(y) + " - ");
                    }
                    System.out.println(" ");
                }

            }
        }
        br.close();
        
    }
    private static String inputFile, lineString, lineCount = null;
    private static int count, entryRequest = 0;
    private static boolean found = false;
    private static boolean menu = true;
}
