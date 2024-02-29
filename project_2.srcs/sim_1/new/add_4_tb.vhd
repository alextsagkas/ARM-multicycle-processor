library ieee;
use ieee.std_logic_1164.all;
use work.string_pkg.all;

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
    -- Procedure to report errors
    procedure report_errors (
      input_1          : in std_logic_vector (N_tb - 1 downto 0);
      input_2          : in std_logic_vector (N_tb - 1 downto 0);
      output_1         : in std_logic_vector (N_tb - 1 downto 0);
      output_1_correct : in std_logic_vector (N_tb - 1 downto 0)) is
    begin
      if (output_1 /= output_1_correct) then
        assert false
        report
          "input_1 = 0b" & to_bstring(input_1) & ", " &
          "input_2 = 0b" & to_bstring(input_2) & " | " &
          "output_1 = 0b" & to_bstring(output_1) & ", " &
          "output_1_correct = 0b" & to_bstring(output_1_correct)
          severity failure;
      end if;
    end procedure report_errors;

    -- Apply test
    procedure test (
      input_1          : in std_logic_vector (N_tb - 1 downto 0);
      input_2          : in std_logic_vector (N_tb - 1 downto 0);
      output_1_correct : in std_logic_vector (N_tb - 1 downto 0)) is
    begin
      wait for 10 ns;
      input_1_tb <= input_1;
      input_2_tb <= input_2;

      wait for 15 ns; -- get the timing simulation time to settle the signals
      report_errors(
      input_1          => input_1,
      input_2          => input_2,
      output_1         => output_1_tb,
      output_1_correct => output_1_correct);
    end procedure test;
  begin
    wait for 100 ns;

    test (
    input_1          => "00000000000000000000000000000000",
    input_2          => "00000000000000000000000000000100",
    output_1_correct => "00000000000000000000000000000100"
    );

    test (
    input_1          => "00000000000000000000000000000001",
    input_2          => "00000000000000000000000000000100",
    output_1_correct => "00000000000000000000000000000101"
    );

    test (
    input_1          => "00000000000000000000000000000010",
    input_2          => "00000000000000000000000000000100",
    output_1_correct => "00000000000000000000000000000110"
    );

    test (
    input_1          => "00000000000000000000000000000011",
    input_2          => "00000000000000000000000000000100",
    output_1_correct => "00000000000000000000000000000111"
    );

    report "Testbench finished successfully!";

    wait;
  end process stimuli;
end architecture sim;