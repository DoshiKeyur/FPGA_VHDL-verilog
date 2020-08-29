library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;

architecture behavioral of FSM is 
--A - 00, b - 01 , c - 10
signal C_S : std_logic_vector(1 DOWNTO 0);
signal N_S : std_logic_vector(1 DOWNTO 0);
begin
--sequential
	process (clk,rst) 
		begin
			if rst = '1' then
				C_S <= "00";
			elsif rising_edge(clk) then
				C_S<=N_S;
			end if;

	end process;
--combinational 
	process (C_S,In1)
		begin
			case (C_S) is
				when "00" =>
					if In1 = '1' then
						N_S <= "01";
					else
						N_S <= "00";
					end if;
				when "01" =>
					if In1 = '1' then
						N_S <= "01";
					else
						N_S <= "10";
					end if;
				when "10" =>
					if In1 = '1' then
						N_S <= "00";
					else
						N_S <= "10";
					end if;
				when others => N_S <= "00";
			end case;
	end process;
	process (C_S) begin
		case (C_S) is
			when "00" => Out1 <= '0';
			when "01" => Out1 <= '0';
			when "10" => Out1 <= '1';
			when others =>  Out1<= '0';
		end case;
	end process;
		
end behavioral;