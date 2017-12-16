--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:20 12/03/2017
-- Design Name:   
-- Module Name:   C:/Users/Amith/AHD/first_submission/ALU_Unit_tb.vhd
-- Project Name:  first_submission
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_Unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_Unit_tb IS
END ALU_Unit_tb;
 
ARCHITECTURE behavior OF ALU_Unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Unit
    PORT(
         d1 : IN  std_logic_vector(31 downto 0);
         d2 : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(2 downto 0);
         res : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d1 : std_logic_vector(31 downto 0) := (others => '0');
   signal d2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Unit PORT MAP (
          d1 => d1,
          d2 => d2,
          Op => Op,
          res => res
        );

   -- Stimulus process
   stim_proc: process
   begin
			 d1 <= x"00000000";
          d2 <= x"00000000";
			 wait for 5 ns;
			 
			 d1 <= x"00000005";
          d2 <= x"00000002";
			 
          Op <= "000";
			 wait for 5 ns;	
			 
          Op <= "001";
			 wait for 5 ns;	
			 
          Op <= "010";
			 wait for 5 ns;	
			 
          Op <= "011";
			 wait for 5 ns;	
			 
          Op <= "100";			 
			 wait for 5 ns;
			 
          Op <= "101";		
			 wait for 5 ns;
			 
          Op <= "110";				 
			 wait for 1000 ns;			 
   end process;

END;
