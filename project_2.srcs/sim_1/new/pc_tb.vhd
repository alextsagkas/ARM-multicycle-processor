library ieee;
use ieee.std_logic_1164.all;

entity pc_tb is
end pc_tb;

architecture sim of pc_tb is
  -- Constant declaration
  constant N_tb : integer := 32;
  -- Component desclaration
  component pc
    -- generic (
    --   N : integer := 32
    -- );
    port (
      clk   : in std_logic;
      reset : in std_logic;
      we    : in std_logic;
      d     : in std_logic_vector(N_tb - 1 downto 0);
      q     : out std_logic_vector(N_tb - 1 downto 0)
    );
  end component pc;
  -- Signal Declaration
  signal clk_tb   : std_logic;
  signal reset_tb : std_logic;
  signal we_tb    : std_logic;
  signal d_tb     : std_logic_vector(N_tb - 1 downto 0);
  signal q_tb     : std_logic_vector(N_tb - 1 downto 0);
  -- clk period
  constant clk_period : time := 10 ns;
begin
  -- Instantiate the unit under test
  uut : pc
  --   generic map(
  --     N => N_tb
  --   )
  port map(
    clk   => clk_tb,
    reset => reset_tb,
    we    => we_tb,
    d     => d_tb,
    q     => q_tb
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
    reset_tb <= '1';
    wait for 100 ns;
    reset_tb <= '0';
    wait for clk_period / 4;
    we_tb <= '1';
    d_tb  <= "00000000000000000000000000000000";
    wait for clk_period;
    we_tb <= '0';
    d_tb  <= "00000000000000000000000000000010";
    wait for clk_period;
    we_tb <= '1';
    d_tb  <= "00000000000000000000000000000100";
    wait for clk_period;
    we_tb <= '0';
    d_tb  <= "00000000000000000000000000001000";
    wait;
  end process stimuli;
end architecture sim;