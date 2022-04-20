import chisel3._

/** blackbox module
 *  Module extends 'BlackBox' instead of module
 * 
 *  Initialize all inputs and outputs of the ip
 *  Instantiation template for the IO's can be found in vivado
 * 
 * nothing else is needed
 */
class xadc_wiz_0() extends BlackBox {
  val io = IO(new Bundle {
    val di_in = Input(UInt(16.W))   //DRP input data
    val daddr_in = Input(UInt(7.W)) //DRP address bus
    val den_in = Input(UInt(1.W))   //DRP enable
    val dwe_in = Input(UInt(1.W)) //DRP write enable
    val drdy_out  = Output(UInt(1.W)) //DRP data ready signal
    val do_out  = Output(UInt(16.W)) //DRP output data
    val dclk_in  = Input(Clock()) //DRP clock input
    val reset_in  = Input(UInt(1.W)) //reset signal
    val convst_in = Input(UInt(1.W)) //Convert start input
    val vp_in  = Input(UInt(1.W)) //Internal positive analog input
    val vn_in  = Input(UInt(1.W)) //internal negative analog input
    val vauxp5 = Input(UInt(1.W)) //external pos input
    val vauxn5  = Input(UInt(1.W)) //external neg input
    val channel_out  = Output(UInt(5.W)) //Channel selection output of input mux
    val eoc_out  = Output(UInt(1.W)) //End of conversion signal
    val alarm_out  = Output(UInt(1.W)) //alarm output
    val eos_out  = Output(UInt(1.W)) //end of sequence signal
    val busy_out  = Output(UInt(1.W)) //Busy signal
  })

}
