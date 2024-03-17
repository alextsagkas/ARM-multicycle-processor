library ieee;
use ieee.std_logic_1164.all;

entity processor_tb is
end entity processor_tb;

architecture sim of processor_tb is
  -- Constant Declaration
  constant N_tb : integer := 32;

  -- Component declaration
  component processor is
    -- generic (
    --   N : integer := N_tb
    -- );
    port (
      clk        : in std_logic;
      reset      : in std_logic;
      pc         : out std_logic_vector(7 downto 0);
      instr      : out std_logic_vector(N_tb - 1 downto 0);
      alu_result : out std_logic_vector(N_tb - 1 downto 0);
      write_data : out std_logic_vector(N_tb - 1 downto 0);
      result     : out std_logic_vector(N_tb - 1 downto 0)
    );
  end component processor;

  -- Signal Declaration 
  signal clk_tb        : std_logic;
  signal reset_tb      : std_logic;
  signal pc_tb         : std_logic_vector(7 downto 0);
  signal instr_tb      : std_logic_vector(N_tb - 1 downto 0);
  signal alu_result_tb : std_logic_vector(N_tb - 1 downto 0);
  signal write_data_tb : std_logic_vector(N_tb - 1 downto 0);
  signal result_tb     : std_logic_vector(N_tb - 1 downto 0);

  -- clk period 
  constant clk_period : time := 10 ns;
begin
  -- Component Instantiation
  uut : processor
  -- generic map (
  --   N => N_tb
  -- )
  port map(
    clk        => clk_tb,
    reset      => reset_tb,
    pc         => pc_tb,
    instr      => instr_tb,
    alu_result => alu_result_tb,
    write_data => write_data_tb,
    result     => result_tb
  );

  -- Clock Generation
  clock : process
  begin
    clk_tb <= '0';
    wait for clk_period / 2;
    clk_tb <= '1';
    wait for clk_period / 2;
  end process clock;

  -- Stimulus Process
  stimuli : process
  begin
    reset_tb <= '1';
    wait for 100 ns;
    reset_tb <= '0';

    wait;
  end process stimuli;
end architecture sim;