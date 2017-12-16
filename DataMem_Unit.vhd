----------------------------------------------------------------------------------
-- Company: 		New York University
-- Engineer: 		Amith Prabhakar, HariKrishnan G Nair, Harish Puvvada
-- 
-- Create Date:    	22:49:14 11/29/2017 
-- Design Name: 
-- Module Name:    	DataMem_unit - Behavioral 
-- Project Name:    AHD final Froject - submission 1.
-- Target Devices: 
-- Tool versions: 
-- Description: 	This block implements the Data Memory. When the clear signal is low, the block
-- 					initializes the memory with the default value set out in this document. When clear
-- 					is high, if store is set to 1 the block saves whatever value is present inside 
--					wrt_data to the address specified in the addr input.
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

entity DataMem_Unit is
	port (clk, clr : in std_logic;
			u_sig0,u_sig1,u_sig2,u_sig3,a_sig,b_sig : in std_logic_vector(31 downto 0):=x"00000000";
			addr, wrt_data : in std_logic_vector(31 downto 0);
			store : in std_logic;
			chk_mem : in std_logic_vector(6 downto 0);
			encr	:	in	std_logic_vector(31 downto 0);
			disp_mem, read_data : out std_logic_vector(31 downto 0));
end DataMem_Unit;

architecture Behavioral of DataMem_Unit is

type mem is array (0 to 127) of std_logic_vector(31 downto 0);
signal data_mem : mem;

begin
	
	read_data <= data_mem(conv_integer(addr(6 downto 0)));
	disp_mem <= data_mem(conv_integer(chk_mem));
		
	process (clk) begin
		data_mem(0) <= u_sig3;
		data_mem(1) <= u_sig2;
		data_mem(2) <= u_sig1;
		data_mem(3) <= u_sig0;
		data_mem(36) <= a_sig;
		data_mem(37) <= b_sig;
		data_mem(40) <= encr;
		if (clk'event and clk = '1') then
			if (clr = '0') then
				data_mem <= (x"00000000",x"00000000",x"00000000",x"00000000",-- User key
							x"00000000",x"00000000",x"00000000",x"00000000", -- L array
							x"B7E15163", -- Pw
							x"9E3779B9", -- Qw
							x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",-- skey
							x"00000000",x"00000000", -- A/B
							x"00000000",x"00000000", -- A'/B'
							x"00000000", -- Enc
							others => (others => '0'));
--				data_mem <= (x"00000000",x"00000000",x"00000000",x"00000000",-- User key
--							x"00000000",x"00000000",x"00000000",x"00000000", -- L array
--							x"B7E15163", -- Pw
--							x"9E3779B9", -- Qw
--							x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",x"00000000",-- skey
--							x"00000000",x"00000000", -- A/B
--							x"00000000",x"00000000", -- A'/B'
--							x"00000000", -- Enc
--							others => (others => '0'));							
			elsif (store = '1') then
				data_mem(conv_integer(addr(6 downto 0))) <= wrt_data;
			end if;
		end if;
	end process;
end Behavioral;