--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:37:57 12/03/2017
-- Design Name:   
-- Module Name:   C:/Users/Amith/AHD/first_submission/DataMem_Unit_tb.vhd
-- Project Name:  first_submission
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMem_Unit
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
 
ENTITY DataMem_Unit_tb IS
END DataMem_Unit_tb;
 
ARCHITECTURE behavior OF DataMem_Unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DataMem_Unit
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         addr: IN  std_logic_vector(31 downto 0);
         wrt_data : IN  std_logic_vector(31 downto 0);
         store		: IN  std_logic;
         chk_mem	: IN  std_logic_vector(6 downto 0);
         encr		: IN  std_logic_vector(31 downto 0);
         disp_mem : OUT  std_logic_vector(31 downto 0);
         read_data: OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal addr : std_logic_vector(31 downto 0) := (others => '0');
   signal wrt_data : std_logic_vector(31 downto 0) := (others => '0');
   signal store : std_logic := '0';
   signal chk_mem : std_logic_vector(6 downto 0) := (others => '0');
   signal encr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal disp_mem : std_logic_vector(31 downto 0);
   signal read_data : std_logic_vector(31 downto 0);

	constant num_cycles : integer := 320;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMem_Unit PORT MAP (
          clk => clk,
          clr => clr,
          addr => addr,
          wrt_data => wrt_data,
          store => store,
          chk_mem => chk_mem,
          encr => encr,
          disp_mem => disp_mem,
          read_data => read_data
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
		clr <= '0';
      wait for 40 ns;
		clr   <= '1';
		store <= '0';
      wait for 80 ns;
		store <= '1';
		addr <= x"00000002";
		wrt_data <= x"00000009";
		wait for 1000 ns;
   end process;

END;
