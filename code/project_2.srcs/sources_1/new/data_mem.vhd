library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_mem is
  generic (
    N : integer := 5;
    M : integer := 32
  );
  port (
    address    : in std_logic_vector(N - 1 downto 0);
    write_data : in std_logic_vector(M - 1 downto 0);
    clk        : in std_logic;
    we         : in std_logic;
    read_data  : out std_logic_vector(M - 1 downto 0)
  );
end entity data_mem;

architecture behavioral of data_mem is
  type data_mem_array is array (0 to 2 ** N - 1) of std_logic_vector(M - 1 downto 0);
  signal data_mem : data_mem_array;
begin
  -- Read data from the data memory
  asynch_read : process (address)
  begin
    read_data <= data_mem(to_integer(unsigned(address)));
  end process asynch_read;
  -- Write data to data memory
  synch_write : process (clk, write_data, we, address)
  begin
    if rising_edge(clk) then
      if we = '1' then
        data_mem(to_integer(unsigned(address))) <= write_data;
      end if;
    end if;
  end process synch_write;
end architecture;