import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
import scala.io.Source
import java.io.File

class InstuctionMemory() extends Module {
  val io = IO(new Bundle {
    val Address = Input(UInt(10.W))
    val DataIn = Input(UInt(18.W))
    val MemWrite = Input(Bool())

    val Instruction = Output(UInt(18.W))

    //val Instruction = Output(Bits(18.W))

  })

  /*

  val someFile = new File("MachineCode.mem")
  val fileSize = someFile.length.toInt

  val OutputReg = RegInit(0.U(18.W))

  for(i <- 0 until fileSize){
    switch(io.Address){
      is(i.U){
        OutputReg := Integer.parseInt(Source.fromFile(someFile).getLines,16).asUInt
      }
    }
  }

  */



  /*

  val InstructionMemory = Wire(Vec(fileSize, UInt(18.W)))

  val filename = "MachineCode.mem"
  var i = 0;

  for (line <- Source.fromFile(filename).getLines) {
    //println(line)
    //InstructionMemory(i) := line.toInt.asUInt(18.W)
    //InstructionMemory(i) := Integer.parseInt(line,32).asUInt(18.W)
    var number = Integer.parseUnsignedInt(line,16)
    println(number)
    InstructionMemory(i) := number.asUInt
    i += 1
  }

  val inits =

  */





  //val InstructionMemory = Mem(1024,UInt(18.W))

  val InstructionMemory = SyncReadMem(1024,Bits(18.W))

  //loadMemoryFromFileInline(InstructionMemory,"C:\\Users\\Karl\\Documents\\GitHub\\Fagprojekt2022_Grp9\\MachineCode.mem")

  loadMemoryFromFileInline(InstructionMemory,"MachineCode.mem")

  io.Instruction := 0.U

  when(io.MemWrite){
    InstructionMemory.write(io.Address,io.DataIn)
  }.otherwise{
    io.Instruction := InstructionMemory.read(io.Address)
  }

}