library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.string_pkg.all;

entity alu_tb is
end alu_tb;

architecture sim of alu_tb is
  -- Constant declaration
  constant N_tb : integer := 32;
  -- Component declaration
  component alu is
    -- generic (
    --   N : integer := 32
    -- );
    port (
      source_1 : in std_logic_vector(N_tb - 1 downto 0);
      source_2 : in std_logic_vector(N_tb - 1 downto 0);
      shamt5   : in std_logic_vector(4 downto 0);
      control  : in std_logic_vector(2 downto 0);
      result   : out std_logic_vector(N_tb - 1 downto 0);
      flags    : out std_logic_vector(3 downto 0) -- N, Z, C, V
    );
  end component alu;
  -- Singal declaration
  signal source_1_tb : std_logic_vector(N_tb - 1 downto 0);
  signal source_2_tb : std_logic_vector(N_tb - 1 downto 0);
  signal shamt5_tb   : std_logic_vector(4 downto 0);
  signal control_tb  : std_logic_vector(2 downto 0);
  signal result_tb   : std_logic_vector(N_tb - 1 downto 0);
  signal flags_tb    : std_logic_vector(3 downto 0);
begin
  -- Instantiate the unit under test
  utt : alu
  --   generic map(
  --     N => N_tb
  --   )
  port map(
    source_1 => source_1_tb,
    source_2 => source_2_tb,
    shamt5   => shamt5_tb,
    control  => control_tb,
    result   => result_tb,
    flags    => flags_tb
  );
  -- Stimulus process
  stimuli : process
    -- Procedure to report errors
    procedure report_errors (
      source_1       : in std_logic_vector (N_tb - 1 downto 0);
      source_2       : in std_logic_vector (N_tb - 1 downto 0);
      shamt5         : in std_logic_vector (4 downto 0);
      control        : in std_logic_vector (2 downto 0);
      result         : in std_logic_vector (N_tb - 1 downto 0);
      result_correct : in std_logic_vector (N_tb - 1 downto 0);
      flags          : in std_logic_vector (3 downto 0);
      flags_correct  : in std_logic_vector (3 downto 0)) is
    begin
      if (
        result_correct /= result or
        flags_correct /= flags
        ) then
        assert false
        report
          "source_1 = 0b" & to_bstring(source_1) & ", " &
          "source_2 = 0b" & to_bstring(source_2) & ", " &
          "shamt5 = 0b" & to_bstring(shamt5) & ", " &
          "control = 0b" & to_bstring(control) & " | " &
          "result = 0b" & to_bstring(result) & ", " &
          "result_correct = 0b" & to_bstring(result_correct) & " | " &
          "flags = 0b" & to_bstring(flags) & ", " &
          "flags_correct = 0b" & to_bstring(flags_correct)
          severity failure;
      end if;
    end procedure report_errors;

    -- Apply test
    procedure test (
      source_1       : in std_logic_vector (N_tb - 1 downto 0);
      source_2       : in std_logic_vector (N_tb - 1 downto 0);
      shamt5         : in std_logic_vector (4 downto 0);
      control        : in std_logic_vector (2 downto 0);
      result_correct : in std_logic_vector (N_tb - 1 downto 0);
      flags_correct  : in std_logic_vector (3 downto 0)) is
    begin
      wait for 10 ns;
      source_1_tb <= source_1;
      source_2_tb <= source_2;
      shamt5_tb   <= shamt5;
      control_tb  <= control;

      wait for 15 ns; -- get the timing simulation time to settle the signals
      report_errors(
      source_1       => source_1,
      source_2       => source_2,
      shamt5         => shamt5,
      control        => control,
      result         => result_tb,
      result_correct => result_correct,
      flags          => flags_tb,
      flags_correct  => flags_correct);
    end procedure test;
  begin
    wait for 100 ns;

    -- Addition --

    -- Positive
    test(
    source_1       => "01000000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00000",
    control        => "000",
    result_correct => "01100000000000000000000000000000",
    flags_correct  => "0000");
    -- Negative
    test(
    source_1       => "01000000000000000000000000000000",
    source_2       => "10100000000000000000000000000000",
    shamt5         => "00000",
    control        => "000",
    result_correct => "11100000000000000000000000000000",
    flags_correct  => "1000");
    -- Zero
    test(
    source_1       => "00100000000000000000000000000000",
    source_2       => "11100000000000000000000000000000",
    shamt5         => "00000",
    control        => "000",
    result_correct => "00000000000000000000000000000000",
    flags_correct  => "0110");
    -- Overflow
    test(
    source_1       => "01100000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00000",
    control        => "000",
    result_correct => "10000000000000000000000000000000",
    flags_correct  => "1001");
    -- Underflow
    test(
    source_1       => "10000000000000000000000000000000",
    source_2       => "11100000000000000000000000000000",
    shamt5         => "00000",
    control        => "000",
    result_correct => "01100000000000000000000000000000",
    flags_correct  => "0011");

    -- Subtraction --

    -- Positive
    test(
    source_1       => "01000000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00000",
    control        => "001",
    result_correct => "00100000000000000000000000000000",
    flags_correct  => "0010");
    -- Negative
    test(
    source_1       => "00100000000000000000000000000000",
    source_2       => "01100000000000000000000000000000",
    shamt5         => "00000",
    control        => "001",
    result_correct => "11000000000000000000000000000000",
    flags_correct  => "1000");
    -- Zero
    test(
    source_1       => "00100000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00000",
    control        => "001",
    result_correct => "00000000000000000000000000000000",
    flags_correct  => "0110");
    -- Overflow
    test(
    source_1       => "01100000000000000000000000000000",
    source_2       => "11100000000000000000000000000000",
    shamt5         => "00000",
    control        => "001",
    result_correct => "10000000000000000000000000000000",
    flags_correct  => "1001");
    -- Underflow
    test(
    source_1       => "10000000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00000",
    control        => "001",
    result_correct => "01100000000000000000000000000000",
    flags_correct  => "0011");

    -- AND --

    -- Positive
    test(
    source_1       => "10100000000000000000000000000000",
    source_2       => "01100000000000000000000000000000",
    shamt5         => "00000",
    control        => "010",
    result_correct => "00100000000000000000000000000000",
    flags_correct  => "0000");
    -- Zero
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "11100000000000000000000000000000",
    shamt5         => "00000",
    control        => "010",
    result_correct => "00000000000000000000000000000000",
    flags_correct  => "0100");
    -- Negative
    test(
    source_1       => "10100000000000000000000000000000",
    source_2       => "10000000000000000000000000000000",
    shamt5         => "00000",
    control        => "010",
    result_correct => "10000000000000000000000000000000",
    flags_correct  => "1000");

    -- XOR --

    -- Positive
    test(
    source_1       => "11100000000000000000000000000000",
    source_2       => "10100000000000000000000000000000",
    shamt5         => "00000",
    control        => "011",
    result_correct => "01000000000000000000000000000000",
    flags_correct  => "0000");
    -- Zero
    test(
    source_1       => "11100000000000000000000000000000",
    source_2       => "11100000000000000000000000000000",
    shamt5         => "00000",
    control        => "011",
    result_correct => "00000000000000000000000000000000",
    flags_correct  => "0100");
    -- Negative
    test(
    source_1       => "01000000000000000000000000000000",
    source_2       => "11100000000000000000000000000000",
    shamt5         => "00000",
    control        => "011",
    result_correct => "10100000000000000000000000000000",
    flags_correct  => "1000");

    -- MOV & NOP --

    -- MOV
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "01000000000000000000000000000000",
    shamt5         => "00000",
    control        => "100",
    result_correct => "01000000000000000000000000000000",
    flags_correct  => "0000");
    -- NOP
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "00000000000000000000000000000000",
    shamt5         => "00000",
    control        => "100",
    result_correct => "00000000000000000000000000000000",
    flags_correct  => "0000");

    -- MVN --

    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "10000000000000000000000000000000",
    shamt5         => "00000",
    control        => "101",
    result_correct => "01111111111111111111111111111111",
    flags_correct  => "0000");

    -- Logical Operations --

    -- LSL
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00001",
    control        => "110",
    result_correct => "01000000000000000000000000000000",
    flags_correct  => "0000");
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00010",
    control        => "110",
    result_correct => "10000000000000000000000000000000",
    flags_correct  => "0000");
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "00100000000000000000000000000000",
    shamt5         => "00011",
    control        => "110",
    result_correct => "00000000000000000000000000000000",
    flags_correct  => "0000");
    -- ASR
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "10000000000000000000000000000000",
    shamt5         => "00001",
    control        => "111",
    result_correct => "11000000000000000000000000000000",
    flags_correct  => "0000");
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "10000000000000000000000000000000",
    shamt5         => "00010",
    control        => "111",
    result_correct => "11100000000000000000000000000000",
    flags_correct  => "0000");
    test(
    source_1       => "00000000000000000000000000000000",
    source_2       => "10000000000000000000000000000000",
    shamt5         => "00011",
    control        => "111",
    result_correct => "11110000000000000000000000000000",
    flags_correct  => "0000");

    report "Testbench finished successfully!";
    wait;
  end process stimuli;
end architecture sim;