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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.VComponents.all;


entity top_wrapper is
generic (word_size: natural := 16);
    Port ( a : in STD_LOGIC_VECTOR (word_size -1 downto 0);
           b : in STD_LOGIC_VECTOR (word_size -1 downto 0);
           prod : out STD_LOGIC_VECTOR (2*word_size -1 downto 0);
           func: in STD_LOGIC_VECTOR(2 downto 0);
           mode: in std_logic;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
    end top_wrapper;

architecture Behavioral of top_wrapper is

component top_module is
    Port ( input1_i : in  STD_LOGIC_VECTOR (15 downto 0);
           input2_i : in  STD_LOGIC_VECTOR (15 downto 0);
           func: in STD_LOGIC_VECTOR(2 downto 0);
           mode: in STD_LOGIC;
           result_o_hybrid: out STD_LOGIC_VECTOR  (32 -1 downto 0));
end component;

signal a_reg : STD_LOGIC_VECTOR (word_size-1 downto 0);
signal b_reg : STD_LOGIC_VECTOR (word_size-1 downto 0);
signal func_reg : STD_LOGIC_VECTOR(2 downto 0);
signal mode_reg : std_logic;

signal prod_reg: STD_LOGIC_VECTOR (word_size * 2 - 1 downto 0);

begin

process (clk, rst)
begin
if(rst'event and rst = '1') then

a_reg <= (others => '0');
b_reg <= (others => '0');
func_reg <= (others => '0');
mode_reg <= '0';
prod  <= (others => '0');
end if;

if(clk'event and clk = '1') then

a_reg <= a;
b_reg <= b;
func_reg <= func;
mode_reg <= mode;
prod <= prod_reg;
end if;
end process;

inst0 : top_module

  PORT MAP (
    input1_i => a_reg,
    input2_i => b_reg,
    func => func_reg,
    mode => mode_reg,
    result_o_hybrid => prod_reg
  );

end Behavioral;
