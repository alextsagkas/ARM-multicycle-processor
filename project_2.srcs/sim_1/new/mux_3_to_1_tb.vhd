library ieee;
use ieee.std_logic_1164.all;

entity mux_3_to_1_tb is
end entity mux_3_to_1_tb;

architecture sim of mux_3_to_1_tb is
  -- Constant declaration
  constant N_tb : integer := 32;
  -- Component declaration
  component mux_3_to_1
    -- generic (
    --   N : integer := 32
    -- );
    port (
      input_1  : in std_logic_vector(N_tb - 1 downto 0);
      input_2  : in std_logic_vector(N_tb - 1 downto 0);
      input_3  : in std_logic_vector(N_tb - 1 downto 0);
      sel      : in std_logic_vector(1 downto 0);
      output_1 : out std_logic_vector(N_tb - 1 downto 0)
    );
  end component mux_3_to_1;
  -- Singnal declaration
  signal input_1_tb  : std_logic_vector(N_tb - 1 downto 0);
  signal input_2_tb  : std_logic_vector(N_tb - 1 downto 0);
  signal input_3_tb  : std_logic_vector(N_tb - 1 downto 0);
  signal sel_tb      : std_logic_vector(1 downto 0);
  signal output_1_tb : std_logic_vector(N_tb - 1 downto 0);
begin
  -- Instantiate the unit under test
  utt : mux_3_to_1
  --   generic map(
  --     N => N_tb
  --   )
  port map(
    input_1  => input_1_tb,
    input_2  => input_2_tb,
    input_3  => input_3_tb,
    sel      => sel_tb,
    output_1 => output_1_tb
  );
  -- Stimulus process
  stimuli : process
  begin
    wait for 100 ns;
    input_1_tb <= "00000000000000000000000000000000";
    input_2_tb <= "00000000000000000000000000000001";
    input_3_tb <= "00000000000000000000000000000010";
    sel_tb     <= "00";
    wait for 10 ns;
    input_1_tb <= "00000000000000000000000000000000";
    input_2_tb <= "00000000000000000000000000000001";
    input_3_tb <= "00000000000000000000000000000010";
    sel_tb     <= "01";
    wait for 10 ns;
    input_1_tb <= "00000000000000000000000000000000";
    input_2_tb <= "00000000000000000000000000000001";
    input_3_tb <= "00000000000000000000000000000010";
    sel_tb     <= "10";
    wait for 10 ns;
    input_1_tb <= "00000000000000000000000000000000";
    input_2_tb <= "00000000000000000000000000000001";
    input_3_tb <= "00000000000000000000000000000010";
    sel_tb     <= "11";
    wait;
  end process;
end architecture sim;