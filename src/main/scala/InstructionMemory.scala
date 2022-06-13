import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
import scala.io.Source
import java.io.File
import java.nio.file.{Files, Paths}

import chisel3._
import chisel3.util.experimental.loadMemoryFromFileInline
import chisel3.experimental.{annotate, ChiselAnnotation}
import firrtl.annotations.MemorySynthInit

class InstuctionMemory(memoryFile: String = "") extends Module {
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val write = Input(Bool())
    val Address = Input(UInt(10.W))
    val DataIn = Input(UInt(18.W))
    val Instruction = Output(UInt(18.W))
  })


  // Instruction memory Instatiation 

  annotate(new ChiselAnnotation {
    override def toFirrtl =
      MemorySynthInit
  })

  val mem = SyncReadMem(1024, UInt(18.W))
  if (memoryFile.trim().nonEmpty) {
    loadMemoryFromFileInline(mem, memoryFile)
  }
  io.Instruction := DontCare
  when(io.enable) {
    val rdwrPort = mem(io.Address)
    when (io.write) { rdwrPort := io.DataIn }
      .otherwise    { io.Instruction := rdwrPort }
  }

}