public class ISA{

    //method to read a string and shit out numbers
    public int find_name(String instruction){
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

        if(instruction.contains("add")){
            val = 0b0000000000000;
        }

        else if(instruction.contains("sub")){
            val = 0b0000000000000;
        }

        else if(instruction.contains("mult")){
            val = 0b0000000000000;
        }

        else if(instruction.contains("sll")){
            val = 0b0000000000000;
        }

        else if(instruction.contains("srl")){
            val = 0b0000000000000;
        }

        else if(instruction.contains("and")){
            val = 0b0000000000000;
        }

        else if(instruction.contains("or")){
            val = 0b0000000000000;
        }

        else if(instruction.contains("xor")){
            val = 0b0000000000000;
        }


        /*  IMMEDIATE INSTRUCTIONS
        *   addi rd, immediate
        *   ldi rd, immediate
        * */


        else if(instruction.contains("addi")){
            val = 0b0100000000000;
        }

        else if(instruction.contains("ldi")){
            val = 0b0100000000000;
        }



        /*  MEMORY INSTRUCTIONS  */
        /*lw rd, address
        sw rd, address
        */

        else if(instruction.contains("lw")){
            val = 0b1000000000000;
        }

        else if(instruction.contains("sw")){
            val = 0b1000000000000;
        }

        /*  CONDITIONAL BRANCH INSTRUCTIONS  */
        /*beq rs1, rs2, offset
        bne rs1, rs2, offset
        bge rs1, rs2, offset
        blt rs1, rs2, offset*/

        else if(instruction.contains("beq")){
            val = 0b1100000000000;
        }

        else if(instruction.contains("bne")){
            val = 0b11000000000000;
        }

        else if(instruction.contains("bge")){
            val = 0b1100000000000;
        }

        else if(instruction.contains("blt")){
            val = 0b1100000000000;
        }

        return val;
    }


    public int find_arguments(String instruction, int type){
        int val=0;

        switch(type){
            case 0:
                int rd_index = instruction.indexOf("x");

                int rd = find_register(instruction, rd_index);









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

    public int find_register(String instruction, int index){

        int register = instruction.codePointAt(index);

        if(instruction.charAt(index + 1) != ' '){
            register = (register * 10) + instruction.codePointAt(index + 1);
        }

        return register;
    }





}