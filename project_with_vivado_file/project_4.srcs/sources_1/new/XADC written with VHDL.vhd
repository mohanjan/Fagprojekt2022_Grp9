----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2022 11:17:20
-- Design Name: 
-- Module Name: XADC - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adc is
 Port ( 
        clk : in STD_LOGIC;
        sw : in std_logic;
        LED : out STD_LOGIC_VECTOR (15 downto 0);
        JA : STD_LOGIC_VECTOR (7 DOWNTO 0) );
end adc;

architecture Behavioral of adc is
      
COMPONENT xadc_wiz_0
  PORT (
    di_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    daddr_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    den_in : IN STD_LOGIC;
    dwe_in : IN STD_LOGIC;
    drdy_out : OUT STD_LOGIC;
    do_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    dclk_in : IN STD_LOGIC;
    reset_in : IN STD_LOGIC;
    vp_in : IN STD_LOGIC;
    vn_in : IN STD_LOGIC;
    vauxp5 : IN STD_LOGIC;
    vauxn5 : IN STD_LOGIC;
    channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    eoc_out : OUT STD_LOGIC;
    alarm_out : OUT STD_LOGIC;
    eos_out : OUT STD_LOGIC;
    busy_out : OUT STD_LOGIC
  );
END COMPONENT;
    
signal channel_out : std_logic_vector(4 downto 0);
signal daddr_in  : std_logic_vector(6 downto 0);
signal eoc_out : std_logic;
signal do_out  : std_logic_vector(15 downto 0);  
signal anal_p, anal_n : std_logic;     
    
begin

  xadc_inst : xadc_wiz_0
  PORT MAP (
    di_in => "0000000000000000",
    daddr_in => daddr_in,
    den_in => eoc_out,
    dwe_in => '0',
    drdy_out => open,
    do_out => do_out,
    dclk_in => clk,
    reset_in => sw,
    vp_in => '0',
    vn_in => '0',
    vauxp5 => anal_p,
    vauxn5 => anal_n,
    channel_out => channel_out,
    eoc_out => eoc_out,
    alarm_out => open,
    eos_out => open,
    busy_out => open
  );

daddr_in <= "00" & channel_out;
anal_p <= JA(4);
anal_n <= JA(0);

-- 1 bit increment is approx. 50 mv
with do_out(15 downto 12) select
LED <=  "0000000000000000" when "0000",
        "0000000000000001" when "0001",
        "0000000000000011" when "0010",
        "0000000000000111" when "0011",
        "0000000000001111" when "0100",
        "0000000000011111" when "0101",
        "0000000000111111" when "0110",
        "0000000001111111" when "0111",
        "0000000011111111" when "1000",
        "0000000111111111" when "1001",
        "0000001111111111" when "1010",
        "0000011111111111" when "1011",
        "0000111111111111" when "1100",
        "0001111111111111" when "1101",
        "0011111111111111" when "1110",
        "0111111111111111" when "1111",
        "1100110011001100" when others;


--LED <= do_out;

end Behavioral;