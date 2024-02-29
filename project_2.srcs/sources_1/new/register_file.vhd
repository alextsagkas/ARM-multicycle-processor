library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
  generic (
    N : integer := 4;
    M : integer := 32
  );
  port (
    address_1    : in std_logic_vector(N - 1 downto 0);
    address_2    : in std_logic_vector(N - 1 downto 0);
    address_3    : in std_logic_vector(N - 1 downto 0);
    write_data_3 : in std_logic_vector(M - 1 downto 0);
    R15          : in std_logic_vector(M - 1 downto 0);
    clk          : in std_logic;
    we_3         : in std_logic;
    read_data_1  : out std_logic_vector(M - 1 downto 0);
    read_data_2  : out std_logic_vector(M - 1 downto 0)
  );
end entity register_file;

architecture behavioral of register_file is
  -- There is no register R15 on the register file, thus the array hold 2 ** N - 2 registers
  type rf_array is array (0 to 2 ** N - 2) of std_logic_vector(M - 1 downto 0);
  -- R0 - R14
  signal rf : rf_array;
begin
  -- Read data from the register file
  asynch_read : process (address_1, address_2, R15)
  begin
    -- Address 1
    address_1_case : case address_1 is
      when "1111" =>
        read_data_1 <= R15;
      when others =>
        read_data_1 <= rf(to_integer(unsigned(address_1)));
    end case address_1_case;
    -- Address 2
    address_2_case : case address_2 is
      when "1111" =>
        read_data_2 <= R15;
      when others =>
        read_data_2 <= rf(to_integer(unsigned(address_2)));
    end case address_2_case;
  end process asynch_read;
  -- Write data to register file
  synch_write : process (clk)
  begin
    if rising_edge(clk) then
      if we_3 = '1' then
        -- address_3 cannot be "1111"
        rf(to_integer(unsigned(address_3))) <= write_data_3;
      end if;
    end if;
  end process synch_write;
end architecture behavioral;