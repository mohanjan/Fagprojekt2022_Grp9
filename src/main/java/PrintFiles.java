import java.io.*;
import java.io.File;
import java.util.Arrays;

/**
 * Example class
 */
public class PrintFiles {

    public static void sortAll(String dirName) {
        File directory = new File(dirName);

        File[] filesArray = directory.listFiles();

        //sort all files
        Arrays.sort(filesArray);

        //print the sorted values
        for (File file : filesArray) {
            if (file.isFile()) {
                System.out.println(file.getName().replace(".xml", ""));
            } 
        }
    }
}