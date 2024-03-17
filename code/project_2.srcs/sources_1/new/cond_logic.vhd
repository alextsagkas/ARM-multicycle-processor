library ieee;
use ieee.std_logic_1164.all;

entity cond_logic is
  port (
    cond       : in std_logic_vector(3 downto 0);
    flags      : in std_logic_vector(3 downto 0); -- (N, Z, C, V)
    cond_ex_in : out std_logic
  );
end entity cond_logic;

architecture behavioral of cond_logic is
begin
  process (cond, flags)
  begin
    case cond is
      when "0000" =>
        cond_ex_in <= flags(2);
      when "0001" =>
        cond_ex_in <= not flags(2);
      when "0010" =>
        cond_ex_in <= flags(1);
      when "0011" =>
        cond_ex_in <= not flags(1);
      when "0100" =>
        cond_ex_in <= flags(3);
      when "0101" =>
        cond_ex_in <= not flags(3);
      when "0110" =>
        cond_ex_in <= flags(0);
      when "0111" =>
        cond_ex_in <= not flags(0);
      when "1000" =>
        cond_ex_in <= (not flags(2)) and flags(1);
      when "1001" =>
        cond_ex_in <= flags(2) or (not flags(1));
      when "1010" =>
        cond_ex_in <= not (flags(3) xor flags(0));
      when "1011" =>
        cond_ex_in <= flags(3) xor flags(0);
      when "1100" =>
        cond_ex_in <= (not flags(2)) and (not (flags(3) xor flags(0)));
      when "1101" =>
        cond_ex_in <= flags(2) or (flags(3) xor flags(0));
      when "1110" =>
        cond_ex_in <= '1';
      when "1111" =>
        cond_ex_in <= '1';
      when others =>
        cond_ex_in <= '0';
    end case;
  end process;
end architecture behavioral;