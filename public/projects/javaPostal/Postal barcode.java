
package project2;

/**
 *
 * @author Vas Kaloidis
 */
import java.util.Scanner;

/**
 *
 * @author nikonadictk
 */
public class Main
{

    static double digit1, digit2, digit3, digit4, digit5, input = 0, zipCode = 0;
    static double[] userDigits = new double[5];
    static String[] barCodeInp = new String[6];

    /**
     *
     * @param args
     */
    public static void main(String[] args)
    {
        Main main = new Main();
        Scanner in = new Scanner(System.in);
        String barCode = null;

        boolean mainInput = true; //Our main menu loop
        while(mainInput) //Our loop to make sure the user input a correct menu value (menu loop)
        {
            System.out.println("The Barcode App");
            System.out.println("Would you like to (Enter a number):");
            System.out.println("1) Create a barcode");
            System.out.println("2) Scan a barcode");

            input = in.nextDouble();

            if(input==1) //If he wants to create a bar code
            {
                System.out.println("Enter zip code: "); //Get user input
                zipCode = in.nextDouble();
                mainInput = false; //Break the loop
            } else if(input==2)  //If he wants to create the zipCode from a barCode
            {
                System.out.println("Enter bar code: "); //Get user input
                mainInput = false; //Breaks the loop
            } else //Informs the user his entry was not available in our program and sends him back to the beginning
            {
                System.out.println("You did not enter a correct menu value, try again");
            }
        }

        if(input==1)
        { //If the user wants to create a bar code from a zip code
            main.breakDigits(); //Have our breakDigits method break up the user's input digits

            for(int x = 0; x<5; x++)  //Print out each bar code for each zip code digit
            {
                int current = (int)userDigits[x];
                System.out.print(main.getBars(current) + " ");
            }

            //Now we calculate the check digit then print that out
            double checkDigit = (digit1 + digit2 + digit3 + digit4 + digit5); //Add up the entire zip code we can calculate a check digit
            int checkDigitCount = 0;
            while(checkDigit % 10 != 0)  //Keep adding values to our check digit till it is a multiple of 10
            {
                checkDigit++;
                checkDigitCount++; //Track how many values we added to make the zipcode a value of ten, and that is our check digit
            }
            System.out.print(main.getBars(checkDigitCount)); //Print the checkDigit at the end of our bar code
            System.out.println();
            System.out.println("README included in project file, thank you for using The Barcode App");
            System.out.println();


        } else if(input==2) //If the user wants to create a zipCode form a bar code
        {
            
            for(int x = 0; x<5; x++)
            {
               barCodeInp[x] = in.next();
                for(int y = 0; y<10; y++)
                {
                    if(barCodeInp[x].equals(main.getBars(y)))
                    {
                        System.out.print(y);
                    }
                }
            }
            System.out.println();
            System.out.println("README included in project file, thank you for using The Barcode App");
            System.out.println();

        }
    }

    /**
     *
     * @param barRequest gets the number number
     * @return a barcode as a string
     */
    public String getBars(int barRequest) //The method of getting the bar codes for each number
    {
       String[] barCodes = new String[10]; //Make an array containing all of our digit/bar code translations

        for(int x = 0; x<=10; x++)
            {
                if(x==1)
                {
                    barCodes[x] = ":::||";
                } else if(x==2)
                {
                    barCodes[x] = "::|:|";
                } else if(x==3)
                {
                    barCodes[x] = "::||:";
                } else if(x==4)
                {
                    barCodes[x] = ":|::|";
                } else if(x==5)
                {
                    barCodes[x] = ":|:|:";
                } else if(x==6)
                {
                    barCodes[x] = ":||::";
                } else if(x==7)
                {
                    barCodes[x] = "|:::|";
                } else if(x==8)
                {
                    barCodes[x] = "|::|:";
                } else if(x==9)
                {
                    barCodes[x] = "|:|::";
                } else if(x==0)
                {
                    barCodes[x] = "||:::";
                }
        }
        return barCodes[barRequest];
    }

    /**
     *
     */
    public void breakDigits() //Breaks up the user's input by separating it digit by digit and returning an array
    { 
       digit5 = (zipCode % 10);
       digit4 = (((zipCode % 100) - digit5) / 10);
       digit3 = (((zipCode % 1000) - (digit4 * 10) - digit5) / 100);
       digit2 = (((zipCode % 10000) - (digit3 * 100) - (digit4 * 10) - digit5) / 1000);
       digit1 = ((zipCode - (digit2 * 1000) - (digit3 *100) - (digit4 * 10) - digit5) / 10000);

       userDigits[0] = digit1; //Put each digit into an individual array value
       userDigits[1] = digit2;
       userDigits[2] = digit3;
       userDigits[3] = digit4;
       userDigits[4] = digit5;
    }
}
