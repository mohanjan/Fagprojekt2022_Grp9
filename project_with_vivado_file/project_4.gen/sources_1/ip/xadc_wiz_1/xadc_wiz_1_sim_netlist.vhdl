-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Feb 28 11:14:53 2022
-- Host        : DESKTOP-K43AEQ4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Gamerpcen/Desktop/project_3/project_3.gen/sources_1/ip/xadc_wiz_1/xadc_wiz_1_sim_netlist.vhdl
-- Design      : xadc_wiz_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xadc_wiz_1 is
  port (
    daddr_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dclk_in : in STD_LOGIC;
    den_in : in STD_LOGIC;
    di_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dwe_in : in STD_LOGIC;
    reset_in : in STD_LOGIC;
    vauxp4 : in STD_LOGIC;
    vauxn4 : in STD_LOGIC;
    busy_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    do_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy_out : out STD_LOGIC;
    eoc_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    vp_in : in STD_LOGIC;
    vn_in : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of xadc_wiz_1 : entity is true;
end xadc_wiz_1;

architecture STRUCTURE of xadc_wiz_1 is
  signal NLW_inst_JTAGBUSY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_JTAGLOCKED_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_JTAGMODIFIED_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_OT_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ALM_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_inst_MUXADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of inst : label is "PRIMITIVE";
begin
inst: unisim.vcomponents.XADC
    generic map(
      INIT_40 => X"8014",
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
      ALM(6 downto 0) => NLW_inst_ALM_UNCONNECTED(6 downto 0),
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
      JTAGBUSY => NLW_inst_JTAGBUSY_UNCONNECTED,
      JTAGLOCKED => NLW_inst_JTAGLOCKED_UNCONNECTED,
      JTAGMODIFIED => NLW_inst_JTAGMODIFIED_UNCONNECTED,
      MUXADDR(4 downto 0) => NLW_inst_MUXADDR_UNCONNECTED(4 downto 0),
      OT => NLW_inst_OT_UNCONNECTED,
      RESET => reset_in,
      VAUXN(15 downto 5) => B"00000000000",
      VAUXN(4) => vauxn4,
      VAUXN(3 downto 0) => B"0000",
      VAUXP(15 downto 5) => B"00000000000",
      VAUXP(4) => vauxp4,
      VAUXP(3 downto 0) => B"0000",
      VN => vn_in,
      VP => vp_in
    );
end STRUCTURE;
