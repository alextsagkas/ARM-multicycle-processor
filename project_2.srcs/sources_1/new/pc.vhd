library ieee;
use ieee.std_logic_1164.all;

entity pc is
  generic (
    N : integer := 32
  );
  port (
    clk   : in std_logic;
    reset : in std_logic;
    we    : in std_logic;
    d     : in std_logic_vector(N - 1 downto 0);
    q     : out std_logic_vector(N - 1 downto 0)
  );
end entity pc;

architecture behavioral of pc is
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        q <= (others => '0');
      elsif we = '1' then
        q <= d;
      end if;
    end if;
  end process;
end architecture behavioral;