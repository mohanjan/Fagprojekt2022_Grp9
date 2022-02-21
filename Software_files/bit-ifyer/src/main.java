import java.io.*;
import java.util.Scanner;

public class bitifyer {
    public static void main(String[] args) {

        
    }



    public static void read_file(int[] data) {
        //reads .bin files intended for the Ripes RISC V simulator, converts them to int values usable by IsaSim.java class
        System.out.print("Enter binary file location:\n");
        Scanner c = new Scanner(System.in);
        String temp = c.nextLine();
        String fileLoc = temp.replaceAll("[\"]", "");

        try {
            FileInputStream fis = new FileInputStream(new File(fileLoc));
            int i=0;
            while(true) {
                data[i]=fis.read();
                if(data[i]==-1) {
                    break;
                }

                i++;
            }
            fis.close();

        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        c.close();


        // below code was used during testing & debugging.
		/*int i =0;
		while(data[i]!=-1) {
			System.out.println(data[i]+(data[i+1]<<8)+(data[i+2]<<16)+(data[i+3]<<24)+",");
			System.out.println(String.format("0x%08x",data[i]+(data[i+1]<<8)+(data[i+2]<<16)+(data[i+3]<<24))+",");

			for(int j = 0;j<=7;j++) {
				System.out.print(((data[i]>>>j)&1) + " ");
				System.out.print(((data[i+1]>>>j)&1) + " ");
				System.out.print(((data[i+2]>>>j)&1) + " ");
				System.out.print(((data[i+3]>>>j)&1) + " ");

			}
			System.out.println();
			i+=4;
		}*/
    }

    public static void init_reg(int[] array) { // Code used to initialize every element in the input array. Was used just in case there was some trash data in the arrays?
        for(int i =0;i <array.length; i++) {
            array[i]=0;
        }
    }

    public static void read_res() {
        //reads the result files created by dump_registers() in IsaSim.java, also .res files from Ripes sim
        System.out.print("Enter result file location:\n");
        Scanner c = new Scanner(System.in);
        String temp = c.nextLine();
        String fileLoc = temp.replaceAll("[\"]", "");
        int[] data = new int[256];
        try {
            FileInputStream fis = new FileInputStream(new File(fileLoc));
            for(int i=0;i<256;i++){
                data[i]=fis.read();
            }
            for(int i=0;i<32;i++){
                System.out.print("register x" +i+ ": ");
                System.out.print(String.format("0x%08x",((data[i*4+3]<<24)+(data[i*4+2]<<16)+(data[i*4+1]<<8)+data[i*4]))+"\n");
            }
            fis.close();

        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        c.close();
    }
}