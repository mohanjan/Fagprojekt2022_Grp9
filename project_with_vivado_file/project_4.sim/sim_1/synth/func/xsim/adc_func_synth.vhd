-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Mon Mar  7 11:07:26 2022
-- Host        : DESKTOP-K43AEQ4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Gamerpcen/Desktop/project_4/project_4.sim/sim_1/synth/func/xsim/adc_func_synth.vhd
-- Design      : adc
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xadc_wiz_0 is
  port (
    daddr_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    den_in : in STD_LOGIC;
    di_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dwe_in : in STD_LOGIC;
    do_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy_out : out STD_LOGIC;
    dclk_in : in STD_LOGIC;
    reset_in : in STD_LOGIC;
    vauxp5 : in STD_LOGIC;
    vauxn5 : in STD_LOGIC;
    busy_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    eoc_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    vp_in : in STD_LOGIC;
    vn_in : in STD_LOGIC
  );
end xadc_wiz_0;

architecture STRUCTURE of xadc_wiz_0 is
  signal NLW_U0_JTAGBUSY_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_JTAGLOCKED_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_JTAGMODIFIED_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_OT_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_ALM_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_U0_MUXADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute box_type : string;
  attribute box_type of U0 : label is "PRIMITIVE";
begin
U0: unisim.vcomponents.XADC
    generic map(
      INIT_40 => X"8015",
      INIT_41 => X"310F",
      INIT_42 => X"0400",
      INIT_43 => X"0000",
      INIT_44 => X"0000",
      INIT_45 => X"0000",
      INIT_46 => X"0000",
      INIT_47 => X"0000",
      INIT_48 => X"0100",
      INIT_49 => X"0000",
      INIT_4A => X"0000",
      INIT_4B => X"0000",
      INIT_4C => X"0000",
      INIT_4D => X"0000",
      INIT_4E => X"0000",
      INIT_4F => X"0000",
      INIT_50 => X"B5ED",
      INIT_51 => X"57E4",
      INIT_52 => X"A147",
      INIT_53 => X"CA33",
      INIT_54 => X"A93A",
      INIT_55 => X"52C6",
      INIT_56 => X"9555",
      INIT_57 => X"AE4E",
      INIT_58 => X"5999",
      INIT_59 => X"0000",
      INIT_5A => X"0000",
      INIT_5B => X"0000",
      INIT_5C => X"5111",
      INIT_5D => X"0000",
      INIT_5E => X"0000",
      INIT_5F => X"0000",
      IS_CONVSTCLK_INVERTED => '0',
      IS_DCLK_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SIM_MONITOR_FILE => "design.txt"
    )
        port map (
      ALM(7) => alarm_out,
      ALM(6 downto 0) => NLW_U0_ALM_UNCONNECTED(6 downto 0),
      BUSY => busy_out,
      CHANNEL(4 downto 0) => channel_out(4 downto 0),
      CONVST => '0',
      CONVSTCLK => '0',
      DADDR(6 downto 0) => daddr_in(6 downto 0),
      DCLK => dclk_in,
      DEN => den_in,
      DI(15 downto 0) => di_in(15 downto 0),
      DO(15 downto 0) => do_out(15 downto 0),
      DRDY => drdy_out,
      DWE => dwe_in,
      EOC => eoc_out,
      EOS => eos_out,
      JTAGBUSY => NLW_U0_JTAGBUSY_UNCONNECTED,
      JTAGLOCKED => NLW_U0_JTAGLOCKED_UNCONNECTED,
      JTAGMODIFIED => NLW_U0_JTAGMODIFIED_UNCONNECTED,
      MUXADDR(4 downto 0) => NLW_U0_MUXADDR_UNCONNECTED(4 downto 0),
      OT => NLW_U0_OT_UNCONNECTED,
      RESET => reset_in,
      VAUXN(15 downto 6) => B"0000000000",
      VAUXN(5) => vauxn5,
      VAUXN(4 downto 0) => B"00000",
      VAUXP(15 downto 6) => B"0000000000",
      VAUXP(5) => vauxp5,
      VAUXP(4 downto 0) => B"00000",
      VN => vn_in,
      VP => vp_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adc is
  port (
    clk : in STD_LOGIC;
    sw : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    JA : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of adc : entity is true;
end adc;

architecture STRUCTURE of adc is
  signal JA_IBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal LED_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal channel_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal clk_IBUF : STD_LOGIC;
  signal eoc_out : STD_LOGIC;
  signal sw_IBUF : STD_LOGIC;
  signal NLW_xadc_inst_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_xadc_inst_busy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_xadc_inst_drdy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_xadc_inst_eos_out_UNCONNECTED : STD_LOGIC;
  attribute IMPORTED_FROM : string;
  attribute IMPORTED_FROM of xadc_inst : label is "c:/Users/Gamerpcen/Desktop/project_4/project_4.gen/sources_1/ip/xadc_wiz_0/xadc_wiz_0.dcp";
  attribute IMPORTED_TYPE : string;
  attribute IMPORTED_TYPE of xadc_inst : label is "CHECKPOINT";
  attribute IS_IMPORTED : boolean;
  attribute IS_IMPORTED of xadc_inst : label is std.standard.true;
  attribute syn_black_box : string;
  attribute syn_black_box of xadc_inst : label is "TRUE";
begin
\JA_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => JA(0),
      O => JA_IBUF(0)
    );
\JA_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => JA(1),
      O => JA_IBUF(1)
    );
\LED_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(0),
      O => LED(0)
    );
\LED_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(10),
      O => LED(10)
    );
\LED_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(11),
      O => LED(11)
    );
\LED_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(12),
      O => LED(12)
    );
\LED_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(13),
      O => LED(13)
    );
\LED_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(14),
      O => LED(14)
    );
\LED_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(15),
      O => LED(15)
    );
\LED_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(1),
      O => LED(1)
    );
\LED_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(2),
      O => LED(2)
    );
\LED_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(3),
      O => LED(3)
    );
\LED_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(4),
      O => LED(4)
    );
\LED_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(5),
      O => LED(5)
    );
\LED_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(6),
      O => LED(6)
    );
\LED_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(7),
      O => LED(7)
    );
\LED_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(8),
      O => LED(8)
    );
\LED_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(9),
      O => LED(9)
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
sw_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => sw,
      O => sw_IBUF
    );
xadc_inst: entity work.xadc_wiz_0
     port map (
      alarm_out => NLW_xadc_inst_alarm_out_UNCONNECTED,
      busy_out => NLW_xadc_inst_busy_out_UNCONNECTED,
      channel_out(4 downto 0) => channel_out(4 downto 0),
      daddr_in(6 downto 5) => B"00",
      daddr_in(4 downto 0) => channel_out(4 downto 0),
      dclk_in => clk_IBUF,
      den_in => eoc_out,
      di_in(15 downto 0) => B"0000000000000000",
      do_out(15 downto 0) => LED_OBUF(15 downto 0),
      drdy_out => NLW_xadc_inst_drdy_out_UNCONNECTED,
      dwe_in => '0',
      eoc_out => eoc_out,
      eos_out => NLW_xadc_inst_eos_out_UNCONNECTED,
      reset_in => sw_IBUF,
      vauxn5 => JA_IBUF(1),
      vauxp5 => JA_IBUF(0),
      vn_in => '0',
      vp_in => '0'
    );
end STRUCTURE;
