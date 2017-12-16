--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:39:58 12/03/2017
-- Design Name:   
-- Module Name:   C:/Users/Amith/AHD/first_submission/Control_Unit_tb.vhd
-- Project Name:  first_submission
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control_unit
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
 
ENTITY Control_Unit_tb IS
END Control_Unit_tb;
 
ARCHITECTURE behavior OF Control_Unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_unit
    PORT(
         inst : IN  std_logic_vector(31 downto 0);
         Eq_bit : IN  std_logic;
         Less_bit : IN  std_logic;
         Load_bit : OUT  std_logic;
         Store_bit : OUT  std_logic;
         IType_bit : OUT  std_logic;
         ALUOp_code : OUT  std_logic_vector(2 downto 0);
         Wrt_bit : OUT  std_logic;
         nextPC : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal inst : std_logic_vector(31 downto 0) := (others => '0');
   signal Eq_bit : std_logic := '0';
   signal Less_bit : std_logic := '0';

 	--Outputs
   signal Load_bit : std_logic;
   signal Store_bit : std_logic;
   signal IType_bit : std_logic;
   signal ALUOp_code : std_logic_vector(2 downto 0);
   signal Wrt_bit : std_logic;
   signal nextPC : std_logic_vector(1 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_unit PORT MAP (
          inst => inst,
          Eq_bit => Eq_bit,
          Less_bit => Less_bit,
          Load_bit => Load_bit,
          Store_bit => Store_bit,
          IType_bit => IType_bit,
          ALUOp_code => ALUOp_code,
          Wrt_bit => Wrt_bit,
          nextPC => nextPC
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5 ns;
		inst <= x"04010002"; --add
		wait for 5 ns;
		inst <= x"00411810"; --addi 
		wait for 5 ns;
		inst <= x"1C620001"; --lw
		wait for 5 ns;
		inst <= x"2805FFFE"; --BEQ
		wait for 5 ns;
		inst <= x"20640002"; --lw
		wait for 1000 ns;
   end process;
END;
