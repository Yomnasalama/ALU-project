library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;


entity alu_tb is
end alu_tb;

architecture behavior of alu_tb is
	component alu
	port( 
	alusel : IN STD_LOGIC_VECTOR( 3 downto 0);
        A: IN std_logic_vector(3 DOWNTO 0);
        B: IN std_logic_vector(3 DOWNTO 0);
        y: OUT std_logic_vector(4 DOWNTO 0)
	);
	end component;
	-- inputs
		SIGNAL alusel:  STD_LOGIC_VECTOR(3 DOWNTO 0):=(others=>'0');
		SIGNAL a: STD_LOGIC_VECTOR(3 DOWNTO 0):=(others =>'0');
	 	SIGNAL b: STD_LOGIC_VECTOR(3 DOWNTO 0):=(others =>'0');
	-- outputs
	 	SIGNAL y: STD_LOGIC_VECTOR(4 DOWNTO 0);   

begin
-- unit under test port map
UUT: alu
   port map ( a=> a, b=> b, alusel => alusel, y => y);
stim_proc: process
begin
-- arithmetic unit
alusel(3) <='0';
    alusel(2 downto 0)<="000";
	    a <= "0111";
            b <= "0000";
            wait for 20 ns;
            assert (y="01000")
            report "test failed for input combination" severity error;
    alusel(2 downto 0)<="001";
            a <= "0011";
            b <= "0001";
            wait for 20 ns;
            assert (y= "00010")
            report "test failed for input combination" severity error;
   alusel(2 downto 0)<="010";
            a <= "0000";
            b <= "1001";
            wait for 20 ns;
            assert (y="01001")
            report "test failed for input combination" severity error;
   alusel (2 downto 0)<="011";
            a <= "0011";
            b <= "0111";
            wait for 20 ns;
            assert (y="01000")
            report "test failed for input combination" severity error;
   alusel(2 downto 0)<="100";
            a <= "0010";
            b <= "0000";
            wait for 20 ns;
            assert (y = "01111")
            report "test failed for input combination " severity error;

   alusel (2 downto 0)<="101";
            a <= "1000";
            b <= "0001";
            wait for 20 ns;
	     assert (y = "01000")
            report "test failed for input combination " severity error;
   alusel(2 downto 0)<="110";
            a <= "0111";
            b <= "0111";
            wait for 20 ns;
	     assert (y = "01110")
            report "test failed for input combination " severity error;
   alusel(2 downto 0)<="111";
            a <= "1000";
            b <= "0010";
            wait for 20 ns;
	     assert (y = "10000")
            report "test failed for input combination " severity error;
--logical unit
alusel(3)<='1';
 a <= "0111";
 b <= "0100";
	alusel(2 downto 0)<="000";
            wait for 20 ns;
            assert (y="01000")
            report "test failed for input combination" severity error;
    alusel(2 downto 0)<="001";
            wait for 20 ns;
            assert (y= "01011")
            report "test failed for input combination" severity error;
   alusel(2 downto 0)<="010";
            wait for 20 ns;
            assert (y="00100")
            report "test failed for input combination" severity error;
   alusel (2 downto 0)<="011";
            wait for 20 ns;
            assert (y="00111")
            report "test failed for input combination" severity error;
   alusel(2 downto 0)<="100";
            wait for 20 ns;
            assert (y = "00011")
            report "test failed for input combination " severity error;

   alusel (2 downto 0)<="101";
            wait for 20 ns;
	     assert (y = "01100")
            report "test failed for input combination " severity error;
   alusel(2 downto 0)<="110";
            wait for 20 ns;
	     assert (y = "01011")
            report "test failed for input combination " severity error;
   alusel(2 downto 0)<="111";
            wait for 20 ns;
	     assert (y = "01000")
            report "test failed for input combination " severity error;
wait;
end process;
END;
