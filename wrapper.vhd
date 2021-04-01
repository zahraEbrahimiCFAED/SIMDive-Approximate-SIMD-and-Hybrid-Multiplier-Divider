-------------------------------------------------------------------------------------
--
-- Create Date: October 2020
-- Design Name: SIMDive Approximate SIMD and Hybrid Multiplier-Divider
-- Description: This general template of SIMDive Approximate SIMD and Hybrid Multiplier-Divider that can be reused for different bit-width
-- Revision: 1
-- Additional Comments:
--    For collaboration and queries regarding furthur optimizations please email the corresponding author: Zahra Ebrahimi (zahra.ebrahimi_mamaghani@tu-dresden.de)
--    In case of usage please cite:
--    Zahra Ebrahimi, Salim Ullah, and Akash Kumar. "SIMDive: Approximate SIMD Soft Multiplier-Divider for FPGAs with Tunable Accuracy." 2020 30th Great Lakes Symposium on VLSI (GLSVLSI) Conference.
--
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;


entity wrapper_file is
  generic (N: integer := 16;
           lgN: integer:= 4 );
  Port (
         input1_i: in STD_LOGIC_VECTOR (N -1 downto 0);
         input2_i: in STD_LOGIC_VECTOR (N -1 downto 0);
         func: in  STD_LOGIC_VECTOR (2 downto 0);
         mode: in STD_LOGIC;
         clk: in STD_LOGIC;
         reset: in STD_LOGIC;
         result_o_hybrid: out STD_LOGIC_VECTOR (2*N -1 downto 0)
  );
end wrapper_file;


architecture Behavioral of wrapper_file is


COMPONENT top_module is

  generic (N: integer ;
           lgN: integer);
  PORT (
             input1_i: in STD_LOGIC_VECTOR   (N -1 downto 0);
             input2_i: in STD_LOGIC_VECTOR    (N -1 downto 0);
             func: in  STD_LOGIC_VECTOR (2 downto 0);
             mode: in STD_LOGIC;
             result_o_hybrid: out STD_LOGIC_VECTOR  (2*N -1 downto 0)
  );
END COMPONENT;


signal input1_i_reg: STD_LOGIC_VECTOR  (N -1 downto 0);
signal input2_i_reg: STD_LOGIC_VECTOR (N -1 downto 0);
signal result_o_hybrid_reg :  STD_LOGIC_VECTOR  (2*N -1 downto 0);
signal func_reg : STD_LOGIC_VECTOR  (2 downto 0);
signal mode_reg : STD_LOGIC ;

begin

process (clk, reset)
begin
if(reset'event and reset = '1') then

input1_i_reg <=  (others => '0');
input2_i_reg  <= (others => '0');

end if;

if(clk'event and clk = '1') then

input1_i_reg <= input1_i;
input2_i_reg <= input2_i;


func_reg <= func;
mode_reg <= mode;
result_o_hybrid <= result_o_hybrid_reg;

end if;
end process;

inst0 : top_module
 --  generic map (  word_size => word_size )
 generic map (N   => N,
             lgN => lgN)
  PORT MAP (
        input1_i   => input1_i_reg,
        input2_i   => input2_i_reg,
        func       => func,
        mode      => mode,
        result_o_hybrid  => result_o_hybrid_reg
  );

end Behavioral;
