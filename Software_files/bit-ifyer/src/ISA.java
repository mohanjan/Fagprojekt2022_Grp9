

public class ISA{

    //method to read a string and shit out numbers
    public int find_name(String instruction){
        int val=0;
                /*  ARITHMETIC INSTRUCTIONS  */
                /*add rd, rs1, rs2
                sub rd, rs1, rs2
                mult rd, rs1, rs2
                multfp rd, rs1, rs2
                and rd, rs1, rs2
                or rd, rs1, rs2 
                xor rd rs1, rs2
                */

        if(instruction.contains("ADD"||"add"||"Add"){
            val=0b000001;
            
        }

        else if(instruction.contains("SUB"||"sub"||"Sub")){
            val=0b000010;
        }

        else if(instruction.contains("MULT"||"mult"||"Mult")){
            val=0b000011;
        }

        else if(instruction.contains("MULTFP"||"multfp"||"MultFP"||"Multfp")){
            val=0b000100;
        }

        else if(instruction.contains("SLL"||"sll"||"Sll")){
            val=0b000101;
        }

        else if(instruction.contains("SRL"||"srl"||"Srl")){
            val=0b000110;
        }
        //and, or, xor, ...

        /*  IMMEDIATE INSTRUCTIONS  */
        else if(instruction.contains("ADDI"||"addi"||"Addi"||"AddI")){
            val=0b010001;
            
        }

        else if(instruction.contains("SUBI"||"subi"||"Subi"||"SubI")){
            val=0b010010;
        }

        else if(instruction.contains("MULTI"||"multi"||"Multi"||"MultI")){
            val=0b010011;
        }

        //else if(instruction.contains("MULTFPI"||"multfpi"||"Multfpi"||"MultFPI")){
        else if(instruction.contains("LDI"||"ldi"||"Ldi"||"LdI")){
            val=0b010100;
        }



        /*  MEMORY INSTRUCTIONS  */
        /*lw rd, address
        sw rd, address
        */
        else if(instruction.contains("LW"||"lw"||"Lw")){
            val=0b100000;
        }

        else if(instruction.contains("SW"||"sw"||"Sw")){
            val=0b100001;
        }

        /*  CONDITIONAL BRANCH INSTRUCTIONS  */
        /*beq rs1, rs2, offset
        bne rs1, rs2, offset
        bge rs1, rs2, offset
        blt rs1, rs2, offset*/
        else if(instruction.contains("BEQ"||"beq"||"Beq")){
            val=0b110001;
        }

        else if(instruction.contains("BNE"||"bne"||"Bne")){
            val=0b100010;
        }
        
        else if(instruction.contains("BGE"||"bge"||"Bge")){
            val=0b100011;
        }
        
        else if(instruction.contains("BLT"||"blt"||"Blt")){
            val=0b100100;
        }

        return val;
    }


    public int find_reg(String instruction, int reg_num){
        int val=0;
                //Function needs to know, if the target register is rd, rs1, rs2
                //probably easy to read the x, then ignore the x and return the register number as its binary value...

        if(instruction.contains("x")){
            //return String - x; (int)stringtoint-> binary representation.
            val=0b0;
        }

        

        val= val<<(4*reg_num);
        return val;
    }

    public int find_imm_val(){
        int val=0;

        return val;
    }

    public int find_mem_addr_val(){
        int val=0;

        return val;
    }

    public int find_jump_val(){
        int val=0;

        return val;
    }

    public int return_machine_code(){
        //if else tree, which first looks at the instruction type >>15
        //sum of the different functions...
        //java should be able to read the value of the imm_val easily...

    }

}