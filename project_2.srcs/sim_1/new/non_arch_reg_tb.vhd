library ieee;
use ieee.std_logic_1164.all;

entity non_arch_reg_tb is
end entity non_arch_reg_tb;

architecture sim of non_arch_reg_tb is
  -- Constant declaration
  constant N_tb : integer := 32;
  -- Component declaration
  component non_arch_reg
    -- generic (
    --   N : integer := 32
    -- );
    port (
      clk : in std_logic;
      d   : in std_logic_vector (N_tb - 1 downto 0);
      q   : out std_logic_vector (N_tb - 1 downto 0)
    );
  end component non_arch_reg;
  -- Signal declaration
  signal clk_tb : std_logic;
  signal d_tb   : std_logic_vector (N_tb - 1 downto 0);
  signal q_tb   : std_logic_vector (N_tb - 1 downto 0);
  -- clk period
  constant clk_period : time := 10 ns;
begin
  -- Instatiate the unit under test
  uut : non_arch_reg
  --   generic map(
  --     N => N_tb
  --   )
  port map
  (
    clk => clk_tb,
    d   => d_tb,
    q   => q_tb
  );
  -- Clock generation
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
    wait for clk_period / 4;
    d_tb <= "00000000000000000000000000000000";
    wait for clk_period;
    d_tb <= "00000000000000000000000000000001";
    wait for clk_period;
    d_tb <= "00000000000000000000000000000010";
    wait for clk_period;
    d_tb <= "00000000000000000000000000000100";
    wait;
  end process stimuli;
end architecture sim;