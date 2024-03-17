library ieee;
use ieee.std_logic_1164.all;

entity status_reg_tb is
end entity status_reg_tb;

architecture sim of status_reg_tb is
  -- Constant declaration
  constant N_tb : integer := 4;
  -- Component declaration
  component status_reg
    -- generic (
    --   N : integer := 4
    -- );
    port (
      clk : in std_logic;
      rst : in std_logic;
      we  : in std_logic;
      d   : in std_logic_vector(N_tb - 1 downto 0);
      q   : out std_logic_vector(N_tb - 1 downto 0)
    );
  end component status_reg;
  -- Singal declaratino
  signal clk_tb : std_logic;
  signal rst_tb : std_logic;
  signal we_tb  : std_logic;
  signal d_tb   : std_logic_vector(N_tb - 1 downto 0);
  signal q_tb   : std_logic_vector(N_tb - 1 downto 0);
  -- clk period
  constant clk_period : time := 10 ns;
begin
  -- Instantiate the unit under test
  utt : status_reg
  -- generic map(
  --   N => N_tb
  -- )
  port map(
    clk => clk_tb,
    rst => rst_tb,
    we  => we_tb,
    d   => d_tb,
    q   => q_tb
  );

  -- Generate clock
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
    rst_tb <= '1';
    wait for 100 ns;

    wait for clk_period /2;
    rst_tb <= '0';
    we_tb  <= '1';
    d_tb   <= "0001";
    wait for clk_period /2;

    wait for clk_period /2;
    rst_tb <= '0';
    we_tb  <= '0';
    d_tb   <= "0010";
    wait for clk_period /2;

    wait for clk_period /2;
    rst_tb <= '0';
    we_tb  <= '1';
    d_tb   <= "0011";
    wait for clk_period /2;

    wait for clk_period /2;
    rst_tb <= '0';
    we_tb  <= '0';
    d_tb   <= "0100";
    wait for clk_period /2;

    wait;
  end process stimuli;
end architecture sim;