library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_mem_tb is
end entity instr_mem_tb;

architecture sim of instr_mem_tb is
  -- Constant declaration
  constant N_tb : integer := 6;
  constant M_tb : integer := 32;
  -- Component declaration
  component instr_mem
    -- generic (
    --   N : integer := 6;
    --   M : integer := 32
    -- );
    port (
      address : in std_logic_vector(N_tb - 1 downto 0);
      data    : out std_logic_vector(M_tb - 1 downto 0)
    );
  end component instr_mem;
  -- Signal declaration
  signal address_tb : std_logic_vector(N_tb - 1 downto 0);
  signal data_tb    : std_logic_vector(M_tb - 1 downto 0);
begin
  -- Instantiate the unit under test
  uut : instr_mem
  --   generic map(
  --     N => N_tb,
  --     M => M_tb
  --   )
  port map(
    address => address_tb,
    data    => data_tb
  );
  -- Stimulus process
  stimuli : process
  begin
    wait for 100 ns;
    -- loop trough all addresses of ROM 
    for address_counter in 0 to 2 ** N_tb loop
      address_tb <= std_logic_vector(to_unsigned(address_counter, N_tb));
      wait for 10 ns;
    end loop;
    wait;
  end process;
end architecture sim;