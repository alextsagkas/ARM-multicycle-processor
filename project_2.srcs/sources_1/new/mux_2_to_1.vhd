library ieee;
use ieee.std_logic_1164.all;

entity mux_2_to_1 is
  generic (
    N : integer := 32
  );
  port (
    input_1  : in std_logic_vector(N - 1 downto 0);
    input_2  : in std_logic_vector(N - 1 downto 0);
    sel      : in std_logic;
    output_1 : out std_logic_vector(N - 1 downto 0)
  );
end entity mux_2_to_1;

architecture behavioral of mux_2_to_1 is
begin
  mux2to1 : process (input_1, input_2, sel)
  begin
    case sel is
      when '0' => output_1    <= input_1;
      when '1' => output_1    <= input_2;
      when others => output_1 <= (others => 'X');
    end case;
  end process mux2to1;
end architecture behavioral;