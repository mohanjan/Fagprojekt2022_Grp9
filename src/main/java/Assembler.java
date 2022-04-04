import java.io.*;
import java.util.Scanner;

public class Assembler {
    public static void main(String[] args) {
        replace_pseudo();
        demangle_identifiers();
        read_assembly();
    }

    public static void replace_pseudo(){
        try {
            File myObj = new File("C:\\Users\\Karl\\Desktop\\Skole\\Fagprojekt\\Program.txt");
            FileWriter myWriter = new FileWriter("C:\\Users\\Karl\\Desktop\\Skole\\Fagprojekt\\Program_PreAssembly.txt");
            Scanner myReader = new Scanner(myObj);

            String addedData = "";
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();

                if(data.contains(".") && data.contains(":")) {
                    addedData = " //" + data;
                }else if(pseudo_instructions(data)) {
                    if(data.contains("j")){
                        myWriter.write("ldi x1, " + data.substring(data.indexOf("."), (data.length())) + addedData + "\n");
                        addedData = "";
                    }else if(data.contains("loadFir")){
                        myWriter.write("ldi x4," + data.substring(data.indexOf(",") + 1, (data.length())) + addedData + "\n");
                        String memorypos = data.substring(0, data.indexOf(",")).replaceAll(("[^0-9]"), "");
                        myWriter.write("sw x4, " + (Integer.parseInt(memorypos) + 1983) + "\n");
                        addedData = "";
                    }
                }else if(data != ""){
                    myWriter.write(data + addedData + "\n");
                    addedData = "";
                }
            }
            myWriter.close();
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public static boolean pseudo_instructions(String instruction) {

        if (instruction.contains("j") || instruction.contains("loadFir")) {
            return true;
        }
        return false;
    }


    public static void demangle_identifiers(){
        String[] functionarray = new String[10];

        int functionarray_index = 0;
        int[] functionaddress = new int[10];


        try {
            File myObj = new File("C:\\Users\\Karl\\Desktop\\Skole\\Fagprojekt\\Program_PreAssembly.txt");
            Scanner myReader = new Scanner(myObj);

            int instruction_address = 0;

            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();

                if(data.contains("//")){
                    functionarray[functionarray_index] = data.substring(data.indexOf("/") + 2,data.indexOf(":") - 1);
                    functionaddress[functionarray_index] = instruction_address;

                    functionarray_index += 1;
                }
                instruction_address += 1;
            }

            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        try {
            File myObj = new File("C:\\Users\\Karl\\Desktop\\Skole\\Fagprojekt\\Program_PreAssembly.txt");
            FileWriter myWriter = new FileWriter("C:\\Users\\Karl\\Desktop\\Skole\\Fagprojekt\\Program_Assembly.txt");
            Scanner myReader = new Scanner(myObj);

            int instruction_address = 0;

            while(myReader.hasNextLine()){
                String data = myReader.nextLine();

                if(data.contains("//")){
                    data = data.replace(data.substring(data.indexOf("/")), "");
                }else{
                    for(int i = 0; i < functionarray.length; i++){
                        if(functionarray[i] != null){
                            if(data.contains(functionarray[i])){
                                data = data.replace(data.substring(data.indexOf("."),data.length()), Integer.toString(functionaddress[i]));
                            }
                        }
                    }
                }
                myWriter.write(data + "\n");
            }


            myWriter.close();
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }


    public static void read_assembly(){
        try {
            File myObj = new File("C:\\Users\\Karl\\Desktop\\Skole\\Fagprojekt\\Program_Assembly.txt");
            FileWriter myWriter = new FileWriter("C:\\Users\\Karl\\Desktop\\Skole\\Fagprojekt\\MachineCode.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                myWriter.write(Integer.toHexString(find_name(data)) + "\n");
            }
            myWriter.close();
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public static int find_name(String instruction){
        int val = 0;
        /*  ARITHMETIC INSTRUCTIONS  */
                /*add rd, rs1, rs2
                sub rd, rs1, rs2
                mult rd, rs1, rs2
                multfp rd, rs1, rs2
                and rd, rs1, rs2
                or rd, rs1, rs2
                xor rd rs1, rs2
                */

        if(instruction.contains("add") && !instruction.contains("addi")){
            val = 0b000000000000000000;

            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }

        else if(instruction.contains("sub")){
            val = 0b000001000000000000;
            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }

        else if(instruction.contains("mult")){
            val = 0b000010000000000000;
            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }

        else if(instruction.contains("sll")){
            val = 0b000011000000000000;
            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }

        else if(instruction.contains("srl")){
            val = 0b000100000000000000;
            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }

        else if(instruction.contains("and")){
            val = 0b000101000000000000;
            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }

        else if(instruction.contains("or")){
            val = 0b000110000000000000;
            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }

        else if(instruction.contains("xor")){
            val = 0b000111000000000000;
            val = (val | find_arguments(instruction,0));
            //System.out.println(val);
        }


        /*  IMMEDIATE INSTRUCTIONS
         *   addi rd, immediate
         *   ldi rd, immediate
         * */


        else if(instruction.contains("addi")){
            val = 0b010000000000000000;
            val = (val | find_arguments(instruction,1));
            //System.out.println(val);
        }

        else if(instruction.contains("ldi")){
            val = 0b011000000000000000;
            val = (val | find_arguments(instruction,1));
            //System.out.println(val);
        }



        /*  MEMORY INSTRUCTIONS  */
        /*lw rd, address
        sw rd, address
        */

        else if(instruction.contains("lw")){
            val = 0b100000000000000000;
            val = (val | find_arguments(instruction,1));
            //System.out.println(val);
        }

        else if(instruction.contains("sw")){
            val = 0b101000000000000000;
            val = (val | find_arguments(instruction,1));
            //System.out.println(val);
        }

        /*  CONDITIONAL BRANCH INSTRUCTIONS  */
        /*beq rs1, rs2, offset
        bne rs1, rs2, offset
        bge rs1, rs2, offset
        blt rs1, rs2, offset*/

        else if(instruction.contains("beq")){
            val = 0b110000000000000000;
            val = (val | find_arguments(instruction,3));
            //System.out.println(val);
        }

        else if(instruction.contains("bne")){
            val = 0b110100000000000000;
            val = (val | find_arguments(instruction,3));
            //System.out.println(val);
        }

        else if(instruction.contains("bge")){
            val = 0b111000000000000000;
            val = (val | find_arguments(instruction,3));
            //System.out.println(val);
        }

        else if(instruction.contains("blt")){
            val = 0b111100000000000000;
            val = (val | find_arguments(instruction,3));
            //System.out.println(val);
        }

        return val;
    }


    public static int find_arguments(String instruction, int type){
        int val=0;

        switch(type){
            case 0:
                int rd_index = instruction.indexOf("x");
                int rd = find_register(instruction.substring(rd_index, rd_index + 2));

                int rs1_index = instruction.indexOf("x", rd_index + 1);

                int rs1 = find_register(instruction.substring(rs1_index, rs1_index + 2));

                int rs2_index = instruction.indexOf("x", rs1_index + 1);
                int rs2 = find_register(instruction.substring(rs2_index, rs2_index + 2));

                /*

                System.out.println(rd_index);
                System.out.println(rd);
                System.out.println(rs1_index);
                System.out.println(rs1);
                System.out.println(rs2_index);
                System.out.println(rs2);

                */

                return (rd << 8) + (rs1 << 4) + rs2;
            case 1:
                rd_index = instruction.indexOf("x");
                rd = find_register(instruction.substring(rd_index, rd_index + 2));

                int imm = find_register(instruction.substring(rd_index + 3));

                if(instruction.contains("addi") && instruction.contains("-")){
                    imm = -imm;
                }

                return (rd << 11) + (imm & 0b11111111111);

            case 3:
                rs1_index = instruction.indexOf("x");
                rs1 = find_register(instruction.substring(rs1_index, rs1_index + 3));

                rs2_index = instruction.indexOf("x", rs1_index + 1);
                rs2 = find_register(instruction.substring(rs2_index, rs2_index + 3));

                int offset = find_register(instruction.substring(rs2_index + 3));

                if(instruction.substring(rs2_index + 3).contains("-")){
                    offset = -offset;
                }

                //System.out.println(rs2);
                return (rs1 << 10) + (rs2 << 6) + (offset & 0b111111);
        }
        return val;
    }

    public int return_machine_code(){
        int machine_code = 0;

        //if else tree, which first looks at the instruction type >>15
        //sum of the different functions...
        //java should be able to read the value of the imm_val easily...

        return machine_code;
    }

    public static int find_register(String instruction){
        String register = instruction.replaceAll(("[^0-9]"), "");
        return Integer.parseInt(register);
    }
}