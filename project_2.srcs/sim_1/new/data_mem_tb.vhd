library ieee;
use ieee.std_logic_1164.all;

entity data_mem_tb is
end entity;

architecture behavioral of data_mem_tb is
  -- Constant declaration
  constant N_tb : integer := 5;
  constant M_tb : integer := 32;
  -- Component declaration
  component data_mem is
    -- generic (
    --   N : integer := 5;
    --   M : integer := 32
    -- );
    port (
      address    : in std_logic_vector(N_tb - 1 downto 0);
      write_data : in std_logic_vector(M_tb - 1 downto 0);
      clk        : in std_logic;
      we         : in std_logic;
      read_data  : out std_logic_vector(M_tb - 1 downto 0)
    );
  end component;
  -- Signal declaration
  signal address_tb    : std_logic_vector(N_tb - 1 downto 0);
  signal write_data_tb : std_logic_vector(M_tb - 1 downto 0);
  signal clk_tb        : std_logic;
  signal we_tb         : std_logic;
  signal read_data_tb  : std_logic_vector(M_tb - 1 downto 0);
  -- clk period
  constant clk_period : time := 20 ns; -- let signals propage in timing simulation
begin
  -- Instantiate the unit under test
  utt : data_mem
  --   generic map(
  --     N => N_tb,
  --     M => M_tb
  --   )
  port map(
    address    => address_tb,
    write_data => write_data_tb,
    clk        => clk_tb,
    we         => we_tb,
    read_data  => read_data_tb
  );

  -- Clock generation
  clock : process
  begin
    clk_tb <= '1';
    wait for clk_period /2;
    clk_tb <= '0';
    wait for clk_period /2;
  end process clock;

  -- Stimulus process
  stimuli : process
  begin
    wait for 100 ns;

    wait for clk_period / 2;
    -- Write logic
    we_tb         <= '1';
    address_tb    <= "00000";
    write_data_tb <= "00000000000000000000000000000000";
    wait for clk_period / 2;

    wait for clk_period / 2;
    -- Write logic
    we_tb         <= '1';
    address_tb    <= "00001";
    write_data_tb <= "00000000000000000000000000000001";
    wait for clk_period / 2;

    -- Write logic
    wait for clk_period / 2;
    we_tb         <= '0';
    address_tb    <= "00010";
    write_data_tb <= "00000000000000000000000000000010";
    wait for clk_period / 2;

    wait for clk_period / 2;
    -- Read logic
    we_tb      <= '0';
    address_tb <= "00000";
    wait for clk_period / 2;

    wait for clk_period / 2;
    -- Write logic
    we_tb         <= '1';
    address_tb    <= "00011";
    write_data_tb <= "00000000000000000000000000000011";
    wait for clk_period / 2;

    wait for clk_period / 2;
    -- Read logic
    we_tb      <= '0';
    address_tb <= "00001";
    wait for clk_period / 2;

    wait for clk_period / 2;
    -- Read logic
    we_tb      <= '0';
    address_tb <= "00010";
    wait for clk_period / 2;

    wait for clk_period / 2;
    -- Read logic
    we_tb      <= '0';
    address_tb <= "00011";
    wait for clk_period / 2;

    wait;
  end process stimuli;

end architecture behavioral;