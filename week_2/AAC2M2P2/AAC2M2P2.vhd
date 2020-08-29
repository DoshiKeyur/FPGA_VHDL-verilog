LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;
architecture RTL of ram128_32 is

   type ram_type is array (0 to (2**7)-1) of std_logic_vector(31 DOWNTO 0);
   signal ram : ram_type;
   --signal read_address : std_logic_vector(31 DOWNTO 0);

begin

  RamProc: process(clock) is

  begin
    if rising_edge(clock) then
      if wren = '1' then
        ram(to_integer(unsigned(address))) <= data;
      end if;
      --read_address <= address;
    end if;
  end process RamProc;

   q <= ram(to_integer(unsigned(address)));

end architecture RTL;