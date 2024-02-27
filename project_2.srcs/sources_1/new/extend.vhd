library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extend is
  generic (
    N : integer := 32
  );
  port (
    data_in  : in std_logic_vector(23 downto 0);
    sel      : in std_logic_vector(1 downto 0);
    data_out : out std_logic_vector(N - 1 downto 0)
  );
end entity extend;

architecture behavioral of extend is
begin
  process (data_in, sel)
  begin
    case sel is
        -- Extend 8-bit unsigned immediate for data processing
      when "00" => data_out <= std_logic_vector(resize(unsigned(data_in(7 downto 0)), N));
        -- Extend 12-bit unsigned immediate for LDR/STR
      when "01" => data_out <= std_logic_vector(resize(unsigned(data_in(11 downto 0)), N));
        -- Extend 24-bit signed immediate multiplied by 4 for B/BL
      when "10" => data_out <= std_logic_vector(resize(signed(data_in) * 4, N));
        -- Set output to zero when unintented input is given
      when others => data_out <= (others => '0');
    end case;
  end process;
end architecture behavioral;