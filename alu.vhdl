LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY alu IS
PORT(
	alusel : IN STD_LOGIC_VECTOR( 3 downto 0);
        A: IN std_logic_vector(3 DOWNTO 0);
        B: IN std_logic_vector(3 DOWNTO 0);
        y: OUT std_logic_vector(4 DOWNTO 0)
);
END alu;

ARCHITECTURE behavior OF alu IS

signal a_overflow : std_logic_vector (4 downto 0);
signal b_overflow : std_logic_vector (4 downto 0);

begin

a_overflow <= A(3) & A;
b_overflow <= B(3) & B;

process (A,B,alusel,a_overflow,b_overflow)
begin

CASE alusel(3) IS
	WHEN '0' =>
		Case alusel(2 downto 0) IS
			WHEN "000" =>
				y <= a_overflow  + '1';
			WHEN "001" =>
				y <= a_overflow  - '1';
			WHEN "010" =>
				y <= b_overflow;
			WHEN "011" =>
				y <= b_overflow + '1';	
			WHEN "100"=>
				y <= b_overflow - '1';	
			WHEN "101" =>
			 	y <= a_overflow;
			WHEN "110"=>
				y <= a_overflow + b_overflow;
			WHEN others=>
				y <= a_overflow + a_overflow;
		END CASE;
	WHEN others  =>
		CASE alusel(2 downto 0) IS
			WHEN "000" =>
				y <=  '0' & NOT A;
			WHEN "001" =>
				y <=  '0' & NOT B;
			WHEN "010" =>
				y <=  '0' & (A and B);	
			WHEN "011" =>
				y <=  '0' & (A or B);
			WHEN "100"=>
				y <=  '0' & (A xor B);
			WHEN "101" =>
				y <=  '0' & (A xnor B);
			WHEN "110"=>
				y <=  '0' & (A nand B);
			WHEN  others =>
				y <=  '0' & (A nor B);
		END CASE;

END CASE;
END PROCESS;
END behavior;
