LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:  in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP: in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:   out std_logic_vector(3 downto 0);            			
    TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;


architecture bhv of AAC2M2P1 is
signal tmp: std_logic_vector(3 downto 0);
begin
	process ( cp )
		begin
			if rising_edge(cp) then
				if SR /= '1' then
					tmp <= "0000";
				elsif  PE /= '1' then
					tmp <= P;
				end if;
					if ( sr = '1' and pe = '1' and cet = '1' and cep = '1') then
						tmp <= tmp + 1;	
					end if;
					if ((sr = '1' and pe = '1' and cet = '0' ) or (sr = '1' and pe = '1'  and cep = '0')) then
					tmp <= tmp;
					end if;
		

			end if;
	end process;

Q <= tmp;
 end bhv;
