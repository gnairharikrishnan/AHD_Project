----------------------------------------------------------------------------------
-- Company: 		New York University
-- Engineer: 		Amith Prabhakar, HariKrishnan G Nair, Harish Puvvada
-- 
-- Create Date:    	22:49:14 11/29/2017 
-- Design Name: 
-- Module Name:    	RegFile_Unit - Behavioral 
-- Project Name:    AHD final Froject - submission 1.
-- Target Devices: 
-- Tool versions: 
-- Description: 	This block implements the register file block. When the clear is
-- 					set to zero the block initializeds all register files to zero
--					however if clear is one and wrt_bit is high,  data written into 
-- 					wr_reg is used as index to obtain the required register values
--
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
-- Dependencies: 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegFile_Unit is
	port (	
			clk : in std_logic;
			clr : in std_logic;
			reg1, reg2, wr_reg : in std_logic_vector(4 downto 0);
			data_bit : in std_logic_vector(31 downto 0);
			wrt_bit  : in std_logic;
			reg1_out, reg2_out : out std_logic_vector(31 downto 0);
			check_reg : in std_logic_vector(4 downto 0);
			disp_reg  : out std_logic_vector(31 downto 0)			
			);
end RegFile_Unit;

architecture Behavioral of RegFile_Unit is

type ram is array (0 to 31) of std_logic_vector(31 downto 0); --32 32-bit reg_all
signal reg_all : ram := ram '(others => (others => '0')); --Initiate all to 0

begin
	--displaying all the registers contents
	disp_reg <= reg_all(conv_integer(check_reg));
	
	--contentst of register files is being read
	reg1_out <= reg_all(conv_integer(reg1));
	reg2_out <= reg_all(conv_integer(reg2));
	
	--data_bit to be written to RF if wrt_bit is enabled
	process (clk, clr) begin
		if (clk'event and clk = '1') then
			if (clr = '0') then
				reg_all <= (others => (others => '0'));
			elsif (wrt_bit = '1') then
				reg_all(conv_integer(wr_reg)) <= data_bit;
			end if;
		end if;
	end process;

end Behavioral;