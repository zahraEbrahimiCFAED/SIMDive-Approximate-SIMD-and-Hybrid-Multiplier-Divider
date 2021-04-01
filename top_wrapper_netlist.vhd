-------------------------------------------------------------------------------------
--
-- Create Date: October 2020
-- Design Name: SIMDive Approximate SIMD and Hybrid Multiplier-Divider
-- Description: This is the synthesized Netlist of the SIMDive Approximate SIMD and Hybrid Multiplier-Divider
-- Revision: 1
-- Additional Comments:
--    For collaboration and queries regarding furthur optimizations please email the corresponding author: Zahra Ebrahimi (zahra.ebrahimi_mamaghani@tu-dresden.de)
--    In case of usage please cite:
--    Zahra Ebrahimi, Salim Ullah, and Akash Kumar. "SIMDive: Approximate SIMD Soft Multiplier-Divider for FPGAs with Tunable Accuracy." 2020 30th Great Lakes Symposium on VLSI (GLSVLSI) Conference.
--
-------------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity add_8_bit is
  port (
    \in\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \b_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    mode_reg_reg : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \func_reg_reg[2]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mode_reg_reg_0 : in STD_LOGIC;
    \func_reg_reg[2]_0\ : in STD_LOGIC;
    mode_reg_reg_1 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mode_reg_reg_2 : in STD_LOGIC;
    \func_reg_reg[2]_1\ : in STD_LOGIC;
    \func_reg_reg[2]_2\ : in STD_LOGIC;
    \b_reg_reg[6]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \b_reg_reg[6]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mode_reg_reg_n_0_repN_2_alias : in STD_LOGIC;
    g0_b2_n_0_alias : in STD_LOGIC;
    \g0_b2__0_n_0_alias\ : in STD_LOGIC;
    \g0_b0__0_n_0_alias\ : in STD_LOGIC;
    g0_b0_n_0_alias : in STD_LOGIC;
    g0_b1_n_0_alias : in STD_LOGIC;
    \prod_reg[11]_1_repN_alias\ : in STD_LOGIC
  );
end add_8_bit;

architecture STRUCTURE of add_8_bit is
  signal \prod[11]_i_19_n_0\ : STD_LOGIC;
  signal \prod[11]_i_20_n_0\ : STD_LOGIC;
  signal \prod[11]_i_21_n_0\ : STD_LOGIC;
  signal \prod[11]_i_22_n_0\ : STD_LOGIC;
  signal \prod_reg[11]_i_6_n_0\ : STD_LOGIC;
  signal result0_carry_i_51_n_0 : STD_LOGIC;
  signal result0_carry_i_54_n_0 : STD_LOGIC;
  signal result0_carry_i_55_n_0 : STD_LOGIC;
  signal result0_carry_i_56_n_0 : STD_LOGIC;
  signal result0_carry_i_57_n_0 : STD_LOGIC;
  signal \NLW_prod_reg[11]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_45_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_result0_carry_i_45_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_result0_carry_i_51_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
\prod[11]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666666666566666"
    )
        port map (
      I0 => DI(3),
      I1 => \func_reg_reg[2]_1\,
      I2 => mode_reg_reg_1(1),
      I3 => \func_reg_reg[2]\(1),
      I4 => mode_reg_reg_n_0_repN_2_alias,
      I5 => \func_reg_reg[2]\(0),
      O => \prod[11]_i_19_n_0\
    );
\prod[11]_i_20_comp\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5B40F0FE1F00F0F"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_2_alias,
      I1 => \func_reg_reg[2]\(2),
      I2 => DI(2),
      I3 => g0_b2_n_0_alias,
      I4 => mode_reg_reg_2,
      I5 => \g0_b2__0_n_0_alias\,
      O => \prod[11]_i_20_n_0\
    );
\prod[11]_i_21_comp\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A5A5656A"
    )
        port map (
      I0 => DI(1),
      I1 => mode_reg_reg_1(0),
      I2 => \func_reg_reg[2]_0\,
      I3 => g0_b1_n_0_alias,
      I4 => \prod_reg[11]_1_repN_alias\,
      O => \prod[11]_i_21_n_0\
    );
\prod[11]_i_22_comp\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5E10F0FB4F00F0F"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_2_alias,
      I1 => \func_reg_reg[2]\(2),
      I2 => DI(0),
      I3 => \g0_b0__0_n_0_alias\,
      I4 => mode_reg_reg,
      I5 => g0_b0_n_0_alias,
      O => \prod[11]_i_22_n_0\
    );
\prod_reg[11]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \prod_reg[11]_i_6_n_0\,
      CO(2 downto 0) => \NLW_prod_reg[11]_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => DI(3 downto 0),
      O(3 downto 0) => \in\(3 downto 0),
      S(3) => \prod[11]_i_19_n_0\,
      S(2) => \prod[11]_i_20_n_0\,
      S(1) => \prod[11]_i_21_n_0\,
      S(0) => \prod[11]_i_22_n_0\
    );
result0_carry_i_45: unisim.vcomponents.CARRY4
     port map (
      CI => result0_carry_i_51_n_0,
      CO(3 downto 1) => NLW_result0_carry_i_45_CO_UNCONNECTED(3 downto 1),
      CO(0) => CO(0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_result0_carry_i_45_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
result0_carry_i_51: unisim.vcomponents.CARRY4
     port map (
      CI => \prod_reg[11]_i_6_n_0\,
      CO(3) => result0_carry_i_51_n_0,
      CO(2 downto 0) => NLW_result0_carry_i_51_CO_UNCONNECTED(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \b_reg_reg[0]\(3 downto 0),
      O(3 downto 0) => \in\(7 downto 4),
      S(3) => result0_carry_i_54_n_0,
      S(2) => result0_carry_i_55_n_0,
      S(1) => result0_carry_i_56_n_0,
      S(0) => result0_carry_i_57_n_0
    );
result0_carry_i_54: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA65AA6A"
    )
        port map (
      I0 => \b_reg_reg[0]\(3),
      I1 => \b_reg_reg[6]\(2),
      I2 => \func_reg_reg[2]\(2),
      I3 => mode_reg_reg_n_0_repN_2_alias,
      I4 => \b_reg_reg[6]_0\(2),
      O => result0_carry_i_54_n_0
    );
result0_carry_i_55: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA65AA6A"
    )
        port map (
      I0 => \b_reg_reg[0]\(2),
      I1 => \b_reg_reg[6]\(1),
      I2 => \func_reg_reg[2]\(2),
      I3 => mode_reg_reg_n_0_repN_2_alias,
      I4 => \b_reg_reg[6]_0\(1),
      O => result0_carry_i_55_n_0
    );
result0_carry_i_56: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA65AA6A"
    )
        port map (
      I0 => \b_reg_reg[0]\(1),
      I1 => \b_reg_reg[6]\(0),
      I2 => \func_reg_reg[2]\(2),
      I3 => mode_reg_reg_n_0_repN_2_alias,
      I4 => \b_reg_reg[6]_0\(0),
      O => result0_carry_i_56_n_0
    );
result0_carry_i_57: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666666666566666"
    )
        port map (
      I0 => \b_reg_reg[0]\(0),
      I1 => \func_reg_reg[2]_2\,
      I2 => mode_reg_reg_1(2),
      I3 => \func_reg_reg[2]\(1),
      I4 => mode_reg_reg_n_0_repN_2_alias,
      I5 => \func_reg_reg[2]\(0),
      O => result0_carry_i_57_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity add_8_bit_0 is
  port (
    \in\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    \func_reg_reg[0]\ : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \b_reg_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \b_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \b_reg_reg[0]\ : in STD_LOGIC;
    \b_reg_reg[9]\ : in STD_LOGIC;
    mode_reg_reg : in STD_LOGIC;
    \b_reg_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \b_reg_reg[6]\ : in STD_LOGIC;
    \func_reg_reg[2]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \b_reg_reg[6]_0\ : in STD_LOGIC;
    \func_reg_reg[0]_0\ : in STD_LOGIC;
    \b_reg_reg[6]_1\ : in STD_LOGIC;
    \b_reg_reg[6]_2\ : in STD_LOGIC;
    \b_reg_reg[6]_3\ : in STD_LOGIC;
    \b_reg_reg[6]_4\ : in STD_LOGIC;
    \b_reg_reg[6]_5\ : in STD_LOGIC;
    \b_reg_reg[6]_6\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of add_8_bit_0 : entity is "add_8_bit";
end add_8_bit_0;

architecture STRUCTURE of add_8_bit_0 is
  signal \result0_carry__0_i_19_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal result0_carry_i_10_n_0 : STD_LOGIC;
  signal result0_carry_i_27_n_0 : STD_LOGIC;
  signal result0_carry_i_28_n_0 : STD_LOGIC;
  signal result0_carry_i_29_n_0 : STD_LOGIC;
  signal result0_carry_i_30_n_0 : STD_LOGIC;
  signal \NLW_result0_carry__0_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_10_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_21_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_result0_carry_i_21_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
\result0_carry__0_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6665666A5565AA6A"
    )
        port map (
      I0 => \b_reg_reg[7]\(0),
      I1 => \b_reg_reg[6]_5\,
      I2 => \func_reg_reg[2]\(0),
      I3 => mode_reg_reg,
      I4 => \b_reg_reg[6]_6\,
      I5 => \func_reg_reg[0]_0\,
      O => \result0_carry__0_i_19_n_0\
    );
\result0_carry__0_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => result0_carry_i_10_n_0,
      CO(3) => \result0_carry__0_i_6_n_0\,
      CO(2 downto 0) => \NLW_result0_carry__0_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \b_reg_reg[7]\(3 downto 0),
      O(3 downto 0) => \in\(7 downto 4),
      S(3 downto 1) => S(2 downto 0),
      S(0) => \result0_carry__0_i_19_n_0\
    );
result0_carry_i_10: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => result0_carry_i_10_n_0,
      CO(2 downto 0) => NLW_result0_carry_i_10_CO_UNCONNECTED(2 downto 0),
      CYINIT => \func_reg_reg[0]\,
      DI(3 downto 0) => DI(3 downto 0),
      O(3 downto 0) => \in\(3 downto 0),
      S(3) => result0_carry_i_27_n_0,
      S(2) => result0_carry_i_28_n_0,
      S(1) => result0_carry_i_29_n_0,
      S(0) => result0_carry_i_30_n_0
    );
result0_carry_i_21: unisim.vcomponents.CARRY4
     port map (
      CI => \result0_carry__0_i_6_n_0\,
      CO(3 downto 1) => NLW_result0_carry_i_21_CO_UNCONNECTED(3 downto 1),
      CO(0) => CO(0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_result0_carry_i_21_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
result0_carry_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6665666A5565AA6A"
    )
        port map (
      I0 => DI(3),
      I1 => \b_reg_reg[6]_3\,
      I2 => \func_reg_reg[2]\(0),
      I3 => mode_reg_reg,
      I4 => \b_reg_reg[6]_4\,
      I5 => \func_reg_reg[0]_0\,
      O => result0_carry_i_27_n_0
    );
result0_carry_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6665666A5565AA6A"
    )
        port map (
      I0 => DI(2),
      I1 => \b_reg_reg[6]_1\,
      I2 => \func_reg_reg[2]\(0),
      I3 => mode_reg_reg,
      I4 => \b_reg_reg[6]_2\,
      I5 => \func_reg_reg[0]_0\,
      O => result0_carry_i_28_n_0
    );
result0_carry_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6665666A5565AA6A"
    )
        port map (
      I0 => DI(1),
      I1 => \b_reg_reg[6]\,
      I2 => \func_reg_reg[2]\(0),
      I3 => mode_reg_reg,
      I4 => \b_reg_reg[6]_0\,
      I5 => \func_reg_reg[0]_0\,
      O => result0_carry_i_29_n_0
    );
result0_carry_i_30: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0CF10C0E"
    )
        port map (
      I0 => \b_reg_reg[1]\(0),
      I1 => \b_reg_reg[0]\,
      I2 => \b_reg_reg[9]\,
      I3 => mode_reg_reg,
      I4 => \b_reg_reg[0]_0\(0),
      O => result0_carry_i_30_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity add_8_bit_1 is
  port (
    \prod_reg[15]\ : out STD_LOGIC;
    \prod_reg[22]\ : out STD_LOGIC;
    \prod_reg[22]_0\ : out STD_LOGIC;
    \prod_reg[22]_1\ : out STD_LOGIC;
    \prod_reg[22]_2\ : out STD_LOGIC;
    \prod_reg[22]_3\ : out STD_LOGIC;
    \prod_reg[15]_0\ : out STD_LOGIC;
    \prod_reg[15]_1\ : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \prod_reg[23]\ : out STD_LOGIC;
    \prod_reg[27]\ : out STD_LOGIC;
    \prod_reg[27]_0\ : out STD_LOGIC;
    \prod_reg[23]_0\ : out STD_LOGIC;
    \prod_reg[15]_2\ : out STD_LOGIC;
    \prod_reg[22]_4\ : out STD_LOGIC;
    \prod_reg[14]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \prod_reg[15]_3\ : out STD_LOGIC;
    \prod_reg[22]_5\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \prod_reg[15]_4\ : out STD_LOGIC;
    \prod_reg[15]_5\ : out STD_LOGIC;
    \prod_reg[11]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \prod_reg[11]_0\ : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \prod_reg[11]_1\ : out STD_LOGIC;
    \prod_reg[11]_2\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \prod_reg[11]_3\ : out STD_LOGIC;
    \prod_reg[11]_4\ : out STD_LOGIC;
    \prod_reg[14]_0\ : out STD_LOGIC;
    \prod_reg[22]_6\ : out STD_LOGIC;
    \prod_reg[22]_7\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \prod_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    \prod_reg[22]_8\ : out STD_LOGIC;
    \prod_reg[22]_9\ : out STD_LOGIC;
    \prod_reg[22]_10\ : out STD_LOGIC;
    \prod_reg[22]_11\ : out STD_LOGIC;
    \prod_reg[22]_12\ : out STD_LOGIC;
    \prod_reg[22]_13\ : out STD_LOGIC;
    \prod_reg[22]_14\ : out STD_LOGIC;
    \prod_reg[22]_15\ : out STD_LOGIC;
    \prod_reg[14]_1\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \prod_reg[14]_2\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mode_reg_reg : in STD_LOGIC;
    mode_reg_reg_0 : in STD_LOGIC;
    mode_reg_reg_1 : in STD_LOGIC;
    \a_reg_reg[4]\ : in STD_LOGIC;
    mode_reg_reg_2 : in STD_LOGIC;
    mode_reg_reg_3 : in STD_LOGIC;
    \a_reg_reg[6]\ : in STD_LOGIC;
    \a_reg_reg[5]\ : in STD_LOGIC;
    \b_reg_reg[15]\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \func_reg_reg[2]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \in\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mode_reg_reg_4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \func_reg_reg[2]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \b_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    mode_reg_reg_n_0_repN_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_1_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_2_alias : in STD_LOGIC;
    \b_reg[10]_repN_alias\ : in STD_LOGIC;
    \b_reg[11]_repN_alias\ : in STD_LOGIC;
    \prod_reg[9]_repN_alias\ : in STD_LOGIC;
    \b_reg[15]_repN_alias\ : in STD_LOGIC;
    \b_reg[13]_repN_alias\ : in STD_LOGIC;
    \b_reg[13]_repN_1_alias\ : in STD_LOGIC;
    mode_reg_reg_n_0_repN_3_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_4_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_5_alias : in STD_LOGIC;
    \prod_reg[23]_0_repN_alias\ : in STD_LOGIC;
    \b_reg[15]_repN_1_alias\ : in STD_LOGIC;
    \b_reg[15]_repN_2_alias\ : in STD_LOGIC;
    g0_b2_n_0_alias : out STD_LOGIC;
    \g0_b2__0_n_0_alias\ : out STD_LOGIC;
    \g0_b0__0_n_0_alias\ : out STD_LOGIC;
    g0_b0_n_0_alias : out STD_LOGIC;
    g0_b1_n_0_alias : out STD_LOGIC;
    \prod_reg[11]_1_repN_alias\ : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of add_8_bit_1 : entity is "add_8_bit";
end add_8_bit_1;

architecture STRUCTURE of add_8_bit_1 is
  signal data2 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal data3 : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \g0_b0__0_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_10_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_11_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_12_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_14_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_15_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_16_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_19_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_22_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_4_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_5_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_6_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_7_n_0\ : STD_LOGIC;
  signal \g0_b0__1_i_9_n_0\ : STD_LOGIC;
  signal g0_b0_i_10_n_0 : STD_LOGIC;
  signal g0_b0_i_11_n_0 : STD_LOGIC;
  signal g0_b0_i_12_n_0 : STD_LOGIC;
  signal g0_b0_i_17_n_0 : STD_LOGIC;
  signal g0_b0_i_22_n_0 : STD_LOGIC;
  signal g0_b0_i_23_n_0 : STD_LOGIC;
  signal g0_b0_i_28_n_0 : STD_LOGIC;
  signal g0_b0_i_2_n_0 : STD_LOGIC;
  signal g0_b0_i_2_n_0_repN : STD_LOGIC;
  signal g0_b0_i_2_n_0_repN_1 : STD_LOGIC;
  signal g0_b0_i_2_n_0_repN_2 : STD_LOGIC;
  signal g0_b0_i_2_n_0_repN_3 : STD_LOGIC;
  signal g0_b0_i_3_n_0 : STD_LOGIC;
  signal g0_b0_i_3_n_0_repN : STD_LOGIC;
  signal g0_b0_i_3_n_0_repN_1 : STD_LOGIC;
  signal g0_b0_i_3_n_0_repN_2 : STD_LOGIC;
  signal g0_b0_i_3_n_0_repN_3 : STD_LOGIC;
  signal g0_b0_i_7_n_0 : STD_LOGIC;
  signal g0_b0_i_9_n_0 : STD_LOGIC;
  signal g0_b0_n_0 : STD_LOGIC;
  signal \g0_b1__0_n_0\ : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal \g0_b2__0_n_0\ : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal \g0_b3__0_n_0\ : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal \g0_b4__0_n_0\ : STD_LOGIC;
  signal g0_b4_n_0 : STD_LOGIC;
  signal \g0_b8__0_n_0\ : STD_LOGIC;
  signal g0_b8_n_0 : STD_LOGIC;
  signal \prod[11]_i_11_n_0\ : STD_LOGIC;
  signal \prod[11]_i_12_n_0\ : STD_LOGIC;
  signal \prod[11]_i_13_n_0\ : STD_LOGIC;
  signal \prod[11]_i_14_n_0\ : STD_LOGIC;
  signal \prod[11]_i_23_n_0\ : STD_LOGIC;
  signal \prod[11]_i_24_n_0\ : STD_LOGIC;
  signal \prod[11]_i_25_n_0\ : STD_LOGIC;
  signal \prod[11]_i_30_n_0\ : STD_LOGIC;
  signal \prod[11]_i_7_n_0\ : STD_LOGIC;
  signal \prod[11]_i_8_n_0\ : STD_LOGIC;
  signal \prod[11]_i_9_n_0\ : STD_LOGIC;
  signal \prod[14]_i_10_n_0\ : STD_LOGIC;
  signal \prod[14]_i_11_n_0\ : STD_LOGIC;
  signal \prod[14]_i_12_n_0\ : STD_LOGIC;
  signal \prod[14]_i_5_n_0\ : STD_LOGIC;
  signal \prod[14]_i_6_n_0\ : STD_LOGIC;
  signal \prod[14]_i_7_n_0\ : STD_LOGIC;
  signal \prod[14]_i_8_n_0\ : STD_LOGIC;
  signal \prod[14]_i_9_n_0\ : STD_LOGIC;
  signal \prod_reg[11]_1_repN\ : STD_LOGIC;
  signal \^prod_reg[11]_2\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \prod_reg[11]_i_4_n_0\ : STD_LOGIC;
  signal \^prod_reg[14]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \prod_reg[14]_i_4_n_0\ : STD_LOGIC;
  signal \^prod_reg[15]\ : STD_LOGIC;
  signal \^prod_reg[15]_0\ : STD_LOGIC;
  signal \^prod_reg[15]_1\ : STD_LOGIC;
  signal \^prod_reg[15]_2\ : STD_LOGIC;
  signal \^prod_reg[15]_3\ : STD_LOGIC;
  signal \^prod_reg[15]_4\ : STD_LOGIC;
  signal \^prod_reg[15]_5\ : STD_LOGIC;
  signal \^prod_reg[22]\ : STD_LOGIC;
  signal \^prod_reg[22]_0\ : STD_LOGIC;
  signal \^prod_reg[22]_1\ : STD_LOGIC;
  signal \^prod_reg[22]_2\ : STD_LOGIC;
  signal \^prod_reg[22]_3\ : STD_LOGIC;
  signal \^prod_reg[22]_4\ : STD_LOGIC;
  signal \^prod_reg[22]_5\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^prod_reg[23]\ : STD_LOGIC;
  signal \^prod_reg[23]_0\ : STD_LOGIC;
  signal \^prod_reg[27]\ : STD_LOGIC;
  signal \prod_reg[27]_0_repN\ : STD_LOGIC;
  signal \prod_reg[27]_0_repN_1\ : STD_LOGIC;
  signal \result0_carry__0_i_25_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_26_n_0\ : STD_LOGIC;
  signal result0_carry_i_41_n_0 : STD_LOGIC;
  signal result0_carry_i_42_n_0 : STD_LOGIC;
  signal result0_carry_i_52_n_0 : STD_LOGIC;
  signal \NLW_prod_reg[11]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_prod_reg[14]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_20_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_result0_carry_i_20_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of g0_b0_i_20_replica : label is "inst0/add_8_inst_3/g0_b0_i_20";
  attribute ORIG_CELL_NAME of g0_b0_i_20_replica_1 : label is "inst0/add_8_inst_3/g0_b0_i_20";
  attribute ORIG_CELL_NAME of g0_b0_i_2_replica : label is "inst0/add_8_inst_3/g0_b0_i_2";
  attribute ORIG_CELL_NAME of g0_b0_i_2_replica_1 : label is "inst0/add_8_inst_3/g0_b0_i_2";
  attribute ORIG_CELL_NAME of g0_b0_i_2_replica_2 : label is "inst0/add_8_inst_3/g0_b0_i_2_replica";
  attribute ORIG_CELL_NAME of g0_b0_i_2_replica_3 : label is "inst0/add_8_inst_3/g0_b0_i_2_replica_2";
  attribute ORIG_CELL_NAME of g0_b0_i_3_replica : label is "inst0/add_8_inst_3/g0_b0_i_3";
  attribute ORIG_CELL_NAME of g0_b0_i_3_replica_1 : label is "inst0/add_8_inst_3/g0_b0_i_3";
  attribute ORIG_CELL_NAME of g0_b0_i_3_replica_2 : label is "inst0/add_8_inst_3/g0_b0_i_3";
  attribute ORIG_CELL_NAME of g0_b0_i_3_replica_3 : label is "inst0/add_8_inst_3/g0_b0_i_3_replica";
begin
  \g0_b0__0_n_0_alias\ <= \g0_b0__0_n_0\;
  g0_b0_n_0_alias <= g0_b0_n_0;
  g0_b1_n_0_alias <= g0_b1_n_0;
  \g0_b2__0_n_0_alias\ <= \g0_b2__0_n_0\;
  g0_b2_n_0_alias <= g0_b2_n_0;
  \prod_reg[11]_1_repN_alias\ <= \prod_reg[11]_1_repN\;
  \prod_reg[11]_2\(1 downto 0) <= \^prod_reg[11]_2\(1 downto 0);
  \prod_reg[14]\(3 downto 0) <= \^prod_reg[14]\(3 downto 0);
  \prod_reg[15]\ <= \^prod_reg[15]\;
  \prod_reg[15]_0\ <= \^prod_reg[15]_0\;
  \prod_reg[15]_1\ <= \^prod_reg[15]_1\;
  \prod_reg[15]_2\ <= \^prod_reg[15]_2\;
  \prod_reg[15]_3\ <= \^prod_reg[15]_3\;
  \prod_reg[15]_4\ <= \^prod_reg[15]_4\;
  \prod_reg[15]_5\ <= \^prod_reg[15]_5\;
  \prod_reg[22]\ <= \^prod_reg[22]\;
  \prod_reg[22]_0\ <= \^prod_reg[22]_0\;
  \prod_reg[22]_1\ <= \^prod_reg[22]_1\;
  \prod_reg[22]_2\ <= \^prod_reg[22]_2\;
  \prod_reg[22]_3\ <= \^prod_reg[22]_3\;
  \prod_reg[22]_4\ <= \^prod_reg[22]_4\;
  \prod_reg[22]_5\(3 downto 0) <= \^prod_reg[22]_5\(3 downto 0);
  \prod_reg[23]\ <= \^prod_reg[23]\;
  \prod_reg[23]_0\ <= \^prod_reg[23]_0\;
  \prod_reg[27]\ <= \^prod_reg[27]\;
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9500008000800183"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => g0_b0_n_0
    );
\g0_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A64BFA7A90D7F0B"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \g0_b0__0_n_0\
    );
\g0_b0__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"361C90F046C98B06"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => data2(0)
    );
