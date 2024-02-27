library ieee;
use ieee.std_logic_1164.all;

entity add_4_tb is
end entity add_4_tb;

architecture sim of add_4_tb is
  -- Constant declaration
  constant N_tb : integer := 32;
  -- Component declaration
  component add_4
    -- generic (
    --   N : integer := 32
    -- );
    port (
      input_1  : in std_logic_vector(N_tb - 1 downto 0);
      input_2  : in std_logic_vector(N_tb - 1 downto 0);
      output_1 : out std_logic_vector(N_tb - 1 downto 0)
    );
  end component add_4;
  -- Singnal declaration
  signal input_1_tb  : std_logic_vector(N_tb - 1 downto 0);
  signal input_2_tb  : std_logic_vector(N_tb - 1 downto 0);
  signal output_1_tb : std_logic_vector(N_tb - 1 downto 0);
begin
  -- Instantiate the unit under test
  utt : add_4
  --   generic map(
  --     N => N_tb
  --   )
  port map(
    input_1  => input_1_tb,
    input_2  => input_2_tb,
    output_1 => output_1_tb
  );
  -- Stimulus process
  stimuli : process
  begin
    wait for 100 ns;
    input_1_tb <= "00000000000000000000000000000000";
    input_2_tb <= "00000000000000000000000000000100";
    wait for 10 ns;
    input_1_tb <= "00000000000000000000000000000001";
    input_2_tb <= "00000000000000000000000000000100";
    wait for 10 ns;
    input_1_tb <= "00000000000000000000000000000010";
    input_2_tb <= "00000000000000000000000000000100";
    wait for 10 ns;
    input_1_tb <= "00000000000000000000000000000011";
    input_2_tb <= "00000000000000000000000000000100";
    wait;
  end process;
end architecture sim;