// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class OutController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In    = Input(SInt(16.W))
    val InFIR = Input(SInt(16.W)) // input from FIR filter
    val convReady = Input(Bool())

    val OutFIR = Output(SInt(16.W)) // output from interpolator to FIR
    val OutPWM = Output(UInt(1.W))  //

  })

  val scale = 16.U
  val ZReg  = RegInit(0.S(bufferWidth.W))
  val Diff  = Wire(SInt(16.W))
  val ZIn   = Wire(SInt(16.W))
  val DDC   = WireDefault(0.U(bufferWidth.W))

  val cntReg = RegInit(0.U(3.W))
  cntReg := cntReg + 1.U
  val tick = cntReg === 0.U

  when(cntReg === scale) {
    cntReg := 0.U
  }

  Diff := io.InFIR - DDC.asSInt //Mux(io.convReady, io.InFIR - DDC.asSInt, 0.S)
  ZIn  := ZReg + Diff
  ZReg := ZIn

  DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U).asUInt, 0.U)
  
  io.OutFIR := Mux(tick, io.In, 0.S)
  io.OutPWM := ~ZReg(bufferWidth - 1)

//shared FIR filter with IN controller

  //            SIGMA BALLS
  // step 0: declare different components
  // step 1: connect ALU_1 with DDC & IN_FIR
  // step 2: connect ALU_2 with ALU_1 & z^-1 register
  // step 3: connect z^-1 register with c_in
  // step 4: connect wire from ALU_2 to OUT_PWM (MSB), same wire to DDC. This signal goes to the pin connector, then it is sent to an analog Integrator outside the chip
  // step 5: DDC is a 16 bit NOR connector
  // step 6: dab on the haters

}