\g0_b0__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_3_alias,
      I1 => \g0_b0__1_i_7_n_0\,
      I2 => \^prod_reg[15]_3\,
      I3 => \g0_b0__1_i_9_n_0\,
      O => \^prod_reg[14]\(0)
    );
\g0_b0__1_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F0F310F0F0F3F"
    )
        port map (
      I0 => \b_reg_reg[15]\(2),
      I1 => \b_reg_reg[15]\(3),
      I2 => \b_reg_reg[15]\(5),
      I3 => \b_reg_reg[15]\(6),
      I4 => \b_reg_reg[15]\(7),
      I5 => \b_reg_reg[15]\(1),
      O => \g0_b0__1_i_10_n_0\
    );
\g0_b0__1_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3311331103000311"
    )
        port map (
      I0 => \b_reg_reg[15]\(2),
      I1 => \b_reg_reg[15]\(6),
      I2 => \b_reg_reg[15]\(4),
      I3 => \^prod_reg[15]_5\,
      I4 => \b_reg_reg[15]\(0),
      I5 => \g0_b0__1_i_19_n_0\,
      O => \g0_b0__1_i_11_n_0\
    );
\g0_b0__1_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55475577"
    )
        port map (
      I0 => Q(3),
      I1 => Q(6),
      I2 => Q(5),
      I3 => Q(7),
      I4 => Q(1),
      O => \g0_b0__1_i_12_n_0\
    );
\g0_b0__1_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFECCFFCCFECCFE"
    )
        port map (
      I0 => Q(3),
      I1 => Q(7),
      I2 => Q(5),
      I3 => Q(6),
      I4 => Q(2),
      I5 => Q(1),
      O => \^prod_reg[15]\
    );
\g0_b0__1_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"505F3F3F"
    )
        port map (
      I0 => Q(4),
      I1 => Q(0),
      I2 => \^prod_reg[15]_0\,
      I3 => Q(2),
      I4 => \^prod_reg[15]_1\,
      O => \g0_b0__1_i_14_n_0\
    );
\g0_b0__1_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF03F500FF03F7"
    )
        port map (
      I0 => Q(1),
      I1 => Q(3),
      I2 => Q(6),
      I3 => Q(5),
      I4 => Q(7),
      I5 => Q(2),
      O => \g0_b0__1_i_15_n_0\
    );
\g0_b0__1_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300031133113311"
    )
        port map (
      I0 => Q(2),
      I1 => Q(6),
      I2 => Q(4),
      I3 => \^prod_reg[15]_1\,
      I4 => Q(0),
      I5 => \g0_b0__1_i_22_n_0\,
      O => \g0_b0__1_i_16_n_0\
    );
\g0_b0__1_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000F1"
    )
        port map (
      I0 => \b_reg_reg[15]\(2),
      I1 => \b_reg_reg[15]\(3),
      I2 => \b_reg_reg[15]\(5),
      I3 => \b_reg_reg[15]\(6),
      I4 => \b_reg_reg[15]\(7),
      O => \^prod_reg[15]_4\
    );
\g0_b0__1_i_18\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \b_reg_reg[15]\(7),
      I1 => \b_reg_reg[15]\(5),
      I2 => \b_reg_reg[15]\(6),
      O => \^prod_reg[15]_5\
    );
\g0_b0__1_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABAA"
    )
        port map (
      I0 => \b_reg_reg[15]\(7),
      I1 => \b_reg_reg[15]\(6),
      I2 => \b_reg_reg[15]\(5),
      I3 => \b_reg_reg[15]\(3),
      O => \g0_b0__1_i_19_n_0\
    );
\g0_b0__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_3_alias,
      I1 => \g0_b0__1_i_9_n_0\,
      I2 => \^prod_reg[15]_3\,
      I3 => \g0_b0__1_i_10_n_0\,
      O => \^prod_reg[14]\(1)
    );
\g0_b0__1_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF0FE"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(6),
      I3 => Q(5),
      I4 => Q(7),
      O => \^prod_reg[15]_0\
    );
\g0_b0__1_i_21\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => Q(7),
      I1 => Q(5),
      I2 => Q(6),
      O => \^prod_reg[15]_1\
    );
\g0_b0__1_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5455"
    )
        port map (
      I0 => Q(7),
      I1 => Q(6),
      I2 => Q(5),
      I3 => Q(3),
      O => \g0_b0__1_i_22_n_0\
    );
\g0_b0__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_3_alias,
      I1 => \g0_b0__1_i_10_n_0\,
      I2 => \^prod_reg[15]_3\,
      I3 => \g0_b0__1_i_11_n_0\,
      O => \^prod_reg[14]\(2)
    );
\g0_b0__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => \g0_b0__1_i_12_n_0\,
      I2 => \^prod_reg[15]\,
      I3 => \g0_b0__1_i_14_n_0\,
      O => \g0_b0__1_i_4_n_0\
    );
\g0_b0__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => \g0_b0__1_i_14_n_0\,
      I2 => \^prod_reg[15]\,
      I3 => \g0_b0__1_i_15_n_0\,
      O => \g0_b0__1_i_5_n_0\
    );
\g0_b0__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => \g0_b0__1_i_15_n_0\,
      I2 => \^prod_reg[15]\,
      I3 => \g0_b0__1_i_16_n_0\,
      O => \g0_b0__1_i_6_n_0\
    );
\g0_b0__1_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3333335F"
    )
        port map (
      I0 => \b_reg_reg[15]\(1),
      I1 => \b_reg_reg[15]\(3),
      I2 => \b_reg_reg[15]\(5),
      I3 => \b_reg_reg[15]\(6),
      I4 => \b_reg_reg[15]\(7),
      O => \g0_b0__1_i_7_n_0\
    );
\g0_b0__1_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFF0FFF0FFF0F4"
    )
        port map (
      I0 => \b_reg_reg[15]\(2),
      I1 => \b_reg_reg[15]\(1),
      I2 => \b_reg_reg[15]\(7),
      I3 => \b_reg_reg[15]\(6),
      I4 => \b_reg_reg[15]\(5),
      I5 => \b_reg_reg[15]\(3),
      O => \^prod_reg[15]_3\
    );
\g0_b0__1_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47CC47FF"
    )
        port map (
      I0 => \b_reg_reg[15]\(2),
      I1 => \^prod_reg[15]_4\,
      I2 => \b_reg_reg[15]\(4),
      I3 => \^prod_reg[15]_5\,
      I4 => \b_reg_reg[15]\(0),
      O => \g0_b0__1_i_9_n_0\
    );
\g0_b0__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B259EED62D45B2CA"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => \^prod_reg[11]_2\(0)
    );
g0_b0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_7_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_9_n_0,
      O => \^prod_reg[22]_5\(0)
    );
g0_b0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => \b_reg_reg[15]\(5),
      I1 => \prod_reg[27]_0_repN\,
      I2 => \b_reg_reg[15]\(1),
      I3 => \^prod_reg[27]\,
      I4 => \^prod_reg[23]_0\,
      I5 => g0_b0_i_23_n_0,
      O => g0_b0_i_10_n_0
    );
g0_b0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => \b_reg_reg[15]\(6),
      I1 => \prod_reg[27]_0_repN\,
      I2 => \b_reg_reg[15]\(2),
      I3 => \^prod_reg[27]\,
      I4 => \^prod_reg[23]_0\,
      I5 => g0_b0_i_17_n_0,
      O => g0_b0_i_11_n_0
    );
g0_b0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \a_reg_reg[4]\,
      I1 => \prod_reg[23]_0_repN_alias\,
      I2 => Q(6),
      I3 => mode_reg_reg,
      I4 => Q(2),
      I5 => \prod_reg[9]_repN_alias\,
      O => g0_b0_i_12_n_0
    );
g0_b0_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888F8880000FFFF"
    )
        port map (
      I0 => Q(7),
      I1 => mode_reg_reg,
      I2 => Q(3),
      I3 => \prod_reg[9]_repN_alias\,
      I4 => g0_b0_i_28_n_0,
      I5 => \prod_reg[23]_0_repN_alias\,
      O => \^prod_reg[22]_0\
    );
g0_b0_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \a_reg_reg[5]\,
      I1 => \prod_reg[23]_0_repN_alias\,
      I2 => Q(7),
      I3 => mode_reg_reg,
      I4 => Q(3),
      I5 => \prod_reg[9]_repN_alias\,
      O => \^prod_reg[22]_2\
    );
g0_b0_i_17: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \b_reg_reg[15]\(4),
      I1 => \prod_reg[27]_0_repN\,
      I2 => \b_reg_reg[15]\(8),
      I3 => \^prod_reg[27]\,
      I4 => \b_reg_reg[15]\(0),
      O => g0_b0_i_17_n_0
    );
g0_b0_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAA2220"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => \b_reg[13]_repN_alias\,
      I2 => \b_reg[11]_repN_alias\,
      I3 => \b_reg[10]_repN_alias\,
      I4 => \b_reg_reg[15]\(13),
      I5 => \b_reg[15]_repN_1_alias\,
      O => \^prod_reg[23]_0\
    );
g0_b0_i_19: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => \^prod_reg[15]_2\,
      O => \^prod_reg[27]\
    );
g0_b0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_7_n_0,
      O => g0_b0_i_2_n_0
    );
g0_b0_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => mode_reg_reg_0,
      I1 => \b_reg_reg[15]\(12),
      I2 => \b_reg_reg[15]\(13),
      I3 => \b_reg[15]_repN_alias\,
      O => \prod_reg[27]_0\
    );
g0_b0_i_20_replica: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_4_alias,
      I1 => \b_reg[13]_repN_alias\,
      I2 => \b_reg_reg[15]\(13),
      I3 => \b_reg[15]_repN_1_alias\,
      O => \prod_reg[27]_0_repN\
    );
g0_b0_i_20_replica_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_5_alias,
      I1 => \b_reg[13]_repN_1_alias\,
      I2 => \b_reg_reg[15]\(13),
      I3 => \b_reg[15]_repN_2_alias\,
      O => \prod_reg[27]_0_repN_1\
    );
g0_b0_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF000D"
    )
        port map (
      I0 => \b_reg_reg[15]\(9),
      I1 => \b_reg_reg[15]\(10),
      I2 => \b_reg_reg[15]\(11),
      I3 => \b_reg_reg[15]\(12),
      I4 => \b_reg_reg[15]\(13),
      I5 => \b_reg[15]_repN_1_alias\,
      O => \^prod_reg[15]_2\
    );
g0_b0_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => \b_reg_reg[15]\(5),
      I1 => \^prod_reg[27]\,
      I2 => \prod_reg[27]_0_repN\,
      I3 => \b_reg_reg[15]\(1),
      O => g0_b0_i_22_n_0
    );
g0_b0_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \b_reg_reg[15]\(7),
      I1 => \^prod_reg[27]\,
      I2 => \b_reg_reg[15]\(3),
      I3 => \prod_reg[27]_0_repN\,
      O => g0_b0_i_23_n_0
    );
g0_b0_i_28: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => Q(5),
      I2 => \prod_reg[9]_repN_alias\,
      I3 => Q(1),
      O => g0_b0_i_28_n_0
    );
g0_b0_i_2_replica: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_7_n_0,
      O => g0_b0_i_2_n_0_repN
    );
g0_b0_i_2_replica_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_7_n_0,
      O => g0_b0_i_2_n_0_repN_1
    );
g0_b0_i_2_replica_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_7_n_0,
      O => g0_b0_i_2_n_0_repN_2
    );
g0_b0_i_2_replica_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_7_n_0,
      O => g0_b0_i_2_n_0_repN_3
    );
g0_b0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_11_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_10_n_0,
      O => g0_b0_i_3_n_0
    );
g0_b0_i_3_replica: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_11_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_10_n_0,
      O => g0_b0_i_3_n_0_repN
    );
g0_b0_i_3_replica_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_11_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_10_n_0,
      O => g0_b0_i_3_n_0_repN_1
    );
g0_b0_i_3_replica_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_11_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_10_n_0,
      O => g0_b0_i_3_n_0_repN_2
    );
g0_b0_i_3_replica_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_11_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_10_n_0,
      O => g0_b0_i_3_n_0_repN_3
    );
g0_b0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_12_n_0,
      I1 => mode_reg_reg_1,
      I2 => \^prod_reg[22]_0\,
      O => \^prod_reg[22]\
    );
g0_b0_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^prod_reg[22]_2\,
      I1 => mode_reg_reg_1,
      I2 => g0_b0_i_12_n_0,
      O => \^prod_reg[22]_1\
    );
g0_b0_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \a_reg_reg[6]\,
      I1 => mode_reg_reg_1,
      I2 => \^prod_reg[22]_2\,
      O => \^prod_reg[22]_3\
    );
g0_b0_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => g0_b0_i_17_n_0,
      I1 => \^prod_reg[23]_0\,
      I2 => \b_reg_reg[15]\(6),
      I3 => \^prod_reg[27]\,
      I4 => \b_reg_reg[15]\(2),
      I5 => \prod_reg[27]_0_repN\,
      O => g0_b0_i_7_n_0
    );
g0_b0_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => \^prod_reg[15]_2\,
      O => \^prod_reg[23]\
    );
g0_b0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888F8880000FFFF"
    )
        port map (
      I0 => \b_reg_reg[15]\(7),
      I1 => \^prod_reg[27]\,
      I2 => \b_reg_reg[15]\(3),
      I3 => \prod_reg[27]_0_repN\,
      I4 => g0_b0_i_22_n_0,
      I5 => \^prod_reg[23]_0\,
      O => g0_b0_i_9_n_0
    );
g0_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"155100C1008206D0"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => g0_b1_n_0
    );
g0_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00396D566C3A1460"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_12\
    );
\g0_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F2F110E72481800"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_13\
    );
g0_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00061E32266C7800"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0,
      I2 => g0_b0_i_3_n_0_repN_1,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_10\
    );
\g0_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"221E0E0000307C42"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_11\
    );
g0_b12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000C18100000"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_8\
    );
\g0_b12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1C0000000000003C"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_9\
    );
\g0_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A4D128BDD30E891E"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \g0_b1__0_n_0\
    );
\g0_b1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F4A2401C5AEC698"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => \out\(0)
    );
\g0_b1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"633E1467858AA010"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => data3(1)
    );
g0_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0102021002046983"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => g0_b2_n_0
    );
\g0_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4A11F0731238F80C"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \g0_b2__0_n_0\
    );
\g0_b2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00396D566C3A1460"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => data2(2)
    );
\g0_b2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F2F110E72481800"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => \^prod_reg[11]_2\(1)
    );
g0_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0018127B50013317"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => g0_b3_n_0
    );
\g0_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"26A042B57AFE0544"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \g0_b3__0_n_0\
    );
\g0_b3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00061E32266C7800"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => \out\(1)
    );
\g0_b3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"221E0E0000307C42"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => data3(3)
    );
g0_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"941900C3448C1251"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => g0_b4_n_0
    );
\g0_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2DE0013E2A2CD554"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \g0_b4__0_n_0\
    );
\g0_b4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000C18100000"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => \out\(2)
    );
\g0_b4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1C0000000000003C"
    )
        port map (
      I0 => \^prod_reg[14]\(0),
      I1 => \^prod_reg[14]\(1),
      I2 => \^prod_reg[14]\(2),
      I3 => \g0_b0__1_i_4_n_0\,
      I4 => \g0_b0__1_i_5_n_0\,
      I5 => \g0_b0__1_i_6_n_0\,
      O => data3(4)
    );
g0_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D59211E2008553A7"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_3,
      I2 => g0_b0_i_3_n_0,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[14]_1\(0)
    );
\g0_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"84D4CBAE34E3DD07"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_2,
      I2 => g0_b0_i_3_n_0_repN_2,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[14]_2\(0)
    );
g0_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"43812101050980FC"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[14]_1\(1)
    );
\g0_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E9D00EC736BD3C4E"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0,
      I2 => g0_b0_i_3_n_0_repN_1,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[14]_2\(1)
    );
g0_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7AC1A089940D8254"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0,
      I2 => g0_b0_i_3_n_0_repN_1,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[14]_1\(2)
    );
\g0_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44106E366ED32542"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0,
      I2 => g0_b0_i_3_n_0_repN_1,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[14]_2\(2)
    );
g0_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"361C90F046C98B06"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => g0_b8_n_0
    );
\g0_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B259EED62D45B2CA"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0,
      I2 => g0_b0_i_3_n_0_repN_1,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \g0_b8__0_n_0\
    );
g0_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F4A2401C5AEC698"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0,
      I2 => g0_b0_i_3_n_0_repN_1,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_14\
    );
\g0_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"633E1467858AA010"
    )
        port map (
      I0 => \^prod_reg[22]_5\(0),
      I1 => g0_b0_i_2_n_0_repN_1,
      I2 => g0_b0_i_3_n_0_repN_3,
      I3 => \^prod_reg[22]\,
      I4 => \^prod_reg[22]_1\,
      I5 => \^prod_reg[22]_3\,
      O => \prod_reg[22]_15\
    );
\prod[11]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999999956666666A"
    )
        port map (
      I0 => \prod[11]_i_7_n_0\,
      I1 => \func_reg_reg[2]\(0),
      I2 => \in\(2),
      I3 => \in\(0),
      I4 => \in\(1),
      I5 => \in\(3),
      O => \prod[11]_i_11_n_0\
    );
\prod[11]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9995666A"
    )
        port map (
      I0 => \prod[11]_i_8_n_0\,
      I1 => \func_reg_reg[2]\(0),
      I2 => \in\(1),
      I3 => \in\(0),
      I4 => \in\(2),
      O => \prod[11]_i_12_n_0\
    );
\prod[11]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => \prod[11]_i_9_n_0\,
      I1 => \in\(1),
      I2 => \func_reg_reg[2]\(0),
      I3 => \in\(0),
      O => \prod[11]_i_13_n_0\
    );
\prod[11]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBF044F0"
    )
        port map (
      I0 => \prod[11]_i_24_n_0\,
      I1 => \^prod_reg[15]\,
      I2 => \func_reg_reg[2]_0\(0),
      I3 => mode_reg_reg_0,
      I4 => \b_reg_reg[0]\(0),
      O => \prod[11]_i_14_n_0\
    );
\prod[11]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_2_alias,
      I1 => \prod[11]_i_25_n_0\,
      I2 => \^prod_reg[15]_3\,
      I3 => \g0_b0__1_i_7_n_0\,
      O => \prod_reg[11]\(3)
    );
\prod[11]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000080AAAA0080"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_2_alias,
      I1 => \b_reg_reg[15]\(1),
      I2 => \^prod_reg[15]_5\,
      I3 => \^prod_reg[15]_4\,
      I4 => \^prod_reg[15]_3\,
      I5 => \prod[11]_i_25_n_0\,
      O => \prod_reg[11]\(2)
    );
\prod[11]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A0008000000080"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_2_alias,
      I1 => \b_reg_reg[15]\(0),
      I2 => \^prod_reg[15]_5\,
      I3 => \^prod_reg[15]_4\,
      I4 => \^prod_reg[15]_3\,
      I5 => \b_reg_reg[15]\(1),
      O => \prod_reg[11]\(1)
    );
\prod[11]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_2_alias,
      I1 => \^prod_reg[15]_3\,
      I2 => \b_reg_reg[15]\(0),
      I3 => \^prod_reg[15]_5\,
      I4 => \^prod_reg[15]_4\,
      O => \prod_reg[11]\(0)
    );
\prod[11]_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55475577"
    )
        port map (
      I0 => Q(2),
      I1 => Q(6),
      I2 => Q(5),
      I3 => Q(7),
      I4 => Q(0),
      O => \prod[11]_i_23_n_0\
    );
\prod[11]_i_24\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => Q(0),
      I1 => Q(7),
      I2 => Q(6),
      O => \prod[11]_i_24_n_0\
    );
\prod[11]_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3333335F"
    )
        port map (
      I0 => \b_reg_reg[15]\(0),
      I1 => \b_reg_reg[15]\(2),
      I2 => \b_reg_reg[15]\(5),
      I3 => \b_reg_reg[15]\(6),
      I4 => \b_reg_reg[15]\(7),
      O => \prod[11]_i_25_n_0\
    );
\prod[11]_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFB8B80000B8B8"
    )
        port map (
      I0 => \g0_b3__0_n_0\,
      I1 => \func_reg_reg[2]\(2),
      I2 => g0_b3_n_0,
      I3 => \prod[11]_i_30_n_0\,
      I4 => mode_reg_reg_n_0_repN_2_alias,
      I5 => data3(3),
      O => \prod_reg[11]_4\
    );
\prod[11]_i_27_comp\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001F00FF1F1FFFFF"
    )
        port map (
      I0 => \func_reg_reg[2]\(0),
      I1 => \func_reg_reg[2]\(1),
      I2 => mode_reg_reg_n_0_repN_2_alias,
      I3 => \prod[11]_i_30_n_0\,
      I4 => \^prod_reg[11]_2\(1),
      I5 => data2(2),
      O => \prod_reg[11]_3\
    );
\prod[11]_i_28_comp\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0AAE4EE"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_2_alias,
      I1 => \func_reg_reg[2]\(2),
      I2 => \prod[11]_i_30_n_0\,
      I3 => data3(1),
      I4 => \g0_b1__0_n_0\,
      O => \prod_reg[11]_1\
    );
\prod[11]_i_28_comp_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0FFF0EFE0EFE0"
    )
        port map (
      I0 => \func_reg_reg[2]\(1),
      I1 => \func_reg_reg[2]\(0),
      I2 => mode_reg_reg_n_0_repN_2_alias,
      I3 => \func_reg_reg[2]\(2),
      I4 => \prod[11]_i_30_n_0\,
      I5 => data3(1),
      O => \prod_reg[11]_1_repN\
    );
\prod[11]_i_29_comp\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003700FF3737FFFF"
    )
        port map (
      I0 => \func_reg_reg[2]\(0),
      I1 => mode_reg_reg_n_0_repN_2_alias,
      I2 => \func_reg_reg[2]\(1),
      I3 => \prod[11]_i_30_n_0\,
      I4 => \^prod_reg[11]_2\(0),
      I5 => data2(0),
      O => \prod_reg[11]_0\
    );
\prod[11]_i_30\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \func_reg_reg[2]\(0),
      I1 => mode_reg_reg_n_0_repN_1_alias,
      I2 => \func_reg_reg[2]\(1),
      O => \prod[11]_i_30_n_0\
    );
\prod[11]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => mode_reg_reg_0,
      I1 => \prod[11]_i_23_n_0\,
      I2 => \^prod_reg[15]\,
      I3 => \g0_b0__1_i_12_n_0\,
      O => \prod[11]_i_7_n_0\
    );
\prod[11]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00008000AAAA8000"
    )
        port map (
      I0 => mode_reg_reg_0,
      I1 => \^prod_reg[15]_0\,
      I2 => Q(1),
      I3 => \^prod_reg[15]_1\,
      I4 => \^prod_reg[15]\,
      I5 => \prod[11]_i_23_n_0\,
      O => \prod[11]_i_8_n_0\
    );
\prod[11]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8800800000008000"
    )
        port map (
      I0 => mode_reg_reg_0,
      I1 => \^prod_reg[15]_0\,
      I2 => Q(0),
      I3 => \^prod_reg[15]_1\,
      I4 => \^prod_reg[15]\,
      I5 => Q(1),
      O => \prod[11]_i_9_n_0\
    );
