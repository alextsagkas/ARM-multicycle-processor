library ieee;
use ieee.std_logic_1164.all;

entity extend_tb is
end entity extend_tb;

architecture sim of extend_tb is
  -- Constant declaration 
  constant N_tb : integer := 32;
  -- Component declaration
  component extend is
    -- generic (
    --   N : integer := 32
    -- );
    port (
      data_in  : in std_logic_vector(23 downto 0);
      sel      : in std_logic_vector(1 downto 0);
      data_out : out std_logic_vector(N_tb - 1 downto 0)
    );
  end component extend;
  -- Singal declaration
  signal data_in_tb  : std_logic_vector(23 downto 0);
  signal sel_tb      : std_logic_vector(1 downto 0);
  signal data_out_tb : std_logic_vector(N_tb - 1 downto 0);
begin
  -- Instantiate the unit under test
  utt : extend
  --   generic map(
  --     N => N_tb
  --   )
  port map(
    data_in  => data_in_tb,
    sel      => sel_tb,
    data_out => data_out_tb
  );
  -- Stimulus process
  stimuli : process
  begin
    wait for 100 ns;
    data_in_tb <= "111111111111111111111111";
    sel_tb     <= "00";
    wait for 10 ns;
    data_in_tb <= "111111111111111111111111";
    sel_tb     <= "01";
    wait for 10 ns;
    data_in_tb <= "111111111111111111111111";
    sel_tb     <= "10";
    wait for 10 ns;
    data_in_tb <= "111111111111111111111111";
    sel_tb     <= "11";
    wait;
  end process stimuli;

end architecture sim;