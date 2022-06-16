import chisel3._
import chisel3.experimental._
import chisel3.util._
// import scala.xml._

class NodeConnector(nodeCount: Int) extends Module {
  val io = IO(new Bundle {
    val In = Vec(nodeCount, Input(UInt(18.W)))
    val Out = Output(UInt(18.W))
  })
  
  // Parametriziable mixer 

  val Carry = Wire(Vec(nodeCount, UInt(18.W)))
  Carry(0) := io.In(0)

  for(i <- 0 until nodeCount-1){
    Carry(i+1) := Carry(i) + io.In(i+1)
  } 

  io.Out := Carry(nodeCount-1)

}  