\prod[14]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \in\(4),
      I1 => \in\(2),
      I2 => \in\(0),
      I3 => \in\(1),
      I4 => \in\(3),
      I5 => \in\(5),
      O => \prod[14]_i_10_n_0\
    );
\prod[14]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \in\(3),
      I1 => \in\(1),
      I2 => \in\(0),
      I3 => \in\(2),
      I4 => \in\(4),
      O => \prod[14]_i_11_n_0\
    );
\prod[14]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \in\(2),
      I1 => \in\(0),
      I2 => \in\(1),
      I3 => \in\(3),
      O => \prod[14]_i_12_n_0\
    );
\prod[14]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8F8888"
    )
        port map (
      I0 => Q(0),
      I1 => mode_reg_reg,
      I2 => \g0_b0__1_i_16_n_0\,
      I3 => \^prod_reg[15]\,
      I4 => mode_reg_reg_0,
      O => \prod[14]_i_5_n_0\
    );
\prod[14]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"95996A66"
    )
        port map (
      I0 => \prod[14]_i_5_n_0\,
      I1 => \func_reg_reg[2]\(0),
      I2 => \in\(6),
      I3 => \prod[14]_i_10_n_0\,
      I4 => \in\(7),
      O => \prod[14]_i_6_n_0\
    );
\prod[14]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"59A6"
    )
        port map (
      I0 => \g0_b0__1_i_6_n_0\,
      I1 => \func_reg_reg[2]\(0),
      I2 => \prod[14]_i_10_n_0\,
      I3 => \in\(6),
      O => \prod[14]_i_7_n_0\
    );
\prod[14]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"59A6"
    )
        port map (
      I0 => \g0_b0__1_i_5_n_0\,
      I1 => \func_reg_reg[2]\(0),
      I2 => \prod[14]_i_11_n_0\,
      I3 => \in\(5),
      O => \prod[14]_i_8_n_0\
    );
\prod[14]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"59A6"
    )
        port map (
      I0 => \g0_b0__1_i_4_n_0\,
      I1 => \func_reg_reg[2]\(0),
      I2 => \prod[14]_i_12_n_0\,
      I3 => \in\(4),
      O => \prod[14]_i_9_n_0\
    );
\prod_reg[11]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \prod_reg[11]_i_4_n_0\,
      CO(2 downto 0) => \NLW_prod_reg[11]_i_4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \in\(0),
      DI(3) => \prod[11]_i_7_n_0\,
      DI(2) => \prod[11]_i_8_n_0\,
      DI(1) => \prod[11]_i_9_n_0\,
      DI(0) => mode_reg_reg_4(0),
      O(3 downto 0) => O(3 downto 0),
      S(3) => \prod[11]_i_11_n_0\,
      S(2) => \prod[11]_i_12_n_0\,
      S(1) => \prod[11]_i_13_n_0\,
      S(0) => \prod[11]_i_14_n_0\
    );
\prod_reg[14]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \prod_reg[11]_i_4_n_0\,
      CO(3) => \prod_reg[14]_i_4_n_0\,
      CO(2 downto 0) => \NLW_prod_reg[14]_i_4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \prod[14]_i_5_n_0\,
      DI(2) => \g0_b0__1_i_6_n_0\,
      DI(1) => \g0_b0__1_i_5_n_0\,
      DI(0) => \g0_b0__1_i_4_n_0\,
      O(3 downto 0) => \prod_reg[7]\(3 downto 0),
      S(3) => \prod[14]_i_6_n_0\,
      S(2) => \prod[14]_i_7_n_0\,
      S(1) => \prod[14]_i_8_n_0\,
      S(0) => \prod[14]_i_9_n_0\
    );
\result0_carry__0_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \result0_carry__0_i_25_n_0\,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_11_n_0,
      O => \^prod_reg[22]_5\(3)
    );
\result0_carry__0_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_11_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_10_n_0,
      O => \^prod_reg[22]_5\(2)
    );
\result0_carry__0_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_7_n_0,
      O => \^prod_reg[22]_5\(1)
    );
\result0_carry__0_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \result0_carry__0_i_25_n_0\,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_11_n_0,
      O => S(2)
    );
\result0_carry__0_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_11_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_10_n_0,
      O => S(1)
    );
\result0_carry__0_i_18\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => \^prod_reg[23]\,
      I2 => g0_b0_i_7_n_0,
      O => S(0)
    );
\result0_carry__0_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => \b_reg_reg[15]\(7),
      I1 => \prod_reg[27]_0_repN\,
      I2 => \b_reg_reg[15]\(3),
      I3 => \^prod_reg[27]\,
      I4 => \^prod_reg[23]_0\,
      I5 => \result0_carry__0_i_26_n_0\,
      O => \result0_carry__0_i_25_n_0\
    );
\result0_carry__0_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => \b_reg_reg[15]\(5),
      I1 => \prod_reg[27]_0_repN\,
      I2 => \b_reg_reg[15]\(1),
      I3 => \^prod_reg[27]\,
      O => \result0_carry__0_i_26_n_0\
    );
result0_carry_i_20: unisim.vcomponents.CARRY4
     port map (
      CI => \prod_reg[14]_i_4_n_0\,
      CO(3 downto 1) => NLW_result0_carry_i_20_CO_UNCONNECTED(3 downto 1),
      CO(0) => CO(0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_result0_carry_i_20_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
result0_carry_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8FFF8F0700070F0"
    )
        port map (
      I0 => \func_reg_reg[2]\(0),
      I1 => \func_reg_reg[2]\(1),
      I2 => g0_b8_n_0,
      I3 => mode_reg_reg_n_0_repN_1_alias,
      I4 => \func_reg_reg[2]\(2),
      I5 => \g0_b8__0_n_0\,
      O => \prod_reg[22]_6\
    );
result0_carry_i_23: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => g0_b0_i_9_n_0,
      I1 => \^prod_reg[23]\,
      I2 => result0_carry_i_41_n_0,
      O => DI(3)
    );
result0_carry_i_24: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result0_carry_i_41_n_0,
      I1 => \^prod_reg[23]\,
      I2 => result0_carry_i_42_n_0,
      O => DI(2)
    );
result0_carry_i_25: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBB8B8B8"
    )
        port map (
      I0 => result0_carry_i_42_n_0,
      I1 => \^prod_reg[23]\,
      I2 => \^prod_reg[22]_4\,
      I3 => \b_reg_reg[15]\(2),
      I4 => \^prod_reg[27]\,
      O => DI(1)
    );
result0_carry_i_26: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4544"
    )
        port map (
      I0 => \^prod_reg[15]_2\,
      I1 => \^prod_reg[22]_4\,
      I2 => mode_reg_reg_0,
      I3 => \b_reg_reg[15]\(1),
      O => DI(0)
    );
result0_carry_i_41: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888F8880000FFFF"
    )
        port map (
      I0 => \b_reg_reg[15]\(6),
      I1 => \^prod_reg[27]\,
      I2 => \b_reg_reg[15]\(2),
      I3 => \prod_reg[27]_0_repN_1\,
      I4 => result0_carry_i_52_n_0,
      I5 => \^prod_reg[23]_0\,
      O => result0_carry_i_41_n_0
    );
result0_carry_i_42: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEA00C000C000"
    )
        port map (
      I0 => \b_reg_reg[15]\(5),
      I1 => \prod_reg[27]_0_repN\,
      I2 => \b_reg_reg[15]\(1),
      I3 => \^prod_reg[23]_0\,
      I4 => \b_reg_reg[15]\(3),
      I5 => \^prod_reg[27]\,
      O => result0_carry_i_42_n_0
    );
result0_carry_i_43: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA808080"
    )
        port map (
      I0 => \^prod_reg[23]_0\,
      I1 => \prod_reg[27]_0_repN_1\,
      I2 => \b_reg_reg[15]\(0),
      I3 => \^prod_reg[27]\,
      I4 => \b_reg_reg[15]\(4),
      O => \^prod_reg[22]_4\
    );
result0_carry_i_44: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \func_reg_reg[2]\(0),
      I1 => \func_reg_reg[2]\(1),
      I2 => mode_reg_reg_n_0_repN_1_alias,
      O => \prod_reg[22]_7\
    );
result0_carry_i_52: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => \b_reg_reg[15]\(4),
      I1 => \^prod_reg[27]\,
      I2 => \b_reg_reg[15]\(0),
      I3 => \prod_reg[27]_0_repN_1\,
      O => result0_carry_i_52_n_0
    );
result0_carry_i_53: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8F8888"
    )
        port map (
      I0 => \b_reg_reg[15]\(0),
      I1 => \^prod_reg[27]\,
      I2 => \g0_b0__1_i_11_n_0\,
      I3 => \^prod_reg[15]_3\,
      I4 => mode_reg_reg_n_0_repN_2_alias,
      O => \^prod_reg[14]\(3)
    );
result0_carry_i_58: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFB8B80000B8B8"
    )
        port map (
      I0 => \g0_b4__0_n_0\,
      I1 => \func_reg_reg[2]\(2),
      I2 => g0_b4_n_0,
      I3 => \prod[11]_i_30_n_0\,
      I4 => mode_reg_reg_n_0_repN_1_alias,
      I5 => data3(4),
      O => \prod_reg[14]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity add_8_bit_2 is
  port (
    \prod_reg[20]\ : out STD_LOGIC;
    \prod_reg[23]\ : out STD_LOGIC;
    \prod_reg[15]\ : out STD_LOGIC;
    \prod_reg[9]\ : out STD_LOGIC;
    \prod_reg[23]_0\ : out STD_LOGIC;
    \prod_reg[23]_1\ : out STD_LOGIC;
    \prod_reg[22]\ : out STD_LOGIC;
    \prod_reg[22]_0\ : out STD_LOGIC;
    \prod_reg[22]_1\ : out STD_LOGIC;
    \prod_reg[11]\ : out STD_LOGIC;
    \prod_reg[19]\ : out STD_LOGIC;
    \prod_reg[10]\ : out STD_LOGIC;
    \prod_reg[18]\ : out STD_LOGIC;
    \prod_reg[25]\ : out STD_LOGIC;
    \prod_reg[16]\ : out STD_LOGIC;
    \prod_reg[28]\ : out STD_LOGIC;
    \prod_reg[9]_0\ : out STD_LOGIC;
    \prod_reg[8]\ : out STD_LOGIC;
    \prod_reg[24]\ : out STD_LOGIC;
    \prod_reg[17]\ : out STD_LOGIC;
    \prod_reg[0]\ : out STD_LOGIC;
    \prod_reg[1]\ : out STD_LOGIC;
    \prod_reg[2]\ : out STD_LOGIC;
    \prod_reg[3]\ : out STD_LOGIC;
    \prod_reg[4]\ : out STD_LOGIC;
    \prod_reg[5]\ : out STD_LOGIC;
    \prod_reg[6]\ : out STD_LOGIC;
    \prod_reg[7]\ : out STD_LOGIC;
    \prod_reg[20]_0\ : out STD_LOGIC;
    \prod_reg[21]\ : out STD_LOGIC;
    \prod_reg[22]_2\ : out STD_LOGIC;
    \prod_reg[23]_2\ : out STD_LOGIC;
    \prod_reg[12]\ : out STD_LOGIC;
    \prod_reg[13]\ : out STD_LOGIC;
    \prod_reg[14]\ : out STD_LOGIC;
    \prod_reg[15]_0\ : out STD_LOGIC;
    \prod_reg[26]\ : out STD_LOGIC;
    \prod_reg[27]\ : out STD_LOGIC;
    \prod_reg[28]_0\ : out STD_LOGIC;
    \prod_reg[29]\ : out STD_LOGIC;
    \prod_reg[30]\ : out STD_LOGIC;
    \prod_reg[31]\ : out STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 1 downto 0 );
    mode_reg_reg : in STD_LOGIC;
    \a_reg_reg[7]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \in\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \func_reg_reg[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \func_reg_reg[2]_0\ : in STD_LOGIC;
    mode_reg_reg_0 : in STD_LOGIC;
    \func_reg_reg[2]_1\ : in STD_LOGIC;
    \func_reg_reg[2]_2\ : in STD_LOGIC;
    \func_reg_reg[2]_3\ : in STD_LOGIC;
    \func_reg_reg[2]_4\ : in STD_LOGIC;
    mode_reg_reg_1 : in STD_LOGIC;
    \func_reg_reg[2]_5\ : in STD_LOGIC;
    \func_reg_reg[2]_6\ : in STD_LOGIC;
    \func_reg_reg[2]_7\ : in STD_LOGIC;
    \func_reg_reg[2]_8\ : in STD_LOGIC;
    \func_reg_reg[0]\ : in STD_LOGIC;
    mode_reg_reg_2 : in STD_LOGIC;
    mode_reg_reg_3 : in STD_LOGIC;
    mode_reg_reg_4 : in STD_LOGIC;
    \a_reg_reg[9]\ : in STD_LOGIC;
    \a_reg_reg[15]\ : in STD_LOGIC;
    mode_reg_reg_5 : in STD_LOGIC;
    \func_reg_reg[2]_9\ : in STD_LOGIC;
    mode_reg_reg_6 : in STD_LOGIC;
    \func_reg_reg[1]\ : in STD_LOGIC;
    \b_reg_reg[15]\ : in STD_LOGIC;
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \func_reg_reg[2]_10\ : in STD_LOGIC;
    \func_reg_reg[2]_11\ : in STD_LOGIC;
    \func_reg_reg[2]_12\ : in STD_LOGIC;
    \func_reg_reg[2]_13\ : in STD_LOGIC;
    \b_reg_reg[15]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mode_reg_reg_7 : in STD_LOGIC;
    mode_reg_reg_8 : in STD_LOGIC;
    mode_reg_reg_9 : in STD_LOGIC;
    mode_reg_reg_10 : in STD_LOGIC;
    \a_reg_reg[15]_0\ : in STD_LOGIC;
    \a_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \a_reg_reg[7]_0\ : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \func_reg_reg[2]_14\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \a_reg_reg[6]\ : in STD_LOGIC;
    mode_reg_reg_n_0_repN_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_1_alias : in STD_LOGIC;
    \prod_reg[9]_repN_alias\ : out STD_LOGIC;
    \a_reg[10]_repN_alias\ : in STD_LOGIC;
    \prod_reg[23]_0_repN_alias\ : out STD_LOGIC;
    \a_reg[11]_repN_alias\ : in STD_LOGIC;
    \a_reg[11]_repN_1_alias\ : in STD_LOGIC;
    \prod_reg[28]_repN_alias\ : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of add_8_bit_2 : entity is "add_8_bit";
end add_8_bit_2;

architecture STRUCTURE of add_8_bit_2 is
  signal \add_4_inst_msb/0\ : STD_LOGIC;
  signal out1 : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal \prod[10]_i_2_n_0\ : STD_LOGIC;
  signal \prod[11]_i_2_n_0\ : STD_LOGIC;
  signal \prod[12]_i_2_n_0\ : STD_LOGIC;
  signal \prod[13]_i_2_n_0\ : STD_LOGIC;
  signal \prod[13]_i_4_n_0\ : STD_LOGIC;
  signal \prod[13]_i_5_n_0\ : STD_LOGIC;
  signal \prod[14]_i_2_n_0\ : STD_LOGIC;
  signal \prod[16]_i_2_n_0\ : STD_LOGIC;
  signal \prod[16]_i_3_n_0\ : STD_LOGIC;
  signal \prod[16]_i_4_n_0\ : STD_LOGIC;
  signal \prod[16]_i_5_n_0\ : STD_LOGIC;
  signal \prod[16]_i_6_n_0\ : STD_LOGIC;
  signal \prod[16]_i_7_n_0\ : STD_LOGIC;
  signal \prod[17]_i_2_n_0\ : STD_LOGIC;
  signal \prod[17]_i_3_n_0\ : STD_LOGIC;
  signal \prod[17]_i_4_n_0\ : STD_LOGIC;
  signal \prod[17]_i_5_n_0\ : STD_LOGIC;
  signal \prod[17]_i_6_n_0\ : STD_LOGIC;
  signal \prod[17]_i_7_n_0\ : STD_LOGIC;
  signal \prod[18]_i_2_n_0\ : STD_LOGIC;
  signal \prod[18]_i_3_n_0\ : STD_LOGIC;
  signal \prod[19]_i_2_n_0\ : STD_LOGIC;
  signal \prod[19]_i_3_n_0\ : STD_LOGIC;
  signal \prod[19]_i_4_n_0\ : STD_LOGIC;
  signal \prod[1]_i_2_n_0\ : STD_LOGIC;
  signal \prod[24]_i_2_n_0\ : STD_LOGIC;
  signal \prod[24]_i_3_n_0\ : STD_LOGIC;
  signal \prod[24]_i_4_n_0\ : STD_LOGIC;
  signal \prod[24]_i_5_n_0\ : STD_LOGIC;
  signal \prod[24]_i_6_n_0\ : STD_LOGIC;
  signal \prod[25]_i_3_n_0\ : STD_LOGIC;
  signal \prod[25]_i_4_n_0\ : STD_LOGIC;
  signal \prod[25]_i_6_n_0\ : STD_LOGIC;
  signal \prod[26]_i_2_n_0\ : STD_LOGIC;
  signal \prod[26]_i_3_n_0\ : STD_LOGIC;
  signal \prod[26]_i_5_n_0\ : STD_LOGIC;
  signal \prod[27]_i_10_n_0\ : STD_LOGIC;
  signal \prod[27]_i_11_n_0\ : STD_LOGIC;
  signal \prod[27]_i_13_n_0\ : STD_LOGIC;
  signal \prod[27]_i_14_n_0\ : STD_LOGIC;
  signal \prod[27]_i_16_n_0\ : STD_LOGIC;
  signal \prod[27]_i_2_n_0\ : STD_LOGIC;
  signal \prod[27]_i_3_n_0\ : STD_LOGIC;
  signal \prod[27]_i_4_n_0\ : STD_LOGIC;
  signal \prod[27]_i_5_n_0\ : STD_LOGIC;
  signal \prod[27]_i_6_n_0\ : STD_LOGIC;
  signal \prod[27]_i_7_n_0\ : STD_LOGIC;
  signal \prod[27]_i_8_n_0\ : STD_LOGIC;
  signal \prod[2]_i_2_n_0\ : STD_LOGIC;
  signal \prod[2]_i_3_n_0\ : STD_LOGIC;
  signal \prod[3]_i_2_n_0\ : STD_LOGIC;
  signal \prod[3]_i_4_n_0\ : STD_LOGIC;
  signal \prod[4]_i_2_n_0\ : STD_LOGIC;
  signal \prod[4]_i_3_n_0\ : STD_LOGIC;
  signal \prod[4]_i_5_n_0\ : STD_LOGIC;
  signal \prod[5]_i_2_n_0\ : STD_LOGIC;
  signal \prod[5]_i_3_n_0\ : STD_LOGIC;
  signal \prod[5]_i_5_n_0\ : STD_LOGIC;
  signal \prod[5]_i_7_n_0\ : STD_LOGIC;
  signal \prod[6]_i_2_n_0\ : STD_LOGIC;
  signal \prod[6]_i_3_n_0\ : STD_LOGIC;
  signal \prod[6]_i_5_n_0\ : STD_LOGIC;
  signal \prod[7]_i_10_n_0\ : STD_LOGIC;
  signal \prod[7]_i_11_n_0\ : STD_LOGIC;
  signal \prod[7]_i_2_n_0\ : STD_LOGIC;
  signal \prod[7]_i_3_n_0\ : STD_LOGIC;
  signal \prod[7]_i_4_n_0\ : STD_LOGIC;
  signal \prod[7]_i_6_n_0\ : STD_LOGIC;
  signal \prod[9]_i_10_n_0\ : STD_LOGIC;
  signal \prod[9]_i_3_n_0\ : STD_LOGIC;
  signal \prod[9]_i_6_n_0\ : STD_LOGIC;
  signal \prod[9]_i_7_n_0\ : STD_LOGIC;
  signal \prod[9]_i_8_n_0\ : STD_LOGIC;
  signal \prod[9]_i_9_n_0\ : STD_LOGIC;
  signal \^prod_reg[15]\ : STD_LOGIC;
  signal \^prod_reg[22]\ : STD_LOGIC;
  signal \^prod_reg[22]_0\ : STD_LOGIC;
  signal \^prod_reg[22]_1\ : STD_LOGIC;
  signal \^prod_reg[23]\ : STD_LOGIC;
  signal \^prod_reg[23]_0\ : STD_LOGIC;
  signal \prod_reg[23]_0_repN\ : STD_LOGIC;
  signal \^prod_reg[23]_1\ : STD_LOGIC;
  signal \prod_reg[28]_repN\ : STD_LOGIC;
  signal \^prod_reg[9]\ : STD_LOGIC;
  signal \prod_reg[9]_repN\ : STD_LOGIC;
  signal \result0_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_20_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_21_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_22_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_23_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_24_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \result0_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \result0_carry__0_n_5\ : STD_LOGIC;
  signal \result0_carry__0_n_6\ : STD_LOGIC;
  signal \result0_carry__0_n_7\ : STD_LOGIC;
  signal result0_carry_i_11_n_0 : STD_LOGIC;
  signal result0_carry_i_12_n_0 : STD_LOGIC;
  signal result0_carry_i_13_n_0 : STD_LOGIC;
  signal result0_carry_i_15_n_0 : STD_LOGIC;
  signal result0_carry_i_16_n_0 : STD_LOGIC;
  signal result0_carry_i_17_n_0 : STD_LOGIC;
  signal result0_carry_i_18_n_0 : STD_LOGIC;
  signal result0_carry_i_19_n_0 : STD_LOGIC;
  signal result0_carry_i_1_n_0 : STD_LOGIC;
  signal result0_carry_i_2_n_0 : STD_LOGIC;
  signal result0_carry_i_31_n_0 : STD_LOGIC;
  signal result0_carry_i_32_n_0 : STD_LOGIC;
  signal result0_carry_i_33_n_0 : STD_LOGIC;
  signal result0_carry_i_34_n_0 : STD_LOGIC;
  signal result0_carry_i_35_n_0 : STD_LOGIC;
  signal result0_carry_i_36_n_0 : STD_LOGIC;
  signal result0_carry_i_37_n_0 : STD_LOGIC;
  signal result0_carry_i_38_n_0 : STD_LOGIC;
  signal result0_carry_i_39_n_0 : STD_LOGIC;
  signal result0_carry_i_3_n_0 : STD_LOGIC;
  signal result0_carry_i_40_n_0 : STD_LOGIC;
  signal result0_carry_i_46_n_0 : STD_LOGIC;
  signal result0_carry_i_47_n_0 : STD_LOGIC;
  signal result0_carry_i_48_n_0 : STD_LOGIC;
  signal result0_carry_i_49_n_0 : STD_LOGIC;
  signal result0_carry_i_4_n_0 : STD_LOGIC;
  signal result0_carry_i_50_n_0 : STD_LOGIC;
  signal result0_carry_i_5_n_0 : STD_LOGIC;
  signal result0_carry_i_6_n_0 : STD_LOGIC;
  signal result0_carry_i_7_n_0 : STD_LOGIC;
  signal result0_carry_i_8_n_0 : STD_LOGIC;
  signal result0_carry_i_9_n_0 : STD_LOGIC;
  signal result0_carry_n_0 : STD_LOGIC;
  signal result0_carry_n_4 : STD_LOGIC;
  signal result0_carry_n_5 : STD_LOGIC;
  signal result0_carry_n_6 : STD_LOGIC;
  signal result0_carry_n_7 : STD_LOGIC;
  signal NLW_result0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_result0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_result0_carry__0_i_7_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_result0_carry__0_i_7_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_result0_carry_i_11_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_11_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_16_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_31_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result0_carry_i_31_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of g0_b0_i_25_replica : label is "inst0/add_8_inst_4/g0_b0_i_25";
  attribute ORIG_CELL_NAME of g0_b0_i_27_replica : label is "inst0/add_8_inst_4/g0_b0_i_27";
  attribute ORIG_CELL_NAME of \prod[25]_i_5_replica\ : label is "inst0/add_8_inst_4/prod[25]_i_5";
begin
  \prod_reg[15]\ <= \^prod_reg[15]\;
  \prod_reg[22]\ <= \^prod_reg[22]\;
  \prod_reg[22]_0\ <= \^prod_reg[22]_0\;
  \prod_reg[22]_1\ <= \^prod_reg[22]_1\;
  \prod_reg[23]\ <= \^prod_reg[23]\;
  \prod_reg[23]_0\ <= \^prod_reg[23]_0\;
  \prod_reg[23]_0_repN_alias\ <= \prod_reg[23]_0_repN\;
  \prod_reg[23]_1\ <= \^prod_reg[23]_1\;
  \prod_reg[28]_repN_alias\ <= \prod_reg[28]_repN\;
  \prod_reg[9]_repN_alias\ <= \prod_reg[9]_repN\;
  \prod_reg[28]\ <= 'Z';
  \prod_reg[9]\ <= 'Z';
g0_b0_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_1_alias,
      I1 => \^prod_reg[23]_1\,
      O => \^prod_reg[23]\
    );
g0_b0_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8FFFF88B80000"
    )
        port map (
      I0 => Q(6),
      I1 => \prod_reg[9]_repN\,
      I2 => Q(2),
      I3 => \^prod_reg[15]\,
      I4 => \prod_reg[23]_0_repN\,
      I5 => \^prod_reg[22]_1\,
      O => \^prod_reg[22]_0\
    );
