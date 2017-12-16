----------------------------------------------------------------------------------
-- Company: 		New York University
-- Engineer: 		Amith Prabhakar, HariKrishnan G Nair, Harish Puvvada
-- 
-- Create Date:    	22:49:14 11/29/2017 
-- Design Name: 
-- Module Name:    	Control_Unit - Behavioral 
-- Project Name:    AHD final Froject - submission 2.
-- Target Devices: 
-- Tool versions: 
-- Description:This block maps the different type of instructions to the different 
--					types of operations. It acts as a decoder of the instructions to 
--					figure out type of the instruction and the associated data and register 
--					values.
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_unit is
port (
		inst      : in std_logic_vector (31 downto 0);
		Eq_bit    : in std_logic;
		Less_bit  : in std_logic;
		Load_bit  : out std_logic;
		Store_bit : out std_logic;
		IType_bit  : out std_logic;
		ALUOp_code: out std_logic_vector (2 downto 0);
		Wrt_bit   : out std_logic;
		nextPC    : out std_logic_vector (1 downto 0)
		);
	
end Control_unit;

architecture Behavioral of Control_unit is

signal RType_signal : std_logic;
signal Halt_signal  : std_logic;
signal JType_signal : std_logic;
signal Branch_signal: std_logic;
signal Store_signal : std_logic;

begin
	process(inst,Branch_signal,Eq_bit,Less_bit,JType_signal,Halt_signal)		--Next PC
	begin 
		if (inst (31 downto 26) = "001010" and Eq_bit='1') then 
			NextPC <= "10";
		elsif (inst (31 downto 26) = "001001" and Less_bit='1') then 
			NextPC <= "10";
		elsif (inst (31 downto 26) = "001011" and Eq_bit='0' ) then 
			NextPC <= "10";
		elsif (Halt_signal='1') then 
			NextPC <= "11";
		elsif (JType_signal='1') then 
				NextPC <= "01";
		else NextPC <= "00";
		end if;
	end process;

	with inst (31 downto 26) select			 -- ALU
		ALUOp_code	<=	"000" when "000111", -- Load
						"000" when "001000", -- Store
						inst ( 2 downto 0) when "000000", -- R Type
						"000" when "000001", -- ADDI
						"001" when "000010", -- SUBI
						"010" when "000011", -- ANDI
						"011" when "000100", -- ORI
						inst (28 downto 26) when others; -- SHL/R

	with inst (31 downto 26) select			-- Load
		Load_bit	<=	'1' when "000111",
						'0' when others;
			
	with inst (31 downto 26) select			-- Store		
		Store_signal<=	'1' when "001000",
						'0' when others;
					
	Store_bit<= Store_signal;

	with inst (31 downto 26) select			--R Type
		RType_signal<=	'1' when "000000",
						'0' when others;
						
	with inst (31 downto 26) select			--Branch
		Branch_signal<=	'1' when "001001",
						'1' when "001010",
						'1' when "001011",
						'0' when others;

	with inst (31 downto 26) select			--J Type
		JType_signal<=	'1' when "001100",
						'1' when "111111",
						'0' when others;						

	with not(RType_signal) and not (JType_signal) select		--I Type
		IType_bit	<=	'1' when '1',
						'0' when others;
						
	with inst (31 downto 26) select			--HALT
		Halt_signal	<=	'1' when "111111",
						'0' when others;						
			
	with (Branch_signal or Store_signal or JType_signal) select	-- Wrt_bit
		Wrt_bit		<=	'0' when '1',
						'1' when others; 

end Behavioral;