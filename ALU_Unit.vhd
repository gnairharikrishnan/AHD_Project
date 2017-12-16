----------------------------------------------------------------------------------
-- Company: 		New York University
-- Engineer: 		Amith Prabhakar, HariKrishnan G Nair, Harish Puvvada
-- 
-- Create Date:    	22:49:14 11/29/2017 
-- Design Name: 
-- Module Name:    	ALU_unit - Behavioral 
-- Project Name:    AHD final Froject - submission 1.
-- Target Devices: 
-- Tool versions: 
-- Description: 	This block implements the arithmatic and logic unit for the processor. 
-- 					It accepts three inputs, namely input 1 input 2 and the type of 
--					operation to be performed. This block can be used to perform the 
--					following arithmatic operations:
-- 					ADD, SUB, AND, OR, NOR, SHL, SHR.
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_Unit is
	port(
			d1: in std_logic_vector(31 downto 0);
			d2: in std_logic_vector(31 downto 0);
			Op: in std_logic_vector(2 downto 0);
			res: out std_logic_vector(31 downto 0)
		);
end ALU_Unit;

architecture Behavioral of ALU_Unit is
begin

	process (d1, d2, Op) begin
		case Op is
			when "000" => res <= d1 + d2;	-- ADD Operation
			when "001" => res <= d1 - d2;	-- SUB Operation
			when "010" => res <= d1 AND d2;	-- AND Operation
			when "011" => res <= d1 OR d2; 	-- OR  Operation
			when "100" => res <= d1 NOR d2;	-- NOR Operation
			when "101" => 						-- SHL Operation
				case d2 (4 downto 0) is
						when "00000" => res <= d1(31 downto 0);
						when "00001" => res <= d1(30 downto 0) & "0";
						when "00010" => res <= d1(29 downto 0) & "00";
						when "00011" => res <= d1(28 downto 0) & "000";
						when "00100" => res <= d1(27 downto 0) & "0000";
						when "00101" => res <= d1(26 downto 0) & "00000";
						when "00110" => res <= d1(25 downto 0) & "000000";
						when "00111" => res <= d1(24 downto 0) & "0000000";
						when "01000" => res <= d1(23 downto 0) & "00000000";
						when "01001" => res <= d1(22 downto 0) & "000000000";
						when "01010" => res <= d1(21 downto 0) & "0000000000";
						when "01011" => res <= d1(20 downto 0) & "00000000000";
						when "01100" => res <= d1(19 downto 0) & "000000000000";
						when "01101" => res <= d1(18 downto 0) & "0000000000000";
						when "01110" => res <= d1(17 downto 0) & "00000000000000";
						when "01111" => res <= d1(16 downto 0) & "000000000000000";
						when "10000" => res <= d1(15 downto 0) & "0000000000000000";
						when "10001" => res <= d1(14 downto 0) & "00000000000000000";
						when "10010" => res <= d1(13 downto 0) & "000000000000000000";
						when "10011" => res <= d1(12 downto 0) & "0000000000000000000";
						when "10100" => res <= d1(11 downto 0) & "00000000000000000000";
						when "10101" => res <= d1(10 downto 0) & "000000000000000000000";
						when "10110" => res <= d1(9 downto 0) & "0000000000000000000000";
						when "10111" => res <= d1(8 downto 0) & "00000000000000000000000";
						when "11000" => res <= d1(7 downto 0) & "000000000000000000000000";
						when "11001" => res <= d1(6 downto 0) & "0000000000000000000000000";
						when "11010" => res <= d1(5 downto 0) & "00000000000000000000000000";
						when "11011" => res <= d1(4 downto 0) & "000000000000000000000000000";
						when "11100" => res <= d1(3 downto 0) & "0000000000000000000000000000";
						when "11101" => res <= d1(2 downto 0) & "00000000000000000000000000000";
						when "11110" => res <= d1(1 downto 0) & "000000000000000000000000000000";
						when "11111" => res <= d1(0) & "0000000000000000000000000000000";
						when others  => res <= x"00000000";
				end case;
			when "110" => 						-- SHR
				case d2 (4 downto 0) is
					when "00000" => res <= d1(31 downto 0);
					when "00001" => res <= "0" & d1(31 downto 1);
					when "00010" => res <= "00" & d1(31 downto 2);
					when "00011" => res <= "000" & d1(31 downto 3);
					when "00100" => res <= "0000" & d1(31 downto 4);
					when "00101" => res <= "00000" & d1(31 downto 5);
					when "00110" => res <= "000000" & d1(31 downto 6);
					when "00111" => res <= "0000000" & d1(31 downto 7);
					when "01000" => res <= "00000000" & d1(31 downto 8);
					when "01001" => res <= "000000000" & d1(31 downto 9);
					when "01010" => res <= "0000000000" & d1(31 downto 10);
					when "01011" => res <= "00000000000" & d1(31 downto 11);
					when "01100" => res <= "000000000000" & d1(31 downto 12);
					when "01101" => res <= "0000000000000" & d1(31 downto 13);
					when "01110" => res <= "00000000000000" & d1(31 downto 14);
					when "01111" => res <= "000000000000000" & d1(31 downto 15);
					when "10000" => res <= "0000000000000000" & d1(31 downto 16);
					when "10001" => res <= "00000000000000000" & d1(31 downto 17);
					when "10010" => res <= "000000000000000000" & d1(31 downto 18);
					when "10011" => res <= "0000000000000000000" & d1(31 downto 19);
					when "10100" => res <= "00000000000000000000" & d1(31 downto 20);
					when "10101" => res <= "000000000000000000000" & d1(31 downto 21);
					when "10110" => res <= "0000000000000000000000" & d1(31 downto 22);
					when "10111" => res <= "00000000000000000000000" & d1(31 downto 23);
					when "11000" => res <= "000000000000000000000000" & d1(31 downto 24);
					when "11001" => res <= "0000000000000000000000000" & d1(31 downto 25);
					when "11010" => res <= "00000000000000000000000000" & d1(31 downto 26);
					when "11011" => res <= "000000000000000000000000000" & d1(31 downto 27);
					when "11100" => res <= "0000000000000000000000000000" & d1(31 downto 28);
					when "11101" => res <= "00000000000000000000000000000" & d1(31 downto 29);
					when "11110" => res <= "000000000000000000000000000000" & d1(31 downto 30);
					when "11111" => res <= "0000000000000000000000000000000" & d1(31);
					when others =>  res <= x"00000000";
				end case;
			when others => res <= x"00000000";
		end case;
	end process;
end Behavioral;