g0_b0_i_24: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => Q(4),
      I1 => \prod_reg[9]_repN\,
      I2 => Q(8),
      I3 => \^prod_reg[15]\,
      I4 => Q(0),
      O => \^prod_reg[22]_1\
    );
g0_b0_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAA00A8"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => Q(11),
      I2 => \a_reg[10]_repN_alias\,
      I3 => Q(12),
      I4 => Q(13),
      I5 => Q(14),
      O => \^prod_reg[23]_0\
    );
g0_b0_i_25_replica: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAA00A8"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => \a_reg[11]_repN_alias\,
      I2 => \a_reg[10]_repN_alias\,
      I3 => Q(12),
      I4 => Q(13),
      I5 => Q(14),
      O => \prod_reg[23]_0_repN\
    );
g0_b0_i_26: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_1_alias,
      I1 => \^prod_reg[23]_1\,
      O => \^prod_reg[15]\
    );
g0_b0_i_27: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => Q(12),
      I2 => Q(13),
      I3 => Q(14),
      O => \^prod_reg[9]\
    );
g0_b0_i_27_replica: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => mode_reg_reg_n_0_repN_alias,
      I1 => Q(12),
      I2 => Q(13),
      I3 => Q(14),
      O => \prod_reg[9]_repN\
    );
g0_b0_i_29: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => Q(5),
      I1 => \prod_reg[9]_repN\,
      I2 => Q(9),
      I3 => \^prod_reg[15]\,
      I4 => Q(1),
      O => \^prod_reg[22]\
    );
\prod[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F444FFF44444444"
    )
        port map (
      I0 => mode_reg_reg_1,
      I1 => \func_reg_reg[2]_5\,
      I2 => \prod[24]_i_2_n_0\,
      I3 => \prod[27]_i_2_n_0\,
      I4 => \prod[16]_i_3_n_0\,
      I5 => \prod[7]_i_4_n_0\,
      O => \prod_reg[0]\
    );
\prod[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \prod[10]_i_2_n_0\,
      I1 => \func_reg_reg[2]_0\,
      I2 => mode_reg_reg_0,
      I3 => \func_reg_reg[2]_2\,
      O => \prod_reg[10]\
    );
\prod[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF757FFFFF"
    )
        port map (
      I0 => \prod[27]_i_3_n_0\,
      I1 => result0_carry_n_6,
      I2 => \prod[27]_i_4_n_0\,
      I3 => result0_carry_n_7,
      I4 => \prod[27]_i_5_n_0\,
      I5 => \prod[27]_i_7_n_0\,
      O => \prod[10]_i_2_n_0\
    );
\prod[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \prod[11]_i_2_n_0\,
      I1 => \func_reg_reg[2]_0\,
      I2 => mode_reg_reg_0,
      I3 => \func_reg_reg[2]_1\,
      O => \prod_reg[11]\
    );
\prod[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF707FFFF"
    )
        port map (
      I0 => \prod[27]_i_4_n_0\,
      I1 => result0_carry_n_7,
      I2 => \prod[27]_i_3_n_0\,
      I3 => \prod[13]_i_5_n_0\,
      I4 => \prod[27]_i_5_n_0\,
      I5 => \prod[27]_i_7_n_0\,
      O => \prod[11]_i_2_n_0\
    );
\prod[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \prod[12]_i_2_n_0\,
      I1 => \func_reg_reg[2]_0\,
      I2 => mode_reg_reg_0,
      I3 => \func_reg_reg[2]_10\,
      O => \prod_reg[12]\
    );
\prod[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222EEE2EFFFFFFFF"
    )
        port map (
      I0 => \prod[24]_i_6_n_0\,
      I1 => \prod[27]_i_3_n_0\,
      I2 => result0_carry_n_5,
      I3 => \prod[27]_i_4_n_0\,
      I4 => result0_carry_n_4,
      I5 => \prod[27]_i_5_n_0\,
      O => \prod[12]_i_2_n_0\
    );
\prod[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \prod[13]_i_2_n_0\,
      I1 => \func_reg_reg[2]_0\,
      I2 => mode_reg_reg_0,
      I3 => \func_reg_reg[2]_11\,
      O => \prod_reg[13]\
    );
\prod[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0AFAFAFCFCFCFCF"
    )
        port map (
      I0 => \prod[13]_i_4_n_0\,
      I1 => \prod[13]_i_5_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[27]_i_4_n_0\,
      I4 => result0_carry_n_7,
      I5 => \prod[27]_i_3_n_0\,
      O => \prod[13]_i_2_n_0\
    );
\prod[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => \result0_carry__0_n_7\,
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => result0_carry_n_4,
      O => \prod[13]_i_4_n_0\
    );
\prod[13]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => result0_carry_n_5,
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => result0_carry_n_6,
      O => \prod[13]_i_5_n_0\
    );
\prod[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \prod[14]_i_2_n_0\,
      I1 => \func_reg_reg[2]_0\,
      I2 => mode_reg_reg_0,
      I3 => \func_reg_reg[2]_12\,
      O => \prod_reg[14]\
    );
\prod[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \prod[24]_i_4_n_0\,
      I1 => \prod[24]_i_5_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[24]_i_6_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      O => \prod[14]_i_2_n_0\
    );
\prod[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4700FFFF47004700"
    )
        port map (
      I0 => \prod[27]_i_6_n_0\,
      I1 => \prod[27]_i_5_n_0\,
      I2 => \prod[19]_i_2_n_0\,
      I3 => \func_reg_reg[2]_0\,
      I4 => mode_reg_reg_0,
      I5 => \func_reg_reg[2]_13\,
      O => \prod_reg[15]_0\
    );
\prod[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABBAA00088808"
    )
        port map (
      I0 => \prod[16]_i_2_n_0\,
      I1 => \prod_reg[28]_repN\,
      I2 => \prod[16]_i_3_n_0\,
      I3 => \prod[27]_i_2_n_0\,
      I4 => \prod[24]_i_2_n_0\,
      I5 => mode_reg_reg,
      O => \prod_reg[16]\
    );
\prod[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => \prod[27]_i_7_n_0\,
      O => \prod[16]_i_2_n_0\
    );
\prod[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[16]_i_4_n_0\,
      I1 => \prod[16]_i_5_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[16]_i_6_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[16]_i_7_n_0\,
      O => \prod[16]_i_3_n_0\
    );
\prod[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => \a_reg_reg[0]\(3),
      I1 => \prod[27]_i_4_n_0\,
      I2 => \a_reg_reg[0]\(2),
      O => \prod[16]_i_4_n_0\
    );
\prod[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => \a_reg_reg[0]\(1),
      I1 => \prod[27]_i_4_n_0\,
      I2 => \a_reg_reg[0]\(0),
      O => \prod[16]_i_5_n_0\
    );
\prod[16]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => O(3),
      I1 => \prod[27]_i_4_n_0\,
      I2 => O(2),
      O => \prod[16]_i_6_n_0\
    );
\prod[16]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => O(1),
      I1 => \prod[27]_i_4_n_0\,
      I2 => O(0),
      O => \prod[16]_i_7_n_0\
    );
\prod[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FC00FC4444F4F4"
    )
        port map (
      I0 => \prod[25]_i_3_n_0\,
      I1 => \prod[17]_i_2_n_0\,
      I2 => \func_reg_reg[2]_0\,
      I3 => \prod[25]_i_4_n_0\,
      I4 => \prod[17]_i_3_n_0\,
      I5 => \prod[27]_i_2_n_0\,
      O => \prod_reg[17]\
    );
\prod[17]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \prod[27]_i_7_n_0\,
      I1 => \func_reg_reg[2]_0\,
      I2 => mode_reg_reg,
      O => \prod[17]_i_2_n_0\
    );
\prod[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[17]_i_4_n_0\,
      I1 => \prod[17]_i_5_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[17]_i_6_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[17]_i_7_n_0\,
      O => \prod[17]_i_3_n_0\
    );
\prod[17]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => result0_carry_n_7,
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => \a_reg_reg[0]\(3),
      O => \prod[17]_i_4_n_0\
    );
\prod[17]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => \a_reg_reg[0]\(2),
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => \a_reg_reg[0]\(1),
      O => \prod[17]_i_5_n_0\
    );
\prod[17]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => \a_reg_reg[0]\(0),
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => O(3),
      O => \prod[17]_i_6_n_0\
    );
\prod[17]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => O(2),
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => O(1),
      O => \prod[17]_i_7_n_0\
    );
\prod[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002022220020"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => \prod[27]_i_7_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[18]_i_2_n_0\,
      I4 => \prod[27]_i_2_n_0\,
      I5 => \prod[18]_i_3_n_0\,
      O => \prod_reg[18]\
    );
\prod[18]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1DFF"
    )
        port map (
      I0 => result0_carry_n_7,
      I1 => \prod[27]_i_4_n_0\,
      I2 => result0_carry_n_6,
      I3 => \prod[27]_i_3_n_0\,
      O => \prod[18]_i_2_n_0\
    );
\prod[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF01F1FFFF01010"
    )
        port map (
      I0 => \prod[27]_i_4_n_0\,
      I1 => \result0_carry__0_n_5\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[24]_i_4_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[24]_i_5_n_0\,
      O => \prod[18]_i_3_n_0\
    );
\prod[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002022220020"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => \prod[27]_i_7_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[19]_i_2_n_0\,
      I4 => \prod[27]_i_2_n_0\,
      I5 => \prod[19]_i_3_n_0\,
      O => \prod_reg[19]\
    );
\prod[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"505F3F3F"
    )
        port map (
      I0 => result0_carry_n_5,
      I1 => result0_carry_n_6,
      I2 => \prod[27]_i_3_n_0\,
      I3 => result0_carry_n_7,
      I4 => \prod[27]_i_4_n_0\,
      O => \prod[19]_i_2_n_0\
    );
\prod[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAEFE0E0EAEFE5E5"
    )
        port map (
      I0 => \prod[27]_i_5_n_0\,
      I1 => \prod[19]_i_4_n_0\,
      I2 => \prod[27]_i_3_n_0\,
      I3 => \result0_carry__0_n_7\,
      I4 => \prod[27]_i_4_n_0\,
      I5 => result0_carry_n_4,
      O => \prod[19]_i_3_n_0\
    );
\prod[19]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => \result0_carry__0_n_5\,
      I1 => \prod[27]_i_4_n_0\,
      I2 => \result0_carry__0_n_6\,
      O => \prod[19]_i_4_n_0\
    );
\prod[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFABEFAAAA"
    )
        port map (
      I0 => \prod[1]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[17]_i_3_n_0\,
      I3 => \prod[25]_i_4_n_0\,
      I4 => \prod[7]_i_4_n_0\,
      I5 => \func_reg_reg[2]_6\,
      O => \prod_reg[1]\
    );
\prod[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[27]_i_5_n_0\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => O(0),
      I4 => \prod[27]_i_3_n_0\,
      O => \prod[1]_i_2_n_0\
    );
\prod[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \prod[12]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[4]_i_2_n_0\,
      O => \prod_reg[20]_0\
    );
\prod[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \prod[13]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[5]_i_2_n_0\,
      O => \prod_reg[21]\
    );
\prod[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"111111111D1D1D11"
    )
        port map (
      I0 => \prod[14]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[27]_i_3_n_0\,
      I3 => \prod[27]_i_4_n_0\,
      I4 => \result0_carry__0_n_5\,
      I5 => \prod[27]_i_5_n_0\,
      O => \prod_reg[22]_2\
    );
\prod[23]_i_1_rewire\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \prod[27]_i_7_n_0\,
      I1 => mode_reg_reg,
      I2 => \func_reg_reg[2]_0\,
      O => \prod_reg[20]\
    );
\prod[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001D001D001D331D"
    )
        port map (
      I0 => \prod[19]_i_2_n_0\,
      I1 => \prod[27]_i_5_n_0\,
      I2 => \prod[27]_i_6_n_0\,
      I3 => \prod[27]_i_2_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[27]_i_4_n_0\,
      O => \prod_reg[23]_2\
    );
\prod[24]_i_1_rewire\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000DC"
    )
        port map (
      I0 => \prod[27]_i_7_n_0\,
      I1 => \func_reg_reg[2]_0\,
      I2 => mode_reg_reg,
      I3 => \prod[24]_i_2_n_0\,
      I4 => \prod[27]_i_2_n_0\,
      O => \prod_reg[24]\
    );
\prod[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[24]_i_3_n_0\,
      I1 => \prod[24]_i_4_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[24]_i_5_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[24]_i_6_n_0\,
      O => \prod[24]_i_2_n_0\
    );
\prod[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \result0_carry__0_n_5\,
      I1 => \prod[27]_i_4_n_0\,
      O => \prod[24]_i_3_n_0\
    );
\prod[24]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => \result0_carry__0_n_6\,
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => \result0_carry__0_n_7\,
      O => \prod[24]_i_4_n_0\
    );
\prod[24]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => result0_carry_n_4,
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => result0_carry_n_5,
      O => \prod[24]_i_5_n_0\
    );
\prod[24]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1441D77D"
    )
        port map (
      I0 => result0_carry_n_6,
      I1 => mode_reg_reg_8,
      I2 => \^prod_reg[23]\,
      I3 => \add_4_inst_msb/0\,
      I4 => result0_carry_n_7,
      O => \prod[24]_i_6_n_0\
    );
\prod[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08080808080808AA"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => \func_reg_reg[2]_0\,
      I2 => \prod[25]_i_3_n_0\,
      I3 => \prod[25]_i_4_n_0\,
      I4 => \prod[27]_i_2_n_0\,
      I5 => \prod_reg[28]_repN\,
      O => \prod_reg[25]\
    );
\prod[25]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \prod[27]_i_3_n_0\,
      I1 => result0_carry_n_7,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \prod[27]_i_5_n_0\,
      O => \prod[25]_i_3_n_0\
    );
\prod[25]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0B5FFFFB0B50000"
    )
        port map (
      I0 => \prod[27]_i_3_n_0\,
      I1 => \result0_carry__0_n_5\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \result0_carry__0_n_6\,
      I4 => \prod[27]_i_5_n_0\,
      I5 => \prod[25]_i_6_n_0\,
      O => \prod[25]_i_4_n_0\
    );
\prod[25]_i_5_replica\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[27]_i_7_n_0\,
      O => \prod_reg[28]_repN\
    );
\prod[25]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAEB0000AA28"
    )
        port map (
      I0 => \prod[13]_i_4_n_0\,
      I1 => \prod[27]_i_11_n_0\,
      I2 => mode_reg_reg_10,
      I3 => \func_reg_reg[2]\(0),
      I4 => \prod[26]_i_5_n_0\,
      I5 => \prod[13]_i_5_n_0\,
      O => \prod[25]_i_6_n_0\
    );
\prod[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \prod[27]_i_2_n_0\,
      I1 => \prod[26]_i_2_n_0\,
      O => \prod_reg[26]\
    );
\prod[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEAEAEAEFE"
    )
        port map (
      I0 => \prod[27]_i_7_n_0\,
      I1 => \prod[26]_i_3_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \result0_carry__0_n_5\,
      I4 => \prod[27]_i_4_n_0\,
      I5 => \prod[27]_i_3_n_0\,
      O => \prod[26]_i_2_n_0\
    );
\prod[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAEB0000AA28"
    )
        port map (
      I0 => \prod[24]_i_4_n_0\,
      I1 => \prod[27]_i_11_n_0\,
      I2 => mode_reg_reg_10,
      I3 => \func_reg_reg[2]\(0),
      I4 => \prod[26]_i_5_n_0\,
      I5 => \prod[24]_i_5_n_0\,
      O => \prod[26]_i_3_n_0\
    );
\prod[26]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000D42B2BD4"
    )
        port map (
      I0 => \^prod_reg[23]\,
      I1 => \add_4_inst_msb/0\,
      I2 => mode_reg_reg_8,
      I3 => mode_reg_reg_9,
      I4 => \^prod_reg[23]_0\,
      I5 => \func_reg_reg[1]\,
      O => \prod[26]_i_5_n_0\
    );
\prod[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000155"
    )
        port map (
      I0 => \prod[27]_i_2_n_0\,
      I1 => \prod[27]_i_3_n_0\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \prod[27]_i_5_n_0\,
      I4 => \prod[27]_i_6_n_0\,
      I5 => \prod[27]_i_7_n_0\,
      O => \prod_reg[27]\
    );
\prod[27]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEAAAAAAA8AAA8"
    )
        port map (
      I0 => \^prod_reg[9]\,
      I1 => \b_reg_reg[15]_0\(2),
      I2 => \b_reg_reg[15]_0\(1),
      I3 => \b_reg_reg[15]_0\(0),
      I4 => mode_reg_reg,
      I5 => \prod[27]_i_14_n_0\,
      O => \prod[27]_i_10_n_0\
    );
\prod[27]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F320"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => \^prod_reg[23]_1\,
      I2 => \add_4_inst_msb/0\,
      I3 => mode_reg_reg_8,
      O => \prod[27]_i_11_n_0\
    );
\prod[27]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => mode_reg_reg_8,
      I1 => \add_4_inst_msb/0\,
      I2 => \^prod_reg[23]\,
      O => \prod[27]_i_13_n_0\
    );
\prod[27]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF320F3200000"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => \^prod_reg[23]_1\,
      I2 => \add_4_inst_msb/0\,
      I3 => mode_reg_reg_8,
      I4 => \^prod_reg[23]_0\,
      I5 => mode_reg_reg_9,
      O => \prod[27]_i_14_n_0\
    );
\prod[27]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFC0FCC0FC4054"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => mode_reg_reg_8,
      I2 => \add_4_inst_msb/0\,
      I3 => \^prod_reg[23]\,
      I4 => \a_reg_reg[15]_0\,
      I5 => mode_reg_reg_9,
      O => \prod[27]_i_16_n_0\
    );
\prod[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"660C6666660C0C0C"
    )
        port map (
      I0 => \prod[27]_i_8_n_0\,
      I1 => mode_reg_reg_6,
      I2 => \prod[27]_i_10_n_0\,
      I3 => \func_reg_reg[2]\(0),
      I4 => mode_reg_reg,
      I5 => \func_reg_reg[2]\(1),
      O => \prod[27]_i_2_n_0\
    );
\prod[27]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0EEEED0DDE0E0DD"
    )
        port map (
      I0 => \prod[27]_i_11_n_0\,
      I1 => \func_reg_reg[2]\(0),
      I2 => \func_reg_reg[1]\,
      I3 => \^prod_reg[23]_0\,
      I4 => mode_reg_reg_9,
      I5 => \prod[27]_i_13_n_0\,
      O => \prod[27]_i_3_n_0\
    );
\prod[27]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => mode_reg_reg_8,
      I1 => \^prod_reg[23]\,
      I2 => \add_4_inst_msb/0\,
      O => \prod[27]_i_4_n_0\
    );
\prod[27]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0351FFAAFF5503A2"
    )
        port map (
      I0 => \prod[27]_i_14_n_0\,
      I1 => \func_reg_reg[2]\(1),
      I2 => mode_reg_reg,
      I3 => \func_reg_reg[2]\(0),
      I4 => mode_reg_reg_7,
      I5 => \prod[27]_i_16_n_0\,
      O => \prod[27]_i_5_n_0\
    );
\prod[27]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505F3030505F3F3F"
    )
        port map (
      I0 => \result0_carry__0_n_5\,
      I1 => \result0_carry__0_n_6\,
      I2 => \prod[27]_i_3_n_0\,
      I3 => \result0_carry__0_n_7\,
      I4 => \prod[27]_i_4_n_0\,
      I5 => result0_carry_n_4,
      O => \prod[27]_i_6_n_0\
    );
\prod[27]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFAFABA"
    )
        port map (
      I0 => \a_reg_reg[9]\,
      I1 => mode_reg_reg,
      I2 => \prod[27]_i_16_n_0\,
      I3 => \a_reg_reg[15]\,
      I4 => mode_reg_reg_5,
      I5 => \func_reg_reg[2]_9\,
      O => \prod[27]_i_7_n_0\
    );
\prod[27]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCF4444444C"
    )
        port map (
      I0 => mode_reg_reg,
      I1 => \prod[27]_i_16_n_0\,
      I2 => Q(12),
      I3 => Q(13),
      I4 => Q(14),
      I5 => mode_reg_reg_5,
      O => \prod[27]_i_8_n_0\
    );
\prod[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \prod[27]_i_2_n_0\,
      I1 => \prod[4]_i_2_n_0\,
      O => \prod_reg[28]_0\
    );
\prod[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010551044"
    )
        port map (
      I0 => \prod[27]_i_2_n_0\,
      I1 => \prod[27]_i_3_n_0\,
      I2 => \result0_carry__0_n_5\,
      I3 => \prod[27]_i_4_n_0\,
      I4 => \result0_carry__0_n_6\,
      I5 => \prod[27]_i_5_n_0\,
      O => \prod_reg[29]\
    );
\prod[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAEEEAE"
    )
        port map (
      I0 => \prod[2]_i_2_n_0\,
      I1 => \prod[7]_i_4_n_0\,
      I2 => \prod[2]_i_3_n_0\,
      I3 => \prod[27]_i_2_n_0\,
      I4 => \prod[18]_i_3_n_0\,
      I5 => \func_reg_reg[2]_7\,
      O => \prod_reg[2]\
    );
\prod[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880008000000000"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[27]_i_5_n_0\,
      I2 => O(0),
      I3 => \prod[27]_i_4_n_0\,
      I4 => O(1),
      I5 => \prod[27]_i_3_n_0\,
      O => \prod[2]_i_2_n_0\
    );
\prod[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[24]_i_6_n_0\,
      I1 => \prod[16]_i_4_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[16]_i_5_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[16]_i_6_n_0\,
      O => \prod[2]_i_3_n_0\
    );
\prod[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001110"
    )
        port map (
      I0 => \prod[27]_i_2_n_0\,
      I1 => \prod[27]_i_3_n_0\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \result0_carry__0_n_5\,
      I4 => \prod[27]_i_5_n_0\,
      O => \prod_reg[30]\
    );
\prod[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \prod[27]_i_2_n_0\,
      I1 => \prod[27]_i_3_n_0\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \prod[27]_i_5_n_0\,
      O => \prod_reg[31]\
    );
\prod[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4700"
    )
        port map (
      I0 => \prod[19]_i_3_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[3]_i_2_n_0\,
      I3 => \prod[7]_i_4_n_0\,
      I4 => \func_reg_reg[2]_8\,
      I5 => \prod[3]_i_4_n_0\,
      O => \prod_reg[3]\
    );
\prod[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[13]_i_5_n_0\,
      I1 => \prod[17]_i_4_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[17]_i_5_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[17]_i_6_n_0\,
      O => \prod[3]_i_2_n_0\
    );
\prod[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0888080008000800"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[27]_i_5_n_0\,
      I2 => \prod[17]_i_7_n_0\,
      I3 => \prod[27]_i_3_n_0\,
      I4 => O(0),
      I5 => \prod[27]_i_4_n_0\,
      O => \prod[3]_i_4_n_0\
    );
