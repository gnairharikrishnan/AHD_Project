--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:12:16 12/03/2017
-- Design Name:   
-- Module Name:   C:/Users/Amith/AHD/first_submission/RegFile_Unit_tb.vhd
-- Project Name:  first_submission
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegFile_Unit
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
 
ENTITY RegFile_Unit_tb IS
END RegFile_Unit_tb;
 
ARCHITECTURE behavior OF RegFile_Unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegFile_Unit
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         reg1 : IN  std_logic_vector(4 downto 0);
         reg2 : IN  std_logic_vector(4 downto 0);
         wr_reg : IN  std_logic_vector(4 downto 0);
         data_bit : IN  std_logic_vector(31 downto 0);
         wrt_bit : IN  std_logic;
         reg1_out : OUT  std_logic_vector(31 downto 0);
         reg2_out : OUT  std_logic_vector(31 downto 0);
         check_reg : IN  std_logic_vector(4 downto 0);
         disp_reg : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal reg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal reg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal wr_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal data_bit : std_logic_vector(31 downto 0) := (others => '0');
   signal wrt_bit : std_logic := '0';
   signal check_reg : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal reg1_out : std_logic_vector(31 downto 0);
   signal reg2_out : std_logic_vector(31 downto 0);
   signal disp_reg : std_logic_vector(31 downto 0);

	constant num_cycles : integer := 320;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegFile_Unit PORT MAP (
          clk => clk,
          clr => clr,
          reg1 => reg1,
          reg2 => reg2,
          wr_reg => wr_reg,
          data_bit => data_bit,
          wrt_bit => wrt_bit,
          reg1_out => reg1_out,
          reg2_out => reg2_out,
          check_reg => check_reg,
          disp_reg => disp_reg
        );

	process
	begin
		for i in 1 to num_cycles loop
			clk <= not clk;
			wait for 5 ns;
			clk <= not clk;
			wait for 5 ns;
		end loop;
		wait;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
			wait for 10 ns;
			clr<='1';
			wrt_bit<='0';
         reg1 <= "00001";
         reg2 <= "00010";
         wr_reg<="00101";
         data_bit<=x"0000000A";
			wait for 10 ns;
			wrt_bit<='1'; 
			wait for 10 ns;
			check_reg<="00101";
			wait for 5 ns;
         wr_reg<="00110";
         data_bit<=x"0000000B";			
			wait for 5 ns;
			reg1 <= "00101";
 			reg2 <= "00110";
			wait for 1000 ns;
   end process;

END;
