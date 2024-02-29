library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file_tb is
end entity register_file_tb;

architecture sim of register_file_tb is
  -- Constant declaration
  constant N_tb : integer := 4;
  constant M_tb : integer := 32;
  -- Component declaration
  component register_file
    -- generic (
    --   N : integer := 4;
    --   M : integer := 32
    -- );
    port (
      address_1    : in std_logic_vector(N_tb - 1 downto 0);
      address_2    : in std_logic_vector(N_tb - 1 downto 0);
      address_3    : in std_logic_vector(N_tb - 1 downto 0);
      write_data_3 : in std_logic_vector(M_tb - 1 downto 0);
      R15          : in std_logic_vector(M_tb - 1 downto 0);
      clk          : in std_logic;
      we_3         : in std_logic;
      read_data_1  : out std_logic_vector(M_tb - 1 downto 0);
      read_data_2  : out std_logic_vector(M_tb - 1 downto 0)
    );
  end component register_file;
  -- Signal declaration
  signal address_1_tb    : std_logic_vector(N_tb - 1 downto 0);
  signal address_2_tb    : std_logic_vector(N_tb - 1 downto 0);
  signal address_3_tb    : std_logic_vector(N_tb - 1 downto 0);
  signal write_data_3_tb : std_logic_vector(M_tb - 1 downto 0);
  signal R15_tb          : std_logic_vector(M_tb - 1 downto 0);
  signal clk_tb          : std_logic;
  signal we_3_tb         : std_logic;
  signal read_data_1_tb  : std_logic_vector(M_tb - 1 downto 0);
  signal read_data_2_tb  : std_logic_vector(M_tb - 1 downto 0);
  -- clk period
  constant clk_period : time := 10 ns;
begin
  -- Instantiate unit under test
  utt : register_file
  --   generic map(
  --     N => N,
  --     M => M
  --   )
  port map(
    address_1    => address_1_tb,
    address_2    => address_2_tb,
    address_3    => address_3_tb,
    write_data_3 => write_data_3_tb,
    R15          => R15_tb,
    clk          => clk_tb,
    we_3         => we_3_tb,
    read_data_1  => read_data_1_tb,
    read_data_2  => read_data_2_tb
  );
  -- Clock process
  clock : process
  begin
    clk_tb <= '1';
    wait for clk_period / 2;
    clk_tb <= '0';
    wait for clk_period / 2;
  end process clock;
  -- Stimulus process
  stimuli : process
  begin
    wait for 100 ns;
    -- PC = 0
    R15_tb <= (others => '0');

    wait for clk_period / 2;
    -- Write logic
    we_3_tb         <= '1';
    address_3_tb    <= "0000";
    write_data_3_tb <= "00000000000000000000000000000000";
    wait for clk_period / 2;

    -- PC = 4
    R15_tb <= std_logic_vector(unsigned(R15_tb) + 4);

    wait for clk_period / 2;
    -- Write logic
    we_3_tb         <= '1';
    address_3_tb    <= "0001";
    write_data_3_tb <= "00000000000000000000000000000001";
    wait for clk_period / 2;

    -- PC = 8
    R15_tb <= std_logic_vector(unsigned(R15_tb) + 4);

    wait for clk_period / 2;
    -- Write logic
    we_3_tb         <= '0';
    address_3_tb    <= "0010";
    write_data_3_tb <= "00000000000000000000000000000010";
    wait for clk_period / 2;

    -- PC = 12
    R15_tb <= std_logic_vector(unsigned(R15_tb) + 4);

    wait for clk_period / 2;
    -- Read logic
    address_1_tb <= "0000";
    address_2_tb <= "0001";
    wait for clk_period / 2;

    -- PC = 16
    R15_tb <= std_logic_vector(unsigned(R15_tb) + 4);

    wait for clk_period / 2;
    -- Write logic
    we_3_tb         <= '1';
    address_3_tb    <= "0011";
    write_data_3_tb <= "00000000000000000000000000000011";
    wait for clk_period / 2;

    -- PC = 20
    R15_tb <= std_logic_vector(unsigned(R15_tb) + 4);

    wait for clk_period / 2;
    -- Read logic
    address_1_tb <= "1111";
    address_2_tb <= "0010";
    wait for clk_period / 2;

    wait;
  end process stimuli;
end architecture sim;