\prod[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4700"
    )
        port map (
      I0 => \prod[4]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[4]_i_3_n_0\,
      I3 => \prod[7]_i_4_n_0\,
      I4 => \func_reg_reg[0]\,
      I5 => \prod[4]_i_5_n_0\,
      O => \prod_reg[4]\
    );
\prod[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAABFBAFAFABFB"
    )
        port map (
      I0 => \prod[27]_i_5_n_0\,
      I1 => \result0_carry__0_n_7\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \result0_carry__0_n_6\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \result0_carry__0_n_5\,
      O => \prod[4]_i_2_n_0\
    );
\prod[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[24]_i_5_n_0\,
      I1 => \prod[24]_i_6_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[16]_i_4_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[16]_i_5_n_0\,
      O => \prod[4]_i_3_n_0\
    );
\prod[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000888"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[27]_i_5_n_0\,
      I2 => \prod[16]_i_6_n_0\,
      I3 => \prod[27]_i_3_n_0\,
      I4 => \prod[16]_i_7_n_0\,
      O => \prod[4]_i_5_n_0\
    );
\prod[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4700"
    )
        port map (
      I0 => \prod[5]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[5]_i_3_n_0\,
      I3 => \prod[7]_i_4_n_0\,
      I4 => mode_reg_reg_2,
      I5 => \prod[5]_i_5_n_0\,
      O => \prod_reg[5]\
    );
\prod[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FAFAABFB"
    )
        port map (
      I0 => \prod[27]_i_5_n_0\,
      I1 => \result0_carry__0_n_6\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \result0_carry__0_n_5\,
      I4 => \prod[27]_i_3_n_0\,
      O => \prod[5]_i_2_n_0\
    );
\prod[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[13]_i_4_n_0\,
      I1 => \prod[13]_i_5_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[17]_i_4_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[17]_i_5_n_0\,
      O => \prod[5]_i_3_n_0\
    );
\prod[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000822088808AA08"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[27]_i_3_n_0\,
      I2 => \prod[5]_i_7_n_0\,
      I3 => \prod[27]_i_5_n_0\,
      I4 => \prod[17]_i_7_n_0\,
      I5 => \prod[17]_i_6_n_0\,
      O => \prod[5]_i_5_n_0\
    );
\prod[5]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D77D"
    )
        port map (
      I0 => O(0),
      I1 => \add_4_inst_msb/0\,
      I2 => \^prod_reg[23]\,
      I3 => mode_reg_reg_8,
      O => \prod[5]_i_7_n_0\
    );
\prod[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4700"
    )
        port map (
      I0 => \prod[6]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[6]_i_3_n_0\,
      I3 => \prod[7]_i_4_n_0\,
      I4 => mode_reg_reg_3,
      I5 => \prod[6]_i_5_n_0\,
      O => \prod_reg[6]\
    );
\prod[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAB"
    )
        port map (
      I0 => \prod[27]_i_5_n_0\,
      I1 => \result0_carry__0_n_5\,
      I2 => \prod[27]_i_4_n_0\,
      I3 => \prod[27]_i_3_n_0\,
      O => \prod[6]_i_2_n_0\
    );
\prod[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[24]_i_4_n_0\,
      I1 => \prod[24]_i_5_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[24]_i_6_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[16]_i_4_n_0\,
      O => \prod[6]_i_3_n_0\
    );
\prod[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000822088808AA08"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[27]_i_3_n_0\,
      I2 => \prod[16]_i_7_n_0\,
      I3 => \prod[27]_i_5_n_0\,
      I4 => \prod[16]_i_6_n_0\,
      I5 => \prod[16]_i_5_n_0\,
      O => \prod[6]_i_5_n_0\
    );
\prod[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4700"
    )
        port map (
      I0 => \prod[7]_i_2_n_0\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[7]_i_3_n_0\,
      I3 => \prod[7]_i_4_n_0\,
      I4 => mode_reg_reg_4,
      I5 => \prod[7]_i_6_n_0\,
      O => \prod_reg[7]\
    );
\prod[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0050FF5FFF3FFF3F"
    )
        port map (
      I0 => O(2),
      I1 => O(1),
      I2 => \prod[7]_i_11_n_0\,
      I3 => \prod[26]_i_5_n_0\,
      I4 => O(0),
      I5 => \prod[27]_i_4_n_0\,
      O => \prod[7]_i_10_n_0\
    );
\prod[7]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBEEBBEEBEEEEE"
    )
        port map (
      I0 => \func_reg_reg[2]\(0),
      I1 => mode_reg_reg_10,
      I2 => mode_reg_reg,
      I3 => \^prod_reg[23]_1\,
      I4 => \add_4_inst_msb/0\,
      I5 => mode_reg_reg_8,
      O => \prod[7]_i_11_n_0\
    );
\prod[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \prod[27]_i_5_n_0\,
      I1 => \prod[27]_i_4_n_0\,
      I2 => \prod[27]_i_3_n_0\,
      O => \prod[7]_i_2_n_0\
    );
\prod[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \prod[19]_i_4_n_0\,
      I1 => \prod[13]_i_4_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[13]_i_5_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[17]_i_4_n_0\,
      O => \prod[7]_i_3_n_0\
    );
\prod[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \prod[27]_i_7_n_0\,
      I1 => mode_reg_reg,
      I2 => \func_reg_reg[2]_0\,
      O => \prod[7]_i_4_n_0\
    );
\prod[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020202A2A2A202A2"
    )
        port map (
      I0 => \func_reg_reg[2]_0\,
      I1 => \prod[7]_i_10_n_0\,
      I2 => \prod[27]_i_5_n_0\,
      I3 => \prod[17]_i_6_n_0\,
      I4 => \prod[27]_i_3_n_0\,
      I5 => \prod[17]_i_5_n_0\,
      O => \prod[7]_i_6_n_0\
    );
\prod[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABFFABABAAAAAAAA"
    )
        port map (
      I0 => \func_reg_reg[2]_4\,
      I1 => \prod[24]_i_2_n_0\,
      I2 => \prod[27]_i_2_n_0\,
      I3 => \prod[16]_i_3_n_0\,
      I4 => \prod_reg[28]_repN\,
      I5 => \prod[16]_i_2_n_0\,
      O => \prod_reg[8]\
    );
\prod[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABFFABAAAAAAAA"
    )
        port map (
      I0 => \func_reg_reg[2]_3\,
      I1 => \prod[27]_i_2_n_0\,
      I2 => \prod[25]_i_4_n_0\,
      I3 => \prod_reg[28]_repN\,
      I4 => \prod[9]_i_3_n_0\,
      I5 => \prod[16]_i_2_n_0\,
      O => \prod_reg[9]_0\
    );
\prod[9]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEBFAFBAAEBAFEF"
    )
        port map (
      I0 => \prod[5]_i_7_n_0\,
      I1 => \prod[27]_i_13_n_0\,
      I2 => mode_reg_reg_10,
      I3 => \func_reg_reg[1]\,
      I4 => \func_reg_reg[2]\(0),
      I5 => \prod[27]_i_11_n_0\,
      O => \prod[9]_i_10_n_0\
    );
\prod[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAF00A0FFCFFFCF"
    )
        port map (
      I0 => \prod[9]_i_6_n_0\,
      I1 => \prod[9]_i_7_n_0\,
      I2 => \prod[9]_i_8_n_0\,
      I3 => \prod[9]_i_9_n_0\,
      I4 => \prod[9]_i_10_n_0\,
      I5 => \prod[27]_i_5_n_0\,
      O => \prod[9]_i_3_n_0\
    );
\prod[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAEB0000AA28"
    )
        port map (
      I0 => \prod[17]_i_4_n_0\,
      I1 => \prod[27]_i_11_n_0\,
      I2 => mode_reg_reg_10,
      I3 => \func_reg_reg[2]\(0),
      I4 => \prod[26]_i_5_n_0\,
      I5 => \prod[17]_i_5_n_0\,
      O => \prod[9]_i_6_n_0\
    );
\prod[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAEB0000AA28"
    )
        port map (
      I0 => \prod[17]_i_6_n_0\,
      I1 => \prod[27]_i_11_n_0\,
      I2 => mode_reg_reg_10,
      I3 => \func_reg_reg[2]\(0),
      I4 => \prod[26]_i_5_n_0\,
      I5 => \prod[17]_i_7_n_0\,
      O => \prod[9]_i_7_n_0\
    );
\prod[9]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF1707E8F8"
    )
        port map (
      I0 => mode_reg_reg_5,
      I1 => \a_reg_reg[15]\,
      I2 => \prod[27]_i_16_n_0\,
      I3 => mode_reg_reg,
      I4 => mode_reg_reg_6,
      I5 => \func_reg_reg[1]\,
      O => \prod[9]_i_8_n_0\
    );
\prod[9]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A880808AAAAAAAA"
    )
        port map (
      I0 => \func_reg_reg[1]\,
      I1 => \^prod_reg[9]\,
      I2 => \b_reg_reg[15]\,
      I3 => mode_reg_reg,
      I4 => \prod[27]_i_14_n_0\,
      I5 => mode_reg_reg_6,
      O => \prod[9]_i_9_n_0\
    );
result0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => result0_carry_n_0,
      CO(2 downto 0) => NLW_result0_carry_CO_UNCONNECTED(2 downto 0),
      CYINIT => result0_carry_i_1_n_0,
      DI(3) => result0_carry_i_2_n_0,
      DI(2) => result0_carry_i_3_n_0,
      DI(1) => result0_carry_i_4_n_0,
      DI(0) => result0_carry_i_5_n_0,
      O(3) => result0_carry_n_4,
      O(2) => result0_carry_n_5,
      O(1) => result0_carry_n_6,
      O(0) => result0_carry_n_7,
      S(3) => result0_carry_i_6_n_0,
      S(2) => result0_carry_i_7_n_0,
      S(1) => result0_carry_i_8_n_0,
      S(0) => result0_carry_i_9_n_0
    );
\result0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => result0_carry_n_0,
      CO(3 downto 0) => \NLW_result0_carry__0_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \result0_carry__0_i_1_n_0\,
      DI(1 downto 0) => DI(1 downto 0),
      O(3) => \add_4_inst_msb/0\,
      O(2) => \result0_carry__0_n_5\,
      O(1) => \result0_carry__0_n_6\,
      O(0) => \result0_carry__0_n_7\,
      S(3) => \result0_carry__0_i_2_n_0\,
      S(2) => \result0_carry__0_i_3_n_0\,
      S(1) => \result0_carry__0_i_4_n_0\,
      S(0) => \result0_carry__0_i_5_n_0\
    );
\result0_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^prod_reg[22]_0\,
      I1 => \^prod_reg[23]\,
      I2 => \a_reg_reg[7]_0\,
      O => \result0_carry__0_i_1_n_0\
    );
\result0_carry__0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD0DFDF2F202020"
    )
        port map (
      I0 => \func_reg_reg[2]\(0),
      I1 => \result0_carry__0_i_23_n_0\,
      I2 => mode_reg_reg,
      I3 => out1(14),
      I4 => \func_reg_reg[2]\(1),
      I5 => \in\(14),
      O => \result0_carry__0_i_10_n_0\
    );
\result0_carry__0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000001FFFFFFFF"
    )
        port map (
      I0 => \in\(12),
      I1 => \in\(10),
      I2 => \in\(8),
      I3 => \in\(9),
      I4 => \in\(11),
      I5 => \func_reg_reg[2]\(0),
      O => \result0_carry__0_i_11_n_0\
    );
\result0_carry__0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"666666666666666A"
    )
        port map (
      I0 => \in\(12),
      I1 => \func_reg_reg[2]\(0),
      I2 => \in\(10),
      I3 => \in\(8),
      I4 => \in\(9),
      I5 => \in\(11),
      O => \result0_carry__0_i_12_n_0\
    );
\result0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001DFF1DFFE200E2"
    )
        port map (
      I0 => \in\(15),
      I1 => \func_reg_reg[2]\(1),
      I2 => out1(15),
      I3 => mode_reg_reg,
      I4 => \result0_carry__0_i_8_n_0\,
      I5 => \result0_carry__0_i_9_n_0\,
      O => \result0_carry__0_i_2_n_0\
    );
\result0_carry__0_i_20\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(15),
      O => \result0_carry__0_i_20_n_0\
    );
\result0_carry__0_i_21\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(14),
      O => \result0_carry__0_i_21_n_0\
    );
\result0_carry__0_i_22\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(13),
      O => \result0_carry__0_i_22_n_0\
    );
\result0_carry__0_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \in\(12),
      I1 => \in\(10),
      I2 => \in\(8),
      I3 => \in\(9),
      I4 => \in\(11),
      I5 => \in\(13),
      O => \result0_carry__0_i_23_n_0\
    );
\result0_carry__0_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBF88888880"
    )
        port map (
      I0 => Q(7),
      I1 => mode_reg_reg,
      I2 => Q(12),
      I3 => Q(13),
      I4 => Q(14),
      I5 => Q(3),
      O => \result0_carry__0_i_24_n_0\
    );
\result0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \a_reg_reg[6]\,
      I1 => \result0_carry__0_i_10_n_0\,
      O => \result0_carry__0_i_3_n_0\
    );
\result0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"666656A6999956A6"
    )
        port map (
      I0 => DI(1),
      I1 => \in\(13),
      I2 => \func_reg_reg[2]\(1),
      I3 => out1(13),
      I4 => mode_reg_reg,
      I5 => \result0_carry__0_i_11_n_0\,
      O => \result0_carry__0_i_4_n_0\
    );
\result0_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => DI(0),
      I1 => \in\(12),
      I2 => \func_reg_reg[2]\(1),
      I3 => out1(12),
      I4 => mode_reg_reg,
      I5 => \result0_carry__0_i_12_n_0\,
      O => \result0_carry__0_i_5_n_0\
    );
\result0_carry__0_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => result0_carry_i_16_n_0,
      CO(3 downto 0) => \NLW_result0_carry__0_i_7_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_result0_carry__0_i_7_O_UNCONNECTED\(3),
      O(2 downto 0) => out1(15 downto 13),
      S(3) => '0',
      S(2) => \result0_carry__0_i_20_n_0\,
      S(1) => \result0_carry__0_i_21_n_0\,
      S(0) => \result0_carry__0_i_22_n_0\
    );
\result0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"66A6"
    )
        port map (
      I0 => \in\(15),
      I1 => \func_reg_reg[2]\(0),
      I2 => \result0_carry__0_i_23_n_0\,
      I3 => \in\(14),
      O => \result0_carry__0_i_8_n_0\
    );
\result0_carry__0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB8FF0000B800"
    )
        port map (
      I0 => \result0_carry__0_i_24_n_0\,
      I1 => \^prod_reg[23]_0\,
      I2 => \^prod_reg[22]\,
      I3 => mode_reg_reg,
      I4 => \^prod_reg[23]_1\,
      I5 => \^prod_reg[22]_0\,
      O => \result0_carry__0_i_9_n_0\
    );
result0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA8A"
    )
        port map (
      I0 => \in\(8),
      I1 => mode_reg_reg,
      I2 => \func_reg_reg[2]\(1),
      I3 => out1(8),
      O => result0_carry_i_1_n_0
    );
result0_carry_i_11: unisim.vcomponents.CARRY4
     port map (
      CI => result0_carry_i_31_n_0,
      CO(3) => result0_carry_i_11_n_0,
      CO(2 downto 0) => NLW_result0_carry_i_11_CO_UNCONNECTED(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => out1(8),
      O(2 downto 0) => NLW_result0_carry_i_11_O_UNCONNECTED(2 downto 0),
      S(3) => result0_carry_i_32_n_0,
      S(2) => result0_carry_i_33_n_0,
      S(1) => result0_carry_i_34_n_0,
      S(0) => result0_carry_i_35_n_0
    );
result0_carry_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888F8880000FFFF"
    )
        port map (
      I0 => Q(6),
      I1 => \^prod_reg[15]\,
      I2 => Q(2),
      I3 => \^prod_reg[9]\,
      I4 => result0_carry_i_36_n_0,
      I5 => \^prod_reg[23]_0\,
      O => result0_carry_i_12_n_0
    );
result0_carry_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC8C8C888888888"
    )
        port map (
      I0 => Q(3),
      I1 => \^prod_reg[15]\,
      I2 => Q(5),
      I3 => \^prod_reg[9]\,
      I4 => Q(1),
      I5 => \^prod_reg[23]_0\,
      O => result0_carry_i_13_n_0
    );
result0_carry_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF000D"
    )
        port map (
      I0 => Q(9),
      I1 => Q(10),
      I2 => \a_reg[11]_repN_1_alias\,
      I3 => Q(12),
      I4 => Q(13),
      I5 => Q(14),
      O => \^prod_reg[23]_1\
    );
result0_carry_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA808080"
    )
        port map (
      I0 => \^prod_reg[23]_0\,
      I1 => \^prod_reg[9]\,
      I2 => Q(0),
      I3 => \^prod_reg[15]\,
      I4 => Q(4),
      O => result0_carry_i_15_n_0
    );
result0_carry_i_16: unisim.vcomponents.CARRY4
     port map (
      CI => result0_carry_i_11_n_0,
      CO(3) => result0_carry_i_16_n_0,
      CO(2 downto 0) => NLW_result0_carry_i_16_CO_UNCONNECTED(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => out1(12 downto 9),
      S(3) => result0_carry_i_37_n_0,
      S(2) => result0_carry_i_38_n_0,
      S(1) => result0_carry_i_39_n_0,
      S(0) => result0_carry_i_40_n_0
    );
result0_carry_i_17: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6666666A"
    )
        port map (
      I0 => \in\(11),
      I1 => \func_reg_reg[2]\(0),
      I2 => \in\(9),
      I3 => \in\(8),
      I4 => \in\(10),
      O => result0_carry_i_17_n_0
    );
result0_carry_i_18: unisim.vcomponents.LUT4
    generic map(
      INIT => X"666A"
    )
        port map (
      I0 => \in\(10),
      I1 => \func_reg_reg[2]\(0),
      I2 => \in\(8),
      I3 => \in\(9),
      O => result0_carry_i_18_n_0
    );
result0_carry_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F707F7F8F808080"
    )
        port map (
      I0 => \in\(8),
      I1 => \func_reg_reg[2]\(0),
      I2 => mode_reg_reg,
      I3 => out1(9),
      I4 => \func_reg_reg[2]\(1),
      I5 => \in\(9),
      O => result0_carry_i_19_n_0
    );
result0_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \a_reg_reg[7]\,
      I1 => \^prod_reg[23]\,
      I2 => result0_carry_i_12_n_0,
      O => result0_carry_i_2_n_0
    );
result0_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result0_carry_i_12_n_0,
      I1 => \^prod_reg[23]\,
      I2 => result0_carry_i_13_n_0,
      O => result0_carry_i_3_n_0
    );
result0_carry_i_31: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => result0_carry_i_31_n_0,
      CO(2 downto 0) => NLW_result0_carry_i_31_CO_UNCONNECTED(2 downto 0),
      CYINIT => result0_carry_i_46_n_0,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_result0_carry_i_31_O_UNCONNECTED(3 downto 0),
      S(3) => result0_carry_i_47_n_0,
      S(2) => result0_carry_i_48_n_0,
      S(1) => result0_carry_i_49_n_0,
      S(0) => result0_carry_i_50_n_0
    );
result0_carry_i_32: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(8),
      O => result0_carry_i_32_n_0
    );
result0_carry_i_33: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(7),
      O => result0_carry_i_33_n_0
    );
result0_carry_i_34: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(6),
      O => result0_carry_i_34_n_0
    );
result0_carry_i_35: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(5),
      O => result0_carry_i_35_n_0
    );
result0_carry_i_36: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => Q(4),
      I1 => \^prod_reg[15]\,
      I2 => Q(0),
      I3 => \^prod_reg[9]\,
      O => result0_carry_i_36_n_0
    );
result0_carry_i_37: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(12),
      O => result0_carry_i_37_n_0
    );
result0_carry_i_38: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(11),
      O => result0_carry_i_38_n_0
    );
result0_carry_i_39: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(10),
      O => result0_carry_i_39_n_0
    );
result0_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FB0BFB08"
    )
        port map (
      I0 => result0_carry_i_13_n_0,
      I1 => mode_reg_reg,
      I2 => \^prod_reg[23]_1\,
      I3 => result0_carry_i_15_n_0,
      I4 => Q(2),
      O => result0_carry_i_4_n_0
    );
result0_carry_i_40: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(9),
      O => result0_carry_i_40_n_0
    );
result0_carry_i_46: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(0),
      O => result0_carry_i_46_n_0
    );
result0_carry_i_47: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(4),
      O => result0_carry_i_47_n_0
    );
result0_carry_i_48: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(3),
      O => result0_carry_i_48_n_0
    );
result0_carry_i_49: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(2),
      O => result0_carry_i_49_n_0
    );
result0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4544"
    )
        port map (
      I0 => \^prod_reg[23]_1\,
      I1 => result0_carry_i_15_n_0,
      I2 => mode_reg_reg,
      I3 => Q(1),
      O => result0_carry_i_5_n_0
    );
result0_carry_i_50: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \in\(1),
      O => result0_carry_i_50_n_0
    );
result0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => result0_carry_i_2_n_0,
      I1 => \in\(11),
      I2 => \func_reg_reg[2]\(1),
      I3 => out1(11),
      I4 => mode_reg_reg,
      I5 => result0_carry_i_17_n_0,
      O => result0_carry_i_6_n_0
    );
result0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => result0_carry_i_3_n_0,
      I1 => \in\(10),
      I2 => \func_reg_reg[2]\(1),
      I3 => out1(10),
      I4 => mode_reg_reg,
      I5 => result0_carry_i_18_n_0,
      O => result0_carry_i_7_n_0
    );
result0_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"04F404F7FB0BFB08"
    )
        port map (
      I0 => result0_carry_i_13_n_0,
      I1 => mode_reg_reg,
      I2 => \^prod_reg[23]_1\,
      I3 => result0_carry_i_15_n_0,
      I4 => Q(2),
      I5 => result0_carry_i_19_n_0,
      O => result0_carry_i_8_n_0
    );
