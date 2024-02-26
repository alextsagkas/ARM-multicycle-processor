library ieee;
use ieee.std_logic_1164.all;

entity mux_3_to_1 is
  generic (N : integer := 32);
  port (
    input_1  : in std_logic_vector(N - 1 downto 0);
    input_2  : in std_logic_vector(N - 1 downto 0);
    input_3  : in std_logic_vector(N - 1 downto 0);
    sel      : in std_logic_vector(1 downto 0);
    output_1 : out std_logic_vector(N - 1 downto 0)
  );
end entity mux_3_to_1;

architecture behavioral of mux_3_to_1 is
begin
  mux3to1 : process (input_1, input_2, input_3, sel)
  begin
    case sel is
      when "00" => output_1   <= input_1;
      when "01" => output_1   <= input_2;
      when "10" => output_1   <= input_3;
      when others => output_1 <= (others => 'X');
    end case;
  end process mux3to1;
end architecture behavioral;