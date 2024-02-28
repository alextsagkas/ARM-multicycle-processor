library ieee;
use ieee.std_logic_1164.all;
use work.string_pkg.all;

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
    -- Procedure to report errors
    procedure report_errors (
      data_in          : in std_logic_vector(23 downto 0);
      sel              : in std_logic_vector(1 downto 0);
      data_out         : in std_logic_vector(N_tb - 1 downto 0);
      data_out_correct : in std_logic_vector(N_tb - 1 downto 0)) is
    begin
      if (data_out /= data_out_correct) then
        assert false
        report
          "data_in = " & to_bstring(data_in) & ", " &
          "sel = " & to_bstring(sel) & " | " &
          "data_out = " & to_bstring(data_out) & ", " &
          "data_out_correct = " & to_bstring(data_out_correct)
          severity failure;
      end if;
    end procedure report_errors;

    -- Apply test
    procedure test (
      data_in          : in std_logic_vector(23 downto 0);
      sel              : in std_logic_vector(1 downto 0);
      data_out_correct : in std_logic_vector(N_tb - 1 downto 0)) is
    begin
      wait for 10 ns;
      data_in_tb <= data_in;
      sel_tb     <= sel;

      wait for 15 ns; -- get the timing simulation time to settle the signals
      report_errors(
      data_in          => data_in,
      sel              => sel,
      data_out         => data_out_tb,
      data_out_correct => data_out_correct);
    end procedure test;
  begin
    wait for 100 ns;

    test (
    data_in          => "111111111111011101111111",
    sel              => "00",
    data_out_correct => "00000000000000000000000001111111"
    );

    test (
    data_in          => "111111111111011101111111",
    sel              => "01",
    data_out_correct => "00000000000000000000011101111111"
    );

    test (
    data_in          => "111111111111011101111111",
    sel              => "10",
    data_out_correct => "11111111111111111101110111111100"
    );

    test (
    data_in          => "111111111111011101111111",
    sel              => "11",
    data_out_correct => "00000000000000000000000000000000"
    );

    report "Testbench finished successfully!";
    wait;
  end process stimuli;

end architecture sim;