result0_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F3F3F10E0C0CF10E"
    )
        port map (
      I0 => Q(1),
      I1 => result0_carry_i_15_n_0,
      I2 => \^prod_reg[23]_1\,
      I3 => CO(0),
      I4 => mode_reg_reg,
      I5 => \func_reg_reg[2]_14\(0),
      O => result0_carry_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_module is
  port (
    \prod_reg[20]\ : out STD_LOGIC;
    \prod_reg[15]\ : out STD_LOGIC;
    \prod_reg[23]\ : out STD_LOGIC;
    \prod_reg[23]_0\ : out STD_LOGIC;
    \prod_reg[15]_0\ : out STD_LOGIC;
    \prod_reg[11]\ : out STD_LOGIC;
    \prod_reg[19]\ : out STD_LOGIC;
    \prod_reg[10]\ : out STD_LOGIC;
    \prod_reg[18]\ : out STD_LOGIC;
    \prod_reg[25]\ : out STD_LOGIC;
    \prod_reg[16]\ : out STD_LOGIC;
    \prod_reg[28]\ : out STD_LOGIC;
    \prod_reg[9]\ : out STD_LOGIC;
    \prod_reg[8]\ : out STD_LOGIC;
    \prod_reg[24]\ : out STD_LOGIC;
    \prod_reg[17]\ : out STD_LOGIC;
    \prod_reg[0]\ : out STD_LOGIC;
    \prod_reg[1]\ : out STD_LOGIC;
    \prod_reg[2]\ : out STD_LOGIC;
    \prod_reg[3]\ : out STD_LOGIC;
    \prod_reg[4]\ : out STD_LOGIC;
    \prod_reg[5]\ : out STD_LOGIC;
    \prod_reg[6]\ : out STD_LOGIC;
    \prod_reg[7]\ : out STD_LOGIC;
    \prod_reg[27]\ : out STD_LOGIC;
    \prod_reg[20]_0\ : out STD_LOGIC;
    \prod_reg[21]\ : out STD_LOGIC;
    \prod_reg[22]\ : out STD_LOGIC;
    \prod_reg[23]_1\ : out STD_LOGIC;
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \prod_reg[12]\ : out STD_LOGIC;
    \prod_reg[13]\ : out STD_LOGIC;
    \prod_reg[14]\ : out STD_LOGIC;
    \prod_reg[15]_1\ : out STD_LOGIC;
    \prod_reg[23]_2\ : out STD_LOGIC;
    \prod_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \prod_reg[15]_2\ : out STD_LOGIC;
    \prod_reg[15]_3\ : out STD_LOGIC;
    \prod_reg[27]_0\ : out STD_LOGIC;
    \prod_reg[15]_4\ : out STD_LOGIC;
    \prod_reg[15]_5\ : out STD_LOGIC;
    \prod_reg[15]_6\ : out STD_LOGIC;
    \prod_reg[15]_7\ : out STD_LOGIC;
    \prod_reg[26]\ : out STD_LOGIC;
    \prod_reg[27]_1\ : out STD_LOGIC;
    \prod_reg[28]_0\ : out STD_LOGIC;
    \prod_reg[29]\ : out STD_LOGIC;
    \prod_reg[30]\ : out STD_LOGIC;
    \prod_reg[31]\ : out STD_LOGIC;
    mode_reg_reg : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \func_reg_reg[2]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \func_reg_reg[2]_0\ : in STD_LOGIC;
    mode_reg_reg_0 : in STD_LOGIC;
    \func_reg_reg[2]_1\ : in STD_LOGIC;
    \func_reg_reg[2]_2\ : in STD_LOGIC;
    \func_reg_reg[2]_3\ : in STD_LOGIC;
    \func_reg_reg[2]_4\ : in STD_LOGIC;
    mode_reg_reg_1 : in STD_LOGIC;
    \func_reg_reg[2]_5\ : in STD_LOGIC;
    \func_reg_reg[2]_6\ : in STD_LOGIC;
    \func_reg_reg[2]_7\ : in STD_LOGIC;
    \func_reg_reg[2]_8\ : in STD_LOGIC;
    \func_reg_reg[0]\ : in STD_LOGIC;
    mode_reg_reg_2 : in STD_LOGIC;
    mode_reg_reg_3 : in STD_LOGIC;
    mode_reg_reg_4 : in STD_LOGIC;
    \a_reg_reg[9]\ : in STD_LOGIC;
    \a_reg_reg[15]\ : in STD_LOGIC;
    \func_reg_reg[2]_9\ : in STD_LOGIC;
    mode_reg_reg_5 : in STD_LOGIC;
    \func_reg_reg[1]\ : in STD_LOGIC;
    \b_reg_reg[15]\ : in STD_LOGIC;
    \func_reg_reg[2]_10\ : in STD_LOGIC;
    \func_reg_reg[2]_11\ : in STD_LOGIC;
    \func_reg_reg[2]_12\ : in STD_LOGIC;
    \func_reg_reg[2]_13\ : in STD_LOGIC;
    \b_reg_reg[15]_0\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    mode_reg_reg_6 : in STD_LOGIC;
    mode_reg_reg_7 : in STD_LOGIC;
    \a_reg_reg[15]_0\ : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    mode_reg_reg_n_0_repN_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_1_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_2_alias : in STD_LOGIC;
    \b_reg[10]_repN_alias\ : in STD_LOGIC;
    \b_reg[11]_repN_alias\ : in STD_LOGIC;
    \b_reg[15]_repN_alias\ : in STD_LOGIC;
    \a_reg[10]_repN_alias\ : in STD_LOGIC;
    \b_reg[13]_repN_alias\ : in STD_LOGIC;
    \b_reg[13]_repN_1_alias\ : in STD_LOGIC;
    mode_reg_reg_n_0_repN_3_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_4_alias : in STD_LOGIC;
    mode_reg_reg_n_0_repN_5_alias : in STD_LOGIC;
    \a_reg[11]_repN_alias\ : in STD_LOGIC;
    \a_reg[11]_repN_1_alias\ : in STD_LOGIC;
    \b_reg[15]_repN_1_alias\ : in STD_LOGIC;
    \b_reg[15]_repN_2_alias\ : in STD_LOGIC;
    \prod_reg[28]_repN_alias\ : out STD_LOGIC
  );
end top_module;

architecture STRUCTURE of top_module is
  signal \^o\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_8_inst_3_n_1 : STD_LOGIC;
  signal add_8_inst_3_n_10 : STD_LOGIC;
  signal add_8_inst_3_n_11 : STD_LOGIC;
  signal add_8_inst_3_n_12 : STD_LOGIC;
  signal add_8_inst_3_n_17 : STD_LOGIC;
  signal add_8_inst_3_n_18 : STD_LOGIC;
  signal add_8_inst_3_n_19 : STD_LOGIC;
  signal add_8_inst_3_n_2 : STD_LOGIC;
  signal add_8_inst_3_n_20 : STD_LOGIC;
  signal add_8_inst_3_n_21 : STD_LOGIC;
  signal add_8_inst_3_n_23 : STD_LOGIC;
  signal add_8_inst_3_n_24 : STD_LOGIC;
  signal add_8_inst_3_n_25 : STD_LOGIC;
  signal add_8_inst_3_n_26 : STD_LOGIC;
  signal add_8_inst_3_n_29 : STD_LOGIC;
  signal add_8_inst_3_n_3 : STD_LOGIC;
  signal add_8_inst_3_n_30 : STD_LOGIC;
  signal add_8_inst_3_n_31 : STD_LOGIC;
  signal add_8_inst_3_n_32 : STD_LOGIC;
  signal add_8_inst_3_n_33 : STD_LOGIC;
  signal add_8_inst_3_n_37 : STD_LOGIC;
  signal add_8_inst_3_n_4 : STD_LOGIC;
  signal add_8_inst_3_n_40 : STD_LOGIC;
  signal add_8_inst_3_n_41 : STD_LOGIC;
  signal add_8_inst_3_n_42 : STD_LOGIC;
  signal add_8_inst_3_n_43 : STD_LOGIC;
  signal add_8_inst_3_n_44 : STD_LOGIC;
  signal add_8_inst_3_n_45 : STD_LOGIC;
  signal add_8_inst_3_n_46 : STD_LOGIC;
  signal add_8_inst_3_n_47 : STD_LOGIC;
  signal add_8_inst_3_n_5 : STD_LOGIC;
  signal add_8_inst_3_n_57 : STD_LOGIC;
  signal add_8_inst_3_n_58 : STD_LOGIC;
  signal add_8_inst_3_n_59 : STD_LOGIC;
  signal add_8_inst_3_n_60 : STD_LOGIC;
  signal add_8_inst_3_n_61 : STD_LOGIC;
  signal add_8_inst_3_n_62 : STD_LOGIC;
  signal add_8_inst_3_n_63 : STD_LOGIC;
  signal add_8_inst_3_n_64 : STD_LOGIC;
  signal add_8_inst_3_n_65 : STD_LOGIC;
  signal add_8_inst_3_n_66 : STD_LOGIC;
  signal add_8_inst_3_n_67 : STD_LOGIC;
  signal add_8_inst_3_n_68 : STD_LOGIC;
  signal add_8_inst_3_n_69 : STD_LOGIC;
  signal add_8_inst_3_n_70 : STD_LOGIC;
  signal add_8_inst_3_n_8 : STD_LOGIC;
  signal add_8_inst_3_n_9 : STD_LOGIC;
  signal add_8_inst_4_n_1 : STD_LOGIC;
  signal add_8_inst_4_n_6 : STD_LOGIC;
  signal add_8_inst_4_n_7 : STD_LOGIC;
  signal add_8_inst_4_n_8 : STD_LOGIC;
  signal adder_result1 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal adder_result2 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal adder_result3 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal data2 : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal data3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \g0_b0__0_n_0_alias\ : STD_LOGIC;
  signal g0_b0_n_0_alias : STD_LOGIC;
  signal g0_b1_n_0_alias : STD_LOGIC;
  signal \g0_b2__0_n_0_alias\ : STD_LOGIC;
  signal g0_b2_n_0_alias : STD_LOGIC;
  signal \in\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \prod_reg[11]_1_repN_alias\ : STD_LOGIC;
  signal \^prod_reg[15]\ : STD_LOGIC;
  signal \^prod_reg[15]_4\ : STD_LOGIC;
  signal \prod_reg[23]_0_repN_alias\ : STD_LOGIC;
  signal \^prod_reg[23]_2\ : STD_LOGIC;
  signal \^prod_reg[27]\ : STD_LOGIC;
  signal \^prod_reg[7]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \prod_reg[9]_repN_alias\ : STD_LOGIC;
  signal NLW_add_8_inst_1_mode_reg_reg_0_UNCONNECTED : STD_LOGIC;
  signal NLW_add_8_inst_3_mode_reg_reg_2_UNCONNECTED : STD_LOGIC;
  signal NLW_add_8_inst_3_mode_reg_reg_3_UNCONNECTED : STD_LOGIC;
  signal \NLW_add_8_inst_3_b_reg_reg[15]_UNCONNECTED\ : STD_LOGIC_VECTOR ( 14 to 14 );
  signal \NLW_add_8_inst_4_prod_reg[28]_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_add_8_inst_4_prod_reg[9]_UNCONNECTED\ : STD_LOGIC;
begin
  O(3 downto 0) <= \^o\(3 downto 0);
  \prod_reg[15]\ <= \^prod_reg[15]\;
  \prod_reg[15]_4\ <= \^prod_reg[15]_4\;
  \prod_reg[23]_2\ <= \^prod_reg[23]_2\;
  \prod_reg[27]\ <= \^prod_reg[27]\;
  \prod_reg[7]_0\(3 downto 0) <= \^prod_reg[7]_0\(3 downto 0);
  \prod_reg[28]\ <= 'Z';
add_8_inst_1: entity work.add_8_bit
     port map (
      CO(0) => adder_result1(8),
      DI(3) => add_8_inst_3_n_29,
      DI(2) => add_8_inst_3_n_30,
      DI(1) => add_8_inst_3_n_31,
      DI(0) => add_8_inst_3_n_32,
      \b_reg_reg[0]\(3) => add_8_inst_3_n_18,
      \b_reg_reg[0]\(2) => add_8_inst_3_n_19,
      \b_reg_reg[0]\(1) => add_8_inst_3_n_20,
      \b_reg_reg[0]\(0) => add_8_inst_3_n_21,
      \b_reg_reg[6]\(2) => add_8_inst_3_n_68,
      \b_reg_reg[6]\(1) => add_8_inst_3_n_69,
      \b_reg_reg[6]\(0) => add_8_inst_3_n_70,
      \b_reg_reg[6]_0\(2) => add_8_inst_3_n_65,
      \b_reg_reg[6]_0\(1) => add_8_inst_3_n_66,
      \b_reg_reg[6]_0\(0) => add_8_inst_3_n_67,
      \func_reg_reg[2]\(2 downto 0) => \func_reg_reg[2]\(2 downto 0),
      \func_reg_reg[2]_0\ => add_8_inst_3_n_37,
      \func_reg_reg[2]_1\ => add_8_inst_3_n_41,
      \func_reg_reg[2]_2\ => add_8_inst_3_n_42,
      \g0_b0__0_n_0_alias\ => \g0_b0__0_n_0_alias\,
      g0_b0_n_0_alias => g0_b0_n_0_alias,
      g0_b1_n_0_alias => g0_b1_n_0_alias,
      \g0_b2__0_n_0_alias\ => \g0_b2__0_n_0_alias\,
      g0_b2_n_0_alias => g0_b2_n_0_alias,
      \in\(7 downto 0) => \in\(7 downto 0),
      mode_reg_reg => add_8_inst_3_n_33,
      mode_reg_reg_0 => NLW_add_8_inst_1_mode_reg_reg_0_UNCONNECTED,
      mode_reg_reg_1(2 downto 1) => data2(4 downto 3),
      mode_reg_reg_1(0) => data2(1),
      mode_reg_reg_2 => add_8_inst_3_n_40,
      mode_reg_reg_n_0_repN_2_alias => mode_reg_reg_n_0_repN_2_alias,
      \out\(1) => data3(2),
      \out\(0) => data3(0),
      \prod_reg[11]_1_repN_alias\ => \prod_reg[11]_1_repN_alias\
    );
add_8_inst_2: entity work.add_8_bit_0
     port map (
      CO(0) => adder_result2(8),
      DI(3) => add_8_inst_3_n_8,
      DI(2) => add_8_inst_3_n_9,
      DI(1) => add_8_inst_3_n_10,
      DI(0) => add_8_inst_3_n_11,
      S(2) => add_8_inst_3_n_45,
      S(1) => add_8_inst_3_n_46,
      S(0) => add_8_inst_3_n_47,
      \b_reg_reg[0]\ => add_8_inst_3_n_17,
      \b_reg_reg[0]_0\(0) => adder_result1(8),
      \b_reg_reg[1]\(0) => \b_reg_reg[15]_0\(1),
      \b_reg_reg[6]\ => add_8_inst_3_n_64,
      \b_reg_reg[6]_0\ => add_8_inst_3_n_63,
      \b_reg_reg[6]_1\ => add_8_inst_3_n_62,
      \b_reg_reg[6]_2\ => add_8_inst_3_n_61,
      \b_reg_reg[6]_3\ => add_8_inst_3_n_60,
      \b_reg_reg[6]_4\ => add_8_inst_3_n_59,
      \b_reg_reg[6]_5\ => add_8_inst_3_n_58,
      \b_reg_reg[6]_6\ => add_8_inst_3_n_57,
      \b_reg_reg[7]\(3) => add_8_inst_3_n_23,
      \b_reg_reg[7]\(2) => add_8_inst_3_n_24,
      \b_reg_reg[7]\(1) => add_8_inst_3_n_25,
      \b_reg_reg[7]\(0) => add_8_inst_3_n_26,
      \b_reg_reg[9]\ => \^prod_reg[15]_4\,
      \func_reg_reg[0]\ => add_8_inst_3_n_43,
      \func_reg_reg[0]_0\ => add_8_inst_3_n_44,
      \func_reg_reg[2]\(0) => \func_reg_reg[2]\(2),
      \in\(7 downto 0) => \in\(15 downto 8),
      mode_reg_reg => mode_reg_reg
    );
add_8_inst_3: entity work.add_8_bit_1
     port map (
      CO(0) => adder_result3(8),
      DI(3) => add_8_inst_3_n_8,
      DI(2) => add_8_inst_3_n_9,
      DI(1) => add_8_inst_3_n_10,
      DI(0) => add_8_inst_3_n_11,
      O(3 downto 0) => \^o\(3 downto 0),
      Q(7 downto 0) => Q(7 downto 0),
      S(2) => add_8_inst_3_n_45,
      S(1) => add_8_inst_3_n_46,
      S(0) => add_8_inst_3_n_47,
      \a_reg_reg[4]\ => add_8_inst_4_n_8,
      \a_reg_reg[5]\ => add_8_inst_4_n_6,
      \a_reg_reg[6]\ => add_8_inst_4_n_7,
      \b_reg[10]_repN_alias\ => \b_reg[10]_repN_alias\,
      \b_reg[11]_repN_alias\ => \b_reg[11]_repN_alias\,
      \b_reg[13]_repN_1_alias\ => \b_reg[13]_repN_1_alias\,
      \b_reg[13]_repN_alias\ => \b_reg[13]_repN_alias\,
      \b_reg[15]_repN_1_alias\ => \b_reg[15]_repN_1_alias\,
      \b_reg[15]_repN_2_alias\ => \b_reg[15]_repN_2_alias\,
      \b_reg[15]_repN_alias\ => \b_reg[15]_repN_alias\,
      \b_reg_reg[0]\(0) => adder_result1(8),
      \b_reg_reg[15]\(14) => \NLW_add_8_inst_3_b_reg_reg[15]_UNCONNECTED\(14),
      \b_reg_reg[15]\(13 downto 0) => \b_reg_reg[15]_0\(13 downto 0),
      \func_reg_reg[2]\(2 downto 0) => \func_reg_reg[2]\(2 downto 0),
      \func_reg_reg[2]_0\(0) => adder_result2(8),
      \g0_b0__0_n_0_alias\ => \g0_b0__0_n_0_alias\,
      g0_b0_n_0_alias => g0_b0_n_0_alias,
      g0_b1_n_0_alias => g0_b1_n_0_alias,
      \g0_b2__0_n_0_alias\ => \g0_b2__0_n_0_alias\,
      g0_b2_n_0_alias => g0_b2_n_0_alias,
      \in\(7 downto 0) => \in\(7 downto 0),
      mode_reg_reg => \^prod_reg[15]\,
      mode_reg_reg_0 => mode_reg_reg,
      mode_reg_reg_1 => add_8_inst_4_n_1,
      mode_reg_reg_2 => NLW_add_8_inst_3_mode_reg_reg_2_UNCONNECTED,
      mode_reg_reg_3 => NLW_add_8_inst_3_mode_reg_reg_3_UNCONNECTED,
      mode_reg_reg_4(0) => DI(0),
      mode_reg_reg_n_0_repN_1_alias => mode_reg_reg_n_0_repN_1_alias,
      mode_reg_reg_n_0_repN_2_alias => mode_reg_reg_n_0_repN_2_alias,
      mode_reg_reg_n_0_repN_3_alias => mode_reg_reg_n_0_repN_3_alias,
      mode_reg_reg_n_0_repN_4_alias => mode_reg_reg_n_0_repN_4_alias,
      mode_reg_reg_n_0_repN_5_alias => mode_reg_reg_n_0_repN_5_alias,
      mode_reg_reg_n_0_repN_alias => mode_reg_reg_n_0_repN_alias,
      \out\(2 downto 1) => data2(4 downto 3),
      \out\(0) => data2(1),
      \prod_reg[11]\(3) => add_8_inst_3_n_29,
      \prod_reg[11]\(2) => add_8_inst_3_n_30,
      \prod_reg[11]\(1) => add_8_inst_3_n_31,
      \prod_reg[11]\(0) => add_8_inst_3_n_32,
      \prod_reg[11]_0\ => add_8_inst_3_n_33,
      \prod_reg[11]_1\ => add_8_inst_3_n_37,
      \prod_reg[11]_1_repN_alias\ => \prod_reg[11]_1_repN_alias\,
      \prod_reg[11]_2\(1) => data3(2),
      \prod_reg[11]_2\(0) => data3(0),
      \prod_reg[11]_3\ => add_8_inst_3_n_40,
      \prod_reg[11]_4\ => add_8_inst_3_n_41,
      \prod_reg[14]\(3) => add_8_inst_3_n_18,
      \prod_reg[14]\(2) => add_8_inst_3_n_19,
      \prod_reg[14]\(1) => add_8_inst_3_n_20,
      \prod_reg[14]\(0) => add_8_inst_3_n_21,
      \prod_reg[14]_0\ => add_8_inst_3_n_42,
      \prod_reg[14]_1\(2) => add_8_inst_3_n_65,
      \prod_reg[14]_1\(1) => add_8_inst_3_n_66,
      \prod_reg[14]_1\(0) => add_8_inst_3_n_67,
      \prod_reg[14]_2\(2) => add_8_inst_3_n_68,
      \prod_reg[14]_2\(1) => add_8_inst_3_n_69,
      \prod_reg[14]_2\(0) => add_8_inst_3_n_70,
      \prod_reg[15]\ => \prod_reg[15]_0\,
      \prod_reg[15]_0\ => \prod_reg[15]_2\,
      \prod_reg[15]_1\ => \prod_reg[15]_3\,
      \prod_reg[15]_2\ => \^prod_reg[15]_4\,
      \prod_reg[15]_3\ => \prod_reg[15]_5\,
      \prod_reg[15]_4\ => \prod_reg[15]_6\,
      \prod_reg[15]_5\ => \prod_reg[15]_7\,
      \prod_reg[22]\ => add_8_inst_3_n_1,
      \prod_reg[22]_0\ => add_8_inst_3_n_2,
      \prod_reg[22]_1\ => add_8_inst_3_n_3,
      \prod_reg[22]_10\ => add_8_inst_3_n_59,
      \prod_reg[22]_11\ => add_8_inst_3_n_60,
      \prod_reg[22]_12\ => add_8_inst_3_n_61,
      \prod_reg[22]_13\ => add_8_inst_3_n_62,
      \prod_reg[22]_14\ => add_8_inst_3_n_63,
      \prod_reg[22]_15\ => add_8_inst_3_n_64,
      \prod_reg[22]_2\ => add_8_inst_3_n_4,
      \prod_reg[22]_3\ => add_8_inst_3_n_5,
      \prod_reg[22]_4\ => add_8_inst_3_n_17,
      \prod_reg[22]_5\(3) => add_8_inst_3_n_23,
      \prod_reg[22]_5\(2) => add_8_inst_3_n_24,
      \prod_reg[22]_5\(1) => add_8_inst_3_n_25,
      \prod_reg[22]_5\(0) => add_8_inst_3_n_26,
      \prod_reg[22]_6\ => add_8_inst_3_n_43,
      \prod_reg[22]_7\ => add_8_inst_3_n_44,
      \prod_reg[22]_8\ => add_8_inst_3_n_57,
      \prod_reg[22]_9\ => add_8_inst_3_n_58,
      \prod_reg[23]\ => add_8_inst_3_n_12,
      \prod_reg[23]_0\ => \^prod_reg[23]_2\,
      \prod_reg[23]_0_repN_alias\ => \prod_reg[23]_0_repN_alias\,
      \prod_reg[27]\ => \prod_reg[27]_0\,
      \prod_reg[27]_0\ => \^prod_reg[27]\,
      \prod_reg[7]\(3 downto 0) => \^prod_reg[7]_0\(3 downto 0),
      \prod_reg[9]_repN_alias\ => \prod_reg[9]_repN_alias\
    );
add_8_inst_4: entity work.add_8_bit_2
     port map (
      CO(0) => adder_result3(8),
      DI(1) => add_8_inst_3_n_3,
      DI(0) => add_8_inst_3_n_1,
      O(3 downto 0) => \^o\(3 downto 0),
      Q(14 downto 0) => Q(14 downto 0),
      \a_reg[10]_repN_alias\ => \a_reg[10]_repN_alias\,
      \a_reg[11]_repN_1_alias\ => \a_reg[11]_repN_1_alias\,
      \a_reg[11]_repN_alias\ => \a_reg[11]_repN_alias\,
      \a_reg_reg[0]\(3 downto 0) => \^prod_reg[7]_0\(3 downto 0),
      \a_reg_reg[15]\ => \a_reg_reg[15]\,
      \a_reg_reg[15]_0\ => \a_reg_reg[15]_0\,
      \a_reg_reg[6]\ => add_8_inst_3_n_5,
      \a_reg_reg[7]\ => add_8_inst_3_n_2,
      \a_reg_reg[7]_0\ => add_8_inst_3_n_4,
      \a_reg_reg[9]\ => \a_reg_reg[9]\,
      \b_reg_reg[15]\ => \b_reg_reg[15]\,
      \b_reg_reg[15]_0\(2 downto 0) => \b_reg_reg[15]_0\(14 downto 12),
      \func_reg_reg[0]\ => \func_reg_reg[0]\,
      \func_reg_reg[1]\ => \func_reg_reg[1]\,
      \func_reg_reg[2]\(1 downto 0) => \func_reg_reg[2]\(2 downto 1),
      \func_reg_reg[2]_0\ => \func_reg_reg[2]_0\,
      \func_reg_reg[2]_1\ => \func_reg_reg[2]_1\,
      \func_reg_reg[2]_10\ => \func_reg_reg[2]_10\,
      \func_reg_reg[2]_11\ => \func_reg_reg[2]_11\,
      \func_reg_reg[2]_12\ => \func_reg_reg[2]_12\,
      \func_reg_reg[2]_13\ => \func_reg_reg[2]_13\,
      \func_reg_reg[2]_14\(0) => adder_result2(8),
      \func_reg_reg[2]_2\ => \func_reg_reg[2]_2\,
      \func_reg_reg[2]_3\ => \func_reg_reg[2]_3\,
      \func_reg_reg[2]_4\ => \func_reg_reg[2]_4\,
      \func_reg_reg[2]_5\ => \func_reg_reg[2]_5\,
      \func_reg_reg[2]_6\ => \func_reg_reg[2]_6\,
      \func_reg_reg[2]_7\ => \func_reg_reg[2]_7\,
      \func_reg_reg[2]_8\ => \func_reg_reg[2]_8\,
      \func_reg_reg[2]_9\ => \func_reg_reg[2]_9\,
      \in\(15 downto 0) => \in\(15 downto 0),
      mode_reg_reg => mode_reg_reg,
      mode_reg_reg_0 => mode_reg_reg_0,
      mode_reg_reg_1 => mode_reg_reg_1,
      mode_reg_reg_10 => mode_reg_reg_7,
      mode_reg_reg_2 => mode_reg_reg_2,
      mode_reg_reg_3 => mode_reg_reg_3,
      mode_reg_reg_4 => mode_reg_reg_4,
      mode_reg_reg_5 => \^prod_reg[27]\,
      mode_reg_reg_6 => mode_reg_reg_5,
      mode_reg_reg_7 => mode_reg_reg_6,
      mode_reg_reg_8 => add_8_inst_3_n_12,
      mode_reg_reg_9 => \^prod_reg[23]_2\,
      mode_reg_reg_n_0_repN_1_alias => mode_reg_reg_n_0_repN_1_alias,
      mode_reg_reg_n_0_repN_alias => mode_reg_reg_n_0_repN_alias,
      \prod_reg[0]\ => \prod_reg[0]\,
      \prod_reg[10]\ => \prod_reg[10]\,
      \prod_reg[11]\ => \prod_reg[11]\,
      \prod_reg[12]\ => \prod_reg[12]\,
      \prod_reg[13]\ => \prod_reg[13]\,
      \prod_reg[14]\ => \prod_reg[14]\,
      \prod_reg[15]\ => \^prod_reg[15]\,
      \prod_reg[15]_0\ => \prod_reg[15]_1\,
      \prod_reg[16]\ => \prod_reg[16]\,
      \prod_reg[17]\ => \prod_reg[17]\,
      \prod_reg[18]\ => \prod_reg[18]\,
      \prod_reg[19]\ => \prod_reg[19]\,
      \prod_reg[1]\ => \prod_reg[1]\,
      \prod_reg[20]\ => \prod_reg[20]\,
      \prod_reg[20]_0\ => \prod_reg[20]_0\,
      \prod_reg[21]\ => \prod_reg[21]\,
      \prod_reg[22]\ => add_8_inst_4_n_6,
      \prod_reg[22]_0\ => add_8_inst_4_n_7,
      \prod_reg[22]_1\ => add_8_inst_4_n_8,
      \prod_reg[22]_2\ => \prod_reg[22]\,
      \prod_reg[23]\ => add_8_inst_4_n_1,
      \prod_reg[23]_0\ => \prod_reg[23]\,
      \prod_reg[23]_0_repN_alias\ => \prod_reg[23]_0_repN_alias\,
      \prod_reg[23]_1\ => \prod_reg[23]_0\,
      \prod_reg[23]_2\ => \prod_reg[23]_1\,
      \prod_reg[24]\ => \prod_reg[24]\,
      \prod_reg[25]\ => \prod_reg[25]\,
      \prod_reg[26]\ => \prod_reg[26]\,
      \prod_reg[27]\ => \prod_reg[27]_1\,
      \prod_reg[28]\ => \NLW_add_8_inst_4_prod_reg[28]_UNCONNECTED\,
      \prod_reg[28]_0\ => \prod_reg[28]_0\,
      \prod_reg[28]_repN_alias\ => \prod_reg[28]_repN_alias\,
      \prod_reg[29]\ => \prod_reg[29]\,
      \prod_reg[2]\ => \prod_reg[2]\,
      \prod_reg[30]\ => \prod_reg[30]\,
      \prod_reg[31]\ => \prod_reg[31]\,
      \prod_reg[3]\ => \prod_reg[3]\,
      \prod_reg[4]\ => \prod_reg[4]\,
      \prod_reg[5]\ => \prod_reg[5]\,
      \prod_reg[6]\ => \prod_reg[6]\,
      \prod_reg[7]\ => \prod_reg[7]\,
      \prod_reg[8]\ => \prod_reg[8]\,
      \prod_reg[9]\ => \NLW_add_8_inst_4_prod_reg[9]_UNCONNECTED\,
      \prod_reg[9]_0\ => \prod_reg[9]\,
      \prod_reg[9]_repN_alias\ => \prod_reg[9]_repN_alias\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_wrapper is
  port (
    a : in STD_LOGIC_VECTOR ( 15 downto 0 );
    b : in STD_LOGIC_VECTOR ( 15 downto 0 );
    prod : out STD_LOGIC_VECTOR ( 31 downto 0 );
    func : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mode : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_wrapper : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of top_wrapper : entity is "4ff62bdd";
  attribute word_size : integer;
  attribute word_size of top_wrapper : entity is 16;
end top_wrapper;

architecture STRUCTURE of top_wrapper is
  signal a_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal a_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \a_reg[10]_repN\ : STD_LOGIC;
  signal \a_reg[11]_repN\ : STD_LOGIC;
  signal \a_reg[11]_repN_1\ : STD_LOGIC;
  signal \add_4_inst_lsb/0\ : STD_LOGIC;
  signal b_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal b_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \b_reg[10]_repN\ : STD_LOGIC;
  signal \b_reg[11]_repN\ : STD_LOGIC;
  signal \b_reg[13]_repN\ : STD_LOGIC;
  signal \b_reg[13]_repN_1\ : STD_LOGIC;
  signal \b_reg[15]_repN\ : STD_LOGIC;
  signal \b_reg[15]_repN_1\ : STD_LOGIC;
  signal \b_reg[15]_repN_2\ : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal func_IBUF : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \func_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \func_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \func_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal inst0_n_0 : STD_LOGIC;
  signal inst0_n_1 : STD_LOGIC;
  signal inst0_n_10 : STD_LOGIC;
  signal inst0_n_12 : STD_LOGIC;
  signal inst0_n_13 : STD_LOGIC;
  signal inst0_n_14 : STD_LOGIC;
  signal inst0_n_15 : STD_LOGIC;
  signal inst0_n_16 : STD_LOGIC;
  signal inst0_n_17 : STD_LOGIC;
  signal inst0_n_18 : STD_LOGIC;
  signal inst0_n_19 : STD_LOGIC;
  signal inst0_n_2 : STD_LOGIC;
  signal inst0_n_20 : STD_LOGIC;
  signal inst0_n_21 : STD_LOGIC;
  signal inst0_n_22 : STD_LOGIC;
  signal inst0_n_23 : STD_LOGIC;
  signal inst0_n_24 : STD_LOGIC;
  signal inst0_n_25 : STD_LOGIC;
  signal inst0_n_26 : STD_LOGIC;
  signal inst0_n_27 : STD_LOGIC;
  signal inst0_n_28 : STD_LOGIC;
  signal inst0_n_29 : STD_LOGIC;
  signal inst0_n_3 : STD_LOGIC;
  signal inst0_n_30 : STD_LOGIC;
  signal inst0_n_31 : STD_LOGIC;
  signal inst0_n_32 : STD_LOGIC;
  signal inst0_n_33 : STD_LOGIC;
  signal inst0_n_34 : STD_LOGIC;
  signal inst0_n_35 : STD_LOGIC;
  signal inst0_n_36 : STD_LOGIC;
  signal inst0_n_37 : STD_LOGIC;
  signal inst0_n_39 : STD_LOGIC;
  signal inst0_n_4 : STD_LOGIC;
  signal inst0_n_40 : STD_LOGIC;
  signal inst0_n_41 : STD_LOGIC;
  signal inst0_n_42 : STD_LOGIC;
  signal inst0_n_43 : STD_LOGIC;
  signal inst0_n_44 : STD_LOGIC;
  signal inst0_n_45 : STD_LOGIC;
  signal inst0_n_46 : STD_LOGIC;
  signal inst0_n_47 : STD_LOGIC;
  signal inst0_n_48 : STD_LOGIC;
  signal inst0_n_49 : STD_LOGIC;
  signal inst0_n_5 : STD_LOGIC;
  signal inst0_n_50 : STD_LOGIC;
  signal inst0_n_51 : STD_LOGIC;
  signal inst0_n_52 : STD_LOGIC;
  signal inst0_n_53 : STD_LOGIC;
  signal inst0_n_54 : STD_LOGIC;
  signal inst0_n_6 : STD_LOGIC;
  signal inst0_n_7 : STD_LOGIC;
  signal inst0_n_8 : STD_LOGIC;
  signal inst0_n_9 : STD_LOGIC;
  signal mode_IBUF : STD_LOGIC;
  signal mode_reg_reg_n_0 : STD_LOGIC;
  signal mode_reg_reg_n_0_repN : STD_LOGIC;
  signal mode_reg_reg_n_0_repN_1 : STD_LOGIC;
  signal mode_reg_reg_n_0_repN_2 : STD_LOGIC;
  signal mode_reg_reg_n_0_repN_3 : STD_LOGIC;
  signal mode_reg_reg_n_0_repN_4 : STD_LOGIC;
  signal mode_reg_reg_n_0_repN_5 : STD_LOGIC;
  signal \prod[0]_i_2_n_0\ : STD_LOGIC;
  signal \prod[0]_i_3_n_0\ : STD_LOGIC;
  signal \prod[0]_i_4_n_0\ : STD_LOGIC;
  signal \prod[0]_i_5_n_0\ : STD_LOGIC;
  signal \prod[10]_i_3_n_0\ : STD_LOGIC;
  signal \prod[10]_i_4_n_0\ : STD_LOGIC;
  signal \prod[11]_i_10_n_0\ : STD_LOGIC;
  signal \prod[11]_i_3_n_0\ : STD_LOGIC;
  signal \prod[11]_i_5_n_0\ : STD_LOGIC;
  signal \prod[12]_i_3_n_0\ : STD_LOGIC;
  signal \prod[13]_i_3_n_0\ : STD_LOGIC;
  signal \prod[14]_i_3_n_0\ : STD_LOGIC;
  signal \prod[15]_i_2_n_0\ : STD_LOGIC;
  signal \prod[15]_i_3_n_0\ : STD_LOGIC;
  signal \prod[15]_i_4_n_0\ : STD_LOGIC;
  signal \prod[15]_i_5_n_0\ : STD_LOGIC;
  signal \prod[15]_i_6_n_0\ : STD_LOGIC;
  signal \prod[15]_i_7_n_0\ : STD_LOGIC;
  signal \prod[15]_i_8_n_0\ : STD_LOGIC;
  signal \prod[1]_i_3_n_0\ : STD_LOGIC;
  signal \prod[25]_i_2_n_0\ : STD_LOGIC;
  signal \prod[26]_i_4_n_0\ : STD_LOGIC;
  signal \prod[27]_i_12_n_0\ : STD_LOGIC;
  signal \prod[27]_i_15_n_0\ : STD_LOGIC;
  signal \prod[27]_i_17_n_0\ : STD_LOGIC;
  signal \prod[27]_i_18_n_0\ : STD_LOGIC;
  signal \prod[27]_i_19_n_0\ : STD_LOGIC;
  signal \prod[27]_i_20_n_0\ : STD_LOGIC;
  signal \prod[27]_i_9_n_0\ : STD_LOGIC;
  signal \prod[2]_i_4_n_0\ : STD_LOGIC;
  signal \prod[3]_i_3_n_0\ : STD_LOGIC;
  signal \prod[4]_i_4_n_0\ : STD_LOGIC;
  signal \prod[4]_i_6_n_0\ : STD_LOGIC;
  signal \prod[4]_i_7_n_0\ : STD_LOGIC;
  signal \prod[4]_i_8_n_0\ : STD_LOGIC;
  signal \prod[5]_i_4_n_0\ : STD_LOGIC;
  signal \prod[5]_i_6_n_0\ : STD_LOGIC;
  signal \prod[6]_i_4_n_0\ : STD_LOGIC;
  signal \prod[6]_i_6_n_0\ : STD_LOGIC;
  signal \prod[6]_i_7_n_0\ : STD_LOGIC;
  signal \prod[7]_i_5_n_0\ : STD_LOGIC;
  signal \prod[7]_i_7_n_0\ : STD_LOGIC;
  signal \prod[7]_i_8_n_0\ : STD_LOGIC;
  signal \prod[7]_i_9_n_0\ : STD_LOGIC;
  signal \prod[8]_i_2_n_0\ : STD_LOGIC;
  signal \prod[8]_i_3_n_0\ : STD_LOGIC;
  signal \prod[8]_i_4_n_0\ : STD_LOGIC;
  signal \prod[9]_i_11_n_0\ : STD_LOGIC;
  signal \prod[9]_i_2_n_0\ : STD_LOGIC;
  signal \prod[9]_i_4_n_0\ : STD_LOGIC;
  signal \prod[9]_i_5_n_0\ : STD_LOGIC;
  signal prod_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \prod_reg[28]_repN_alias\ : STD_LOGIC;
  signal \NLW_inst0_prod_reg[28]_UNCONNECTED\ : STD_LOGIC;
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \a_reg_reg[10]_replica\ : label is "a_reg_reg[10]";
  attribute ORIG_CELL_NAME of \a_reg_reg[11]_replica\ : label is "a_reg_reg[11]";
  attribute ORIG_CELL_NAME of \a_reg_reg[11]_replica_1\ : label is "a_reg_reg[11]";
  attribute ORIG_CELL_NAME of \b_reg_reg[10]_replica\ : label is "b_reg_reg[10]";
  attribute ORIG_CELL_NAME of \b_reg_reg[11]_replica\ : label is "b_reg_reg[11]";
  attribute ORIG_CELL_NAME of \b_reg_reg[13]_replica\ : label is "b_reg_reg[13]";
  attribute ORIG_CELL_NAME of \b_reg_reg[13]_replica_1\ : label is "b_reg_reg[13]";
  attribute ORIG_CELL_NAME of \b_reg_reg[15]_replica\ : label is "b_reg_reg[15]";
  attribute ORIG_CELL_NAME of \b_reg_reg[15]_replica_1\ : label is "b_reg_reg[15]_replica";
  attribute ORIG_CELL_NAME of \b_reg_reg[15]_replica_2\ : label is "b_reg_reg[15]_replica";
  attribute ORIG_CELL_NAME of mode_reg_reg_replica : label is "mode_reg_reg";
  attribute ORIG_CELL_NAME of mode_reg_reg_replica_1 : label is "mode_reg_reg";
  attribute ORIG_CELL_NAME of mode_reg_reg_replica_2 : label is "mode_reg_reg";
  attribute ORIG_CELL_NAME of mode_reg_reg_replica_3 : label is "mode_reg_reg_replica";
  attribute ORIG_CELL_NAME of mode_reg_reg_replica_4 : label is "mode_reg_reg";
  attribute ORIG_CELL_NAME of mode_reg_reg_replica_5 : label is "mode_reg_reg";
begin
\a_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(0),
      O => a_IBUF(0)
    );
\a_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(10),
      O => a_IBUF(10)
    );
\a_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(11),
      O => a_IBUF(11)
    );
\a_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(13),
      O => a_IBUF(13)
    );
\a_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(14),
      O => a_IBUF(14)
    );
\a_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(15),
      O => a_IBUF(15)
    );
\a_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(1),
      O => a_IBUF(1)
    );
\a_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(2),
      O => a_IBUF(2)
    );
\a_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(3),
      O => a_IBUF(3)
    );
\a_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(4),
      O => a_IBUF(4)
    );
\a_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(5),
      O => a_IBUF(5)
    );
\a_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(6),
      O => a_IBUF(6)
    );
\a_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(7),
      O => a_IBUF(7)
    );
\a_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(8),
      O => a_IBUF(8)
    );
\a_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(9),
      O => a_IBUF(9)
    );
\a_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(0),
      Q => a_reg(0),
      R => '0'
    );
\a_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(10),
      Q => a_reg(10),
      R => '0'
    );
\a_reg_reg[10]_replica\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(10),
      Q => \a_reg[10]_repN\,
      R => '0'
    );
\a_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(11),
      Q => a_reg(11),
      R => '0'
    );
\a_reg_reg[11]_replica\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(11),
      Q => \a_reg[11]_repN\,
      R => '0'
    );
\a_reg_reg[11]_replica_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(11),
      Q => \a_reg[11]_repN_1\,
      R => '0'
    );
\a_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(13),
      Q => a_reg(13),
      R => '0'
    );
\a_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(14),
      Q => a_reg(14),
      R => '0'
    );
\a_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(15),
      Q => a_reg(15),
      R => '0'
    );
\a_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(1),
      Q => a_reg(1),
      R => '0'
    );
\a_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(2),
      Q => a_reg(2),
      R => '0'
    );
\a_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(3),
      Q => a_reg(3),
      R => '0'
    );
\a_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(4),
      Q => a_reg(4),
      R => '0'
    );
\a_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(5),
      Q => a_reg(5),
      R => '0'
    );
\a_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(6),
      Q => a_reg(6),
      R => '0'
    );
\a_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(7),
      Q => a_reg(7),
      R => '0'
    );
\a_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(8),
      Q => a_reg(8),
      R => '0'
    );
\a_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => a_IBUF(9),
      Q => a_reg(9),
      R => '0'
    );
\b_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(0),
      O => b_IBUF(0)
    );
\b_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(10),
      O => b_IBUF(10)
    );
\b_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(11),
      O => b_IBUF(11)
    );
\b_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(13),
      O => b_IBUF(13)
    );
\b_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(14),
      O => b_IBUF(14)
    );
\b_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(15),
      O => b_IBUF(15)
    );
\b_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(1),
      O => b_IBUF(1)
    );
\b_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(2),
      O => b_IBUF(2)
    );
\b_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(3),
      O => b_IBUF(3)
    );
\b_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(4),
      O => b_IBUF(4)
    );
\b_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(5),
      O => b_IBUF(5)
    );
\b_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(6),
      O => b_IBUF(6)
    );
\b_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(7),
      O => b_IBUF(7)
    );
\b_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(8),
      O => b_IBUF(8)
    );
\b_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(9),
      O => b_IBUF(9)
    );
\b_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(0),
      Q => b_reg(0),
      R => '0'
    );
\b_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(10),
      Q => b_reg(10),
      R => '0'
    );
\b_reg_reg[10]_replica\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(10),
      Q => \b_reg[10]_repN\,
      R => '0'
    );
\b_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(11),
      Q => b_reg(11),
      R => '0'
    );
\b_reg_reg[11]_replica\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(11),
      Q => \b_reg[11]_repN\,
      R => '0'
    );
\b_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(13),
      Q => b_reg(13),
      R => '0'
    );
\b_reg_reg[13]_replica\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(13),
      Q => \b_reg[13]_repN\,
      R => '0'
    );
\b_reg_reg[13]_replica_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(13),
      Q => \b_reg[13]_repN_1\,
      R => '0'
    );
\b_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(14),
      Q => b_reg(14),
      R => '0'
    );
\b_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(15),
      Q => b_reg(15),
      R => '0'
    );
\b_reg_reg[15]_replica\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(15),
      Q => \b_reg[15]_repN\,
      R => '0'
    );
\b_reg_reg[15]_replica_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(15),
      Q => \b_reg[15]_repN_1\,
      R => '0'
    );
\b_reg_reg[15]_replica_2\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(15),
      Q => \b_reg[15]_repN_2\,
      R => '0'
    );
\b_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(1),
      Q => b_reg(1),
      R => '0'
    );
\b_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(2),
      Q => b_reg(2),
      R => '0'
    );
\b_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(3),
      Q => b_reg(3),
      R => '0'
    );
\b_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(4),
      Q => b_reg(4),
      R => '0'
    );
\b_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(5),
      Q => b_reg(5),
      R => '0'
    );
\b_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(6),
      Q => b_reg(6),
      R => '0'
    );
\b_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(7),
      Q => b_reg(7),
      R => '0'
    );
\b_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(8),
      Q => b_reg(8),
      R => '0'
    );
\b_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => b_IBUF(9),
      Q => b_reg(9),
      R => '0'
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\func_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => func(0),
      O => func_IBUF(0)
    );
\func_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => func(1),
      O => func_IBUF(1)
    );
\func_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => func(2),
      O => func_IBUF(2)
    );
\func_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => func_IBUF(0),
      Q => \func_reg_reg_n_0_[0]\,
      R => '0'
    );
\func_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => func_IBUF(1),
      Q => \func_reg_reg_n_0_[1]\,
      R => '0'
    );
\func_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => func_IBUF(2),
      Q => \func_reg_reg_n_0_[2]\,
      R => '0'
    );
inst0: entity work.top_module
     port map (
      DI(0) => \prod[11]_i_10_n_0\,
      O(3) => inst0_n_29,
      O(2) => inst0_n_30,
      O(1) => inst0_n_31,
      O(0) => inst0_n_32,
      Q(14 downto 12) => a_reg(15 downto 13),
      Q(11 downto 0) => a_reg(11 downto 0),
      \a_reg[10]_repN_alias\ => \a_reg[10]_repN\,
      \a_reg[11]_repN_1_alias\ => \a_reg[11]_repN_1\,
      \a_reg[11]_repN_alias\ => \a_reg[11]_repN\,
      \a_reg_reg[15]\ => \prod[27]_i_18_n_0\,
      \a_reg_reg[15]_0\ => \prod[27]_i_20_n_0\,
      \a_reg_reg[9]\ => \prod[27]_i_17_n_0\,
      \b_reg[10]_repN_alias\ => \b_reg[10]_repN\,
      \b_reg[11]_repN_alias\ => \b_reg[11]_repN\,
      \b_reg[13]_repN_1_alias\ => \b_reg[13]_repN_1\,
      \b_reg[13]_repN_alias\ => \b_reg[13]_repN\,
      \b_reg[15]_repN_1_alias\ => \b_reg[15]_repN_1\,
      \b_reg[15]_repN_2_alias\ => \b_reg[15]_repN_2\,
      \b_reg[15]_repN_alias\ => \b_reg[15]_repN\,
      \b_reg_reg[15]\ => \prod[9]_i_11_n_0\,
      \b_reg_reg[15]_0\(14 downto 12) => b_reg(15 downto 13),
      \b_reg_reg[15]_0\(11 downto 0) => b_reg(11 downto 0),
      \func_reg_reg[0]\ => \prod[4]_i_4_n_0\,
      \func_reg_reg[1]\ => \prod[27]_i_12_n_0\,
      \func_reg_reg[2]\(2) => \func_reg_reg_n_0_[2]\,
      \func_reg_reg[2]\(1) => \func_reg_reg_n_0_[1]\,
      \func_reg_reg[2]\(0) => \func_reg_reg_n_0_[0]\,
      \func_reg_reg[2]_0\ => \prod[25]_i_2_n_0\,
      \func_reg_reg[2]_1\ => \prod[11]_i_3_n_0\,
      \func_reg_reg[2]_10\ => \prod[12]_i_3_n_0\,
      \func_reg_reg[2]_11\ => \prod[13]_i_3_n_0\,
      \func_reg_reg[2]_12\ => \prod[14]_i_3_n_0\,
      \func_reg_reg[2]_13\ => \prod[15]_i_3_n_0\,
      \func_reg_reg[2]_2\ => \prod[10]_i_3_n_0\,
      \func_reg_reg[2]_3\ => \prod[9]_i_2_n_0\,
      \func_reg_reg[2]_4\ => \prod[8]_i_2_n_0\,
      \func_reg_reg[2]_5\ => \prod[0]_i_3_n_0\,
      \func_reg_reg[2]_6\ => \prod[1]_i_3_n_0\,
      \func_reg_reg[2]_7\ => \prod[2]_i_4_n_0\,
      \func_reg_reg[2]_8\ => \prod[3]_i_3_n_0\,
      \func_reg_reg[2]_9\ => \prod[27]_i_19_n_0\,
      mode_reg_reg => mode_reg_reg_n_0,
      mode_reg_reg_0 => \prod[15]_i_2_n_0\,
      mode_reg_reg_1 => \prod[0]_i_2_n_0\,
      mode_reg_reg_2 => \prod[5]_i_4_n_0\,
      mode_reg_reg_3 => \prod[6]_i_4_n_0\,
      mode_reg_reg_4 => \prod[7]_i_5_n_0\,
      mode_reg_reg_5 => \prod[27]_i_9_n_0\,
      mode_reg_reg_6 => \prod[27]_i_15_n_0\,
      mode_reg_reg_7 => \prod[26]_i_4_n_0\,
      mode_reg_reg_n_0_repN_1_alias => mode_reg_reg_n_0_repN_1,
      mode_reg_reg_n_0_repN_2_alias => mode_reg_reg_n_0_repN_2,
      mode_reg_reg_n_0_repN_3_alias => mode_reg_reg_n_0_repN_3,
      mode_reg_reg_n_0_repN_4_alias => mode_reg_reg_n_0_repN_4,
      mode_reg_reg_n_0_repN_5_alias => mode_reg_reg_n_0_repN_5,
      mode_reg_reg_n_0_repN_alias => mode_reg_reg_n_0_repN,
      \prod_reg[0]\ => inst0_n_16,
      \prod_reg[10]\ => inst0_n_7,
      \prod_reg[11]\ => inst0_n_5,
      \prod_reg[12]\ => inst0_n_33,
      \prod_reg[13]\ => inst0_n_34,
      \prod_reg[14]\ => inst0_n_35,
      \prod_reg[15]\ => inst0_n_1,
      \prod_reg[15]_0\ => inst0_n_4,
      \prod_reg[15]_1\ => inst0_n_36,
      \prod_reg[15]_2\ => inst0_n_42,
      \prod_reg[15]_3\ => inst0_n_43,
      \prod_reg[15]_4\ => inst0_n_45,
      \prod_reg[15]_5\ => inst0_n_46,
      \prod_reg[15]_6\ => inst0_n_47,
      \prod_reg[15]_7\ => inst0_n_48,
      \prod_reg[16]\ => inst0_n_10,
      \prod_reg[17]\ => inst0_n_15,
      \prod_reg[18]\ => inst0_n_8,
      \prod_reg[19]\ => inst0_n_6,
      \prod_reg[1]\ => inst0_n_17,
      \prod_reg[20]\ => inst0_n_0,
      \prod_reg[20]_0\ => inst0_n_25,
      \prod_reg[21]\ => inst0_n_26,
      \prod_reg[22]\ => inst0_n_27,
      \prod_reg[23]\ => inst0_n_2,
      \prod_reg[23]_0\ => inst0_n_3,
      \prod_reg[23]_1\ => inst0_n_28,
      \prod_reg[23]_2\ => inst0_n_37,
      \prod_reg[24]\ => inst0_n_14,
      \prod_reg[25]\ => inst0_n_9,
      \prod_reg[26]\ => inst0_n_49,
      \prod_reg[27]\ => inst0_n_24,
      \prod_reg[27]_0\ => inst0_n_44,
      \prod_reg[27]_1\ => inst0_n_50,
      \prod_reg[28]\ => \NLW_inst0_prod_reg[28]_UNCONNECTED\,
      \prod_reg[28]_0\ => inst0_n_51,
      \prod_reg[28]_repN_alias\ => \prod_reg[28]_repN_alias\,
      \prod_reg[29]\ => inst0_n_52,
      \prod_reg[2]\ => inst0_n_18,
      \prod_reg[30]\ => inst0_n_53,
      \prod_reg[31]\ => inst0_n_54,
      \prod_reg[3]\ => inst0_n_19,
      \prod_reg[4]\ => inst0_n_20,
      \prod_reg[5]\ => inst0_n_21,
      \prod_reg[6]\ => inst0_n_22,
      \prod_reg[7]\ => inst0_n_23,
      \prod_reg[7]_0\(3) => \add_4_inst_lsb/0\,
      \prod_reg[7]_0\(2) => inst0_n_39,
      \prod_reg[7]_0\(1) => inst0_n_40,
      \prod_reg[7]_0\(0) => inst0_n_41,
      \prod_reg[8]\ => inst0_n_13,
      \prod_reg[9]\ => inst0_n_12
    );
