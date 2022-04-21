// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class OutController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(16.W))
    val In_FIR = Input(UInt(16.W)) //input from FIR filter

    val c_in = Input(Bool())//oversampling clock in
    val Out_FIR = Output(UInt(16.W)) // output from interpolator to FIR
    val Out_PWM = Output(UInt(16.W)) //

  })

val interpolate_reg = RegInit(0.U,(4.W))
  when(c_in){
    interpolate_reg = interpolate_reg + 1
  }

  when(interpolate_reg===0){  //alternatively just build a mux
    //connect wire from in to Out_FIR
  }else{
    //connect wire from value 0 to Out_FIR
  }
//interpolation -> OUT_FIR

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
// generate Verilog
object Synth extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new OutController(18))
}