mode_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => mode,
      O => mode_IBUF
    );
mode_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => mode_IBUF,
      Q => mode_reg_reg_n_0,
      R => '0'
    );
mode_reg_reg_replica: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => mode_IBUF,
      Q => mode_reg_reg_n_0_repN,
      R => '0'
    );
mode_reg_reg_replica_1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => mode_IBUF,
      Q => mode_reg_reg_n_0_repN_1,
      R => '0'
    );
mode_reg_reg_replica_2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => mode_IBUF,
      Q => mode_reg_reg_n_0_repN_2,
      R => '0'
    );
mode_reg_reg_replica_3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => mode_IBUF,
      Q => mode_reg_reg_n_0_repN_3,
      R => '0'
    );
mode_reg_reg_replica_4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => mode_IBUF,
      Q => mode_reg_reg_n_0_repN_4,
      R => '0'
    );
mode_reg_reg_replica_5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => mode_IBUF,
      Q => mode_reg_reg_n_0_repN_5,
      R => '0'
    );
\prod[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBBBB333F33FF3F"
    )
        port map (
      I0 => \prod[15]_i_4_n_0\,
      I1 => mode_reg_reg_n_0,
      I2 => \prod[0]_i_4_n_0\,
      I3 => inst0_n_48,
      I4 => inst0_n_43,
      I5 => \prod[0]_i_5_n_0\,
      O => \prod[0]_i_2_n_0\
    );
\prod[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"53"
    )
        port map (
      I0 => \prod[8]_i_4_n_0\,
      I1 => \prod[8]_i_3_n_0\,
      I2 => \prod[15]_i_7_n_0\,
      O => \prod[0]_i_3_n_0\
    );
\prod[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF717100"
    )
        port map (
      I0 => inst0_n_46,
      I1 => \add_4_inst_lsb/0\,
      I2 => inst0_n_4,
      I3 => inst0_n_42,
      I4 => inst0_n_47,
      O => \prod[0]_i_4_n_0\
    );
\prod[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => \func_reg_reg_n_0_[0]\,
      I1 => mode_reg_reg_n_0,
      I2 => \func_reg_reg_n_0_[2]\,
      O => \prod[0]_i_5_n_0\
    );
\prod[10]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8AFF8A00"
    )
        port map (
      I0 => \prod[15]_i_5_n_0\,
      I1 => inst0_n_39,
      I2 => \prod[15]_i_6_n_0\,
      I3 => \prod[15]_i_7_n_0\,
      I4 => \prod[10]_i_4_n_0\,
      O => \prod[10]_i_3_n_0\
    );
\prod[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => inst0_n_30,
      I1 => inst0_n_29,
      I2 => \prod[15]_i_5_n_0\,
      I3 => inst0_n_41,
      I4 => \prod[15]_i_6_n_0\,
      I5 => inst0_n_40,
      O => \prod[10]_i_4_n_0\
    );
\prod[11]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => mode_reg_reg_n_0,
      I1 => inst0_n_4,
      I2 => inst0_n_42,
      I3 => a_reg(0),
      I4 => inst0_n_43,
      O => \prod[11]_i_10_n_0\
    );
\prod[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E05555E5E00000"
    )
        port map (
      I0 => \prod[15]_i_7_n_0\,
      I1 => inst0_n_29,
      I2 => \prod[15]_i_6_n_0\,
      I3 => inst0_n_41,
      I4 => \prod[15]_i_5_n_0\,
      I5 => \prod[11]_i_5_n_0\,
      O => \prod[11]_i_3_n_0\
    );
\prod[11]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => inst0_n_40,
      I1 => \prod[15]_i_6_n_0\,
      I2 => inst0_n_39,
      O => \prod[11]_i_5_n_0\
    );
\prod[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5551115144510051"
    )
        port map (
      I0 => \prod[15]_i_7_n_0\,
      I1 => \prod[15]_i_5_n_0\,
      I2 => inst0_n_40,
      I3 => \prod[15]_i_6_n_0\,
      I4 => inst0_n_41,
      I5 => inst0_n_39,
      O => \prod[12]_i_3_n_0\
    );
\prod[13]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54441404"
    )
        port map (
      I0 => \prod[15]_i_7_n_0\,
      I1 => \prod[15]_i_6_n_0\,
      I2 => \prod[15]_i_5_n_0\,
      I3 => inst0_n_39,
      I4 => inst0_n_40,
      O => \prod[13]_i_3_n_0\
    );
\prod[14]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D0"
    )
        port map (
      I0 => \prod[15]_i_6_n_0\,
      I1 => inst0_n_39,
      I2 => \prod[15]_i_5_n_0\,
      I3 => \prod[15]_i_7_n_0\,
      O => \prod[14]_i_3_n_0\
    );
\prod[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDFDFFF"
    )
        port map (
      I0 => mode_reg_reg_n_0,
      I1 => \func_reg_reg_n_0_[0]\,
      I2 => inst0_n_48,
      I3 => inst0_n_43,
      I4 => \prod[15]_i_4_n_0\,
      O => \prod[15]_i_2_n_0\
    );
\prod[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \prod[15]_i_5_n_0\,
      I1 => \prod[15]_i_6_n_0\,
      I2 => \prod[15]_i_7_n_0\,
      O => \prod[15]_i_3_n_0\
    );
\prod[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E800FFE8"
    )
        port map (
      I0 => inst0_n_4,
      I1 => \add_4_inst_lsb/0\,
      I2 => inst0_n_46,
      I3 => inst0_n_42,
      I4 => inst0_n_47,
      O => \prod[15]_i_4_n_0\
    );
\prod[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669699969996669"
    )
        port map (
      I0 => inst0_n_47,
      I1 => inst0_n_42,
      I2 => inst0_n_46,
      I3 => \add_4_inst_lsb/0\,
      I4 => inst0_n_4,
      I5 => \prod[0]_i_5_n_0\,
      O => \prod[15]_i_5_n_0\
    );
\prod[15]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => inst0_n_4,
      I1 => inst0_n_46,
      I2 => \add_4_inst_lsb/0\,
      O => \prod[15]_i_6_n_0\
    );
\prod[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A808ABFB57F75404"
    )
        port map (
      I0 => \prod[0]_i_4_n_0\,
      I1 => \func_reg_reg_n_0_[2]\,
      I2 => mode_reg_reg_n_0,
      I3 => \func_reg_reg_n_0_[0]\,
      I4 => \prod[15]_i_4_n_0\,
      I5 => \prod[15]_i_8_n_0\,
      O => \prod[15]_i_7_n_0\
    );
\prod[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEFEFEFE01"
    )
        port map (
      I0 => a_reg(7),
      I1 => a_reg(5),
      I2 => a_reg(6),
      I3 => b_reg(7),
      I4 => b_reg(5),
      I5 => b_reg(6),
      O => \prod[15]_i_8_n_0\
    );
\prod[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000005F50C0C"
    )
        port map (
      I0 => \prod[9]_i_5_n_0\,
      I1 => \prod[9]_i_4_n_0\,
      I2 => \prod[4]_i_7_n_0\,
      I3 => \prod[5]_i_6_n_0\,
      I4 => \prod[15]_i_7_n_0\,
      I5 => \prod[4]_i_8_n_0\,
      O => \prod[1]_i_3_n_0\
    );
\prod[25]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001D00"
    )
        port map (
      I0 => \func_reg_reg_n_0_[2]\,
      I1 => mode_reg_reg_n_0,
      I2 => \func_reg_reg_n_0_[1]\,
      I3 => inst0_n_1,
      I4 => inst0_n_45,
      O => \prod[25]_i_2_n_0\
    );
\prod[26]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => inst0_n_2,
      I1 => inst0_n_37,
      O => \prod[26]_i_4_n_0\
    );
\prod[27]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => \func_reg_reg_n_0_[1]\,
      I1 => mode_reg_reg_n_0,
      I2 => \func_reg_reg_n_0_[2]\,
      O => \prod[27]_i_12_n_0\
    );
\prod[27]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBBBBB5"
    )
        port map (
      I0 => inst0_n_24,
      I1 => mode_reg_reg_n_0,
      I2 => a_reg(13),
      I3 => a_reg(14),
      I4 => a_reg(15),
      O => \prod[27]_i_15_n_0\
    );
\prod[27]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => inst0_n_3,
      I1 => inst0_n_44,
      O => \prod[27]_i_17_n_0\
    );
\prod[27]_i_18\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => a_reg(15),
      I1 => a_reg(14),
      I2 => a_reg(13),
      O => \prod[27]_i_18_n_0\
    );
\prod[27]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1DFF1D1D"
    )
        port map (
      I0 => \func_reg_reg_n_0_[2]\,
      I1 => mode_reg_reg_n_0,
      I2 => \func_reg_reg_n_0_[1]\,
      I3 => inst0_n_44,
      I4 => inst0_n_1,
      O => \prod[27]_i_19_n_0\
    );
\prod[27]_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10101011"
    )
        port map (
      I0 => a_reg(15),
      I1 => a_reg(14),
      I2 => a_reg(13),
      I3 => a_reg(10),
      I4 => a_reg(11),
      O => \prod[27]_i_20_n_0\
    );
\prod[27]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5E"
    )
        port map (
      I0 => inst0_n_44,
      I1 => mode_reg_reg_n_0,
      I2 => inst0_n_3,
      O => \prod[27]_i_9_n_0\
    );
\prod[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000AFA0C0C"
    )
        port map (
      I0 => \prod[6]_i_6_n_0\,
      I1 => \prod[10]_i_4_n_0\,
      I2 => \prod[4]_i_7_n_0\,
      I3 => \prod[6]_i_7_n_0\,
      I4 => \prod[15]_i_7_n_0\,
      I5 => \prod[4]_i_8_n_0\,
      O => \prod[2]_i_4_n_0\
    );
\prod[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000AFA0C0C"
    )
        port map (
      I0 => \prod[7]_i_9_n_0\,
      I1 => \prod[7]_i_7_n_0\,
      I2 => \prod[4]_i_7_n_0\,
      I3 => \prod[7]_i_8_n_0\,
      I4 => \prod[15]_i_7_n_0\,
      I5 => \prod[4]_i_8_n_0\,
      O => \prod[3]_i_3_n_0\
    );
\prod[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000CCC0D0D"
    )
        port map (
      I0 => \prod[8]_i_4_n_0\,
      I1 => \prod[4]_i_6_n_0\,
      I2 => \prod[4]_i_7_n_0\,
      I3 => \prod[8]_i_3_n_0\,
      I4 => \prod[15]_i_7_n_0\,
      I5 => \prod[4]_i_8_n_0\,
      O => \prod[4]_i_4_n_0\
    );
\prod[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E8000000E8E8E8"
    )
        port map (
      I0 => \prod[15]_i_4_n_0\,
      I1 => inst0_n_43,
      I2 => inst0_n_48,
      I3 => \func_reg_reg_n_0_[0]\,
      I4 => mode_reg_reg_n_0,
      I5 => \func_reg_reg_n_0_[2]\,
      O => \prod[4]_i_6_n_0\
    );
\prod[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CB80FB83"
    )
        port map (
      I0 => \prod[15]_i_4_n_0\,
      I1 => \prod[0]_i_5_n_0\,
      I2 => inst0_n_43,
      I3 => inst0_n_48,
      I4 => \prod[0]_i_4_n_0\,
      O => \prod[4]_i_7_n_0\
    );
\prod[4]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20A2FFFF"
    )
        port map (
      I0 => \func_reg_reg_n_0_[0]\,
      I1 => inst0_n_43,
      I2 => inst0_n_48,
      I3 => \prod[0]_i_4_n_0\,
      I4 => mode_reg_reg_n_0,
      O => \prod[4]_i_8_n_0\
    );
\prod[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0011110F001F1F"
    )
        port map (
      I0 => \prod[0]_i_2_n_0\,
      I1 => \prod[9]_i_5_n_0\,
      I2 => \prod[15]_i_2_n_0\,
      I3 => \prod[9]_i_4_n_0\,
      I4 => \prod[15]_i_7_n_0\,
      I5 => \prod[5]_i_6_n_0\,
      O => \prod[5]_i_4_n_0\
    );
\prod[5]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \prod[15]_i_5_n_0\,
      I1 => \prod[15]_i_6_n_0\,
      I2 => inst0_n_32,
      O => \prod[5]_i_6_n_0\
    );
\prod[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0044440F004F4F"
    )
        port map (
      I0 => \prod[0]_i_2_n_0\,
      I1 => \prod[6]_i_6_n_0\,
      I2 => \prod[15]_i_2_n_0\,
      I3 => \prod[10]_i_4_n_0\,
      I4 => \prod[15]_i_7_n_0\,
      I5 => \prod[6]_i_7_n_0\,
      O => \prod[6]_i_4_n_0\
    );
\prod[6]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \prod[15]_i_5_n_0\,
      I1 => inst0_n_39,
      I2 => \prod[15]_i_6_n_0\,
      O => \prod[6]_i_6_n_0\
    );
\prod[6]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \prod[15]_i_5_n_0\,
      I1 => inst0_n_31,
      I2 => \prod[15]_i_6_n_0\,
      I3 => inst0_n_32,
      O => \prod[6]_i_7_n_0\
    );
\prod[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444405FF0505"
    )
        port map (
      I0 => \prod[15]_i_2_n_0\,
      I1 => \prod[7]_i_7_n_0\,
      I2 => \prod[7]_i_8_n_0\,
      I3 => \prod[0]_i_2_n_0\,
      I4 => \prod[7]_i_9_n_0\,
      I5 => \prod[15]_i_7_n_0\,
      O => \prod[7]_i_5_n_0\
    );
\prod[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => inst0_n_29,
      I1 => inst0_n_41,
      I2 => \prod[15]_i_5_n_0\,
      I3 => inst0_n_40,
      I4 => \prod[15]_i_6_n_0\,
      I5 => inst0_n_39,
      O => \prod[7]_i_7_n_0\
    );
\prod[7]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F5F5303F"
    )
        port map (
      I0 => inst0_n_32,
      I1 => inst0_n_31,
      I2 => \prod[15]_i_6_n_0\,
      I3 => inst0_n_30,
      I4 => \prod[15]_i_5_n_0\,
      O => \prod[7]_i_8_n_0\
    );
\prod[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \prod[15]_i_6_n_0\,
      I1 => \prod[15]_i_5_n_0\,
      O => \prod[7]_i_9_n_0\
    );
\prod[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"001B"
    )
        port map (
      I0 => \prod[15]_i_7_n_0\,
      I1 => \prod[8]_i_3_n_0\,
      I2 => \prod[8]_i_4_n_0\,
      I3 => \prod[15]_i_2_n_0\,
      O => \prod[8]_i_2_n_0\
    );
\prod[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505F3030505F3F3F"
    )
        port map (
      I0 => inst0_n_32,
      I1 => inst0_n_31,
      I2 => \prod[15]_i_5_n_0\,
      I3 => inst0_n_30,
      I4 => \prod[15]_i_6_n_0\,
      I5 => inst0_n_29,
      O => \prod[8]_i_3_n_0\
    );
\prod[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"303F5050"
    )
        port map (
      I0 => inst0_n_39,
      I1 => inst0_n_41,
      I2 => \prod[15]_i_6_n_0\,
      I3 => inst0_n_40,
      I4 => \prod[15]_i_5_n_0\,
      O => \prod[8]_i_4_n_0\
    );
\prod[9]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => b_reg(15),
      I1 => b_reg(14),
      I2 => b_reg(13),
      O => \prod[9]_i_11_n_0\
    );
\prod[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"002E"
    )
        port map (
      I0 => \prod[9]_i_4_n_0\,
      I1 => \prod[15]_i_7_n_0\,
      I2 => \prod[9]_i_5_n_0\,
      I3 => \prod[15]_i_2_n_0\,
      O => \prod[9]_i_2_n_0\
    );
\prod[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => inst0_n_31,
      I1 => inst0_n_30,
      I2 => \prod[15]_i_5_n_0\,
      I3 => inst0_n_29,
      I4 => \prod[15]_i_6_n_0\,
      I5 => inst0_n_41,
      O => \prod[9]_i_4_n_0\
    );
\prod[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"503F"
    )
        port map (
      I0 => inst0_n_40,
      I1 => inst0_n_39,
      I2 => \prod[15]_i_5_n_0\,
      I3 => \prod[15]_i_6_n_0\,
      O => \prod[9]_i_5_n_0\
    );
\prod_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(0),
      O => prod(0)
    );
\prod_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(10),
      O => prod(10)
    );
\prod_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(11),
      O => prod(11)
    );
\prod_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(12),
      O => prod(12)
    );
\prod_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(13),
      O => prod(13)
    );
\prod_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(14),
      O => prod(14)
    );
\prod_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(15),
      O => prod(15)
    );
\prod_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(16),
      O => prod(16)
    );
\prod_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(17),
      O => prod(17)
    );
\prod_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(18),
      O => prod(18)
    );
\prod_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(19),
      O => prod(19)
    );
\prod_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(1),
      O => prod(1)
    );
\prod_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(20),
      O => prod(20)
    );
\prod_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(21),
      O => prod(21)
    );
\prod_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(22),
      O => prod(22)
    );
\prod_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(23),
      O => prod(23)
    );
\prod_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(24),
      O => prod(24)
    );
\prod_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(25),
      O => prod(25)
    );
\prod_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(26),
      O => prod(26)
    );
\prod_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(27),
      O => prod(27)
    );
\prod_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(28),
      O => prod(28)
    );
\prod_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(29),
      O => prod(29)
    );
\prod_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(2),
      O => prod(2)
    );
\prod_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(30),
      O => prod(30)
    );
\prod_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(31),
      O => prod(31)
    );
\prod_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(3),
      O => prod(3)
    );
\prod_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(4),
      O => prod(4)
    );
\prod_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(5),
      O => prod(5)
    );
\prod_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(6),
      O => prod(6)
    );
\prod_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(7),
      O => prod(7)
    );
\prod_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(8),
      O => prod(8)
    );
\prod_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => prod_OBUF(9),
      O => prod(9)
    );
\prod_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_16,
      Q => prod_OBUF(0),
      R => '0'
    );
\prod_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_7,
      Q => prod_OBUF(10),
      R => '0'
    );
\prod_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_5,
      Q => prod_OBUF(11),
      R => '0'
    );
\prod_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_33,
      Q => prod_OBUF(12),
      R => '0'
    );
\prod_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_34,
      Q => prod_OBUF(13),
      R => '0'
    );
\prod_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_35,
      Q => prod_OBUF(14),
      R => '0'
    );
\prod_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_36,
      Q => prod_OBUF(15),
      R => '0'
    );
\prod_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_10,
      Q => prod_OBUF(16),
      R => '0'
    );
\prod_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_15,
      Q => prod_OBUF(17),
      R => '0'
    );
\prod_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_8,
      Q => prod_OBUF(18),
      R => '0'
    );
\prod_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_6,
      Q => prod_OBUF(19),
      R => '0'
    );
\prod_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_17,
      Q => prod_OBUF(1),
      R => '0'
    );
\prod_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_25,
      Q => prod_OBUF(20),
      R => inst0_n_0
    );
\prod_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_26,
      Q => prod_OBUF(21),
      R => inst0_n_0
    );
\prod_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_27,
      Q => prod_OBUF(22),
      R => inst0_n_0
    );
\prod_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_28,
      Q => prod_OBUF(23),
      R => inst0_n_0
    );
\prod_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_14,
      Q => prod_OBUF(24),
      R => '0'
    );
\prod_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_9,
      Q => prod_OBUF(25),
      R => '0'
    );
\prod_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_49,
      Q => prod_OBUF(26),
      R => '0'
    );
\prod_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_50,
      Q => prod_OBUF(27),
      R => '0'
    );
\prod_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_51,
      Q => prod_OBUF(28),
      R => \prod_reg[28]_repN_alias\
    );
\prod_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_52,
      Q => prod_OBUF(29),
      R => \prod_reg[28]_repN_alias\
    );
\prod_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_18,
      Q => prod_OBUF(2),
      R => '0'
    );
\prod_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_53,
      Q => prod_OBUF(30),
      R => \prod_reg[28]_repN_alias\
    );
\prod_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_54,
      Q => prod_OBUF(31),
      R => \prod_reg[28]_repN_alias\
    );
\prod_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_19,
      Q => prod_OBUF(3),
      R => '0'
    );
\prod_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_20,
      Q => prod_OBUF(4),
      R => '0'
    );
\prod_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_21,
      Q => prod_OBUF(5),
      R => '0'
    );
\prod_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_22,
      Q => prod_OBUF(6),
      R => '0'
    );
\prod_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_23,
      Q => prod_OBUF(7),
      R => '0'
    );
\prod_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_13,
      Q => prod_OBUF(8),
      R => '0'
    );
\prod_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => inst0_n_12,
      Q => prod_OBUF(9),
      R => '0'
    );
end STRUCTURE;
