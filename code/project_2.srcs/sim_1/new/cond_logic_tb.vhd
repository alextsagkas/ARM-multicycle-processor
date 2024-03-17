library ieee;
use ieee.std_logic_1164.all;
use work.string_pkg.all;

entity cond_logic_tb is
end entity cond_logic_tb;

architecture sim of cond_logic_tb is
  -- Component declaration
  component cond_logic
    port (
      cond       : in std_logic_vector(3 downto 0);
      flags      : in std_logic_vector(3 downto 0); -- (N, Z, C, V)
      cond_ex_in : out std_logic
    );
  end component cond_logic;
  -- Signal declaration
  signal cond_tb       : std_logic_vector(3 downto 0);
  signal flags_tb      : std_logic_vector(3 downto 0); -- (N, Z, C, V)
  signal cond_ex_in_tb : std_logic;
begin
  -- Instantiate the unit under test
  utt : cond_logic
  port map
  (
    cond       => cond_tb,
    flags      => flags_tb,
    cond_ex_in => cond_ex_in_tb
  );

  -- Stimulus process
  stimuli : process
    -- Procedure to report errors
    procedure report_errors (
      cond               : in std_logic_vector(3 downto 0);
      flags              : in std_logic_vector(3 downto 0);
      cond_ex_in         : in std_logic;
      cond_ex_in_correct : in std_logic) is
    begin
      if (cond_ex_in /= cond_ex_in_correct) then
        assert false
        report
          "cond = " & to_bstring(cond) & ", " &
          "flags = " & to_bstring(flags) & " | " &
          "cond_ex_in = " & to_bstring(cond_ex_in) & ", " &
          "cond_ex_in_correct = " & to_bstring(cond_ex_in_correct)
          severity failure;
      end if;
    end procedure report_errors;

    -- Apply test
    procedure test (
      cond       : in std_logic_vector(3 downto 0);
      flags      : in std_logic_vector(3 downto 0);
      cond_ex_in : in std_logic) is
    begin
      wait for 10 ns;
      cond_tb  <= cond;
      flags_tb <= flags;

      wait for 15 ns; -- get the timing simulation time to settle the signals
      report_errors(
      cond               => cond,
      flags              => flags,
      cond_ex_in         => cond_ex_in_tb,
      cond_ex_in_correct => cond_ex_in);
    end procedure test;
  begin
    wait for 100 ns;

    -- 0000
    test(
    cond       => "0000",
    flags      => "0100",
    cond_ex_in => '1');
    test(
    cond       => "0000",
    flags      => "0000",
    cond_ex_in => '0');

    -- 0001
    test(
    cond       => "0001",
    flags      => "0100",
    cond_ex_in => '0');
    test(
    cond       => "0001",
    flags      => "0000",
    cond_ex_in => '1');

    -- 0010
    test(
    cond       => "0010",
    flags      => "0110",
    cond_ex_in => '1');
    test(
    cond       => "0010",
    flags      => "0000",
    cond_ex_in => '0');

    -- 0011
    test(
    cond       => "0011",
    flags      => "0110",
    cond_ex_in => '0');
    test(
    cond       => "0011",
    flags      => "0001",
    cond_ex_in => '1');

    -- 0100
    test(
    cond       => "0100",
    flags      => "1110",
    cond_ex_in => '1');
    test(
    cond       => "0100",
    flags      => "0010",
    cond_ex_in => '0');

    -- 0101
    test(
    cond       => "0101",
    flags      => "0110",
    cond_ex_in => '1');
    test(
    cond       => "0101",
    flags      => "1010",
    cond_ex_in => '0');

    -- 0110
    test(
    cond       => "0110",
    flags      => "1111",
    cond_ex_in => '1');
    test(
    cond       => "0110",
    flags      => "0010",
    cond_ex_in => '0');

    -- 0111
    test(
    cond       => "0111",
    flags      => "1110",
    cond_ex_in => '1');
    test(
    cond       => "0111",
    flags      => "0011",
    cond_ex_in => '0');

    -- 1000
    test(
    cond       => "1000",
    flags      => "0000",
    cond_ex_in => '0');
    test(
    cond       => "1000",
    flags      => "0010",
    cond_ex_in => '1');
    test(
    cond       => "1000",
    flags      => "0100",
    cond_ex_in => '0');
    test(
    cond       => "1000",
    flags      => "0110",
    cond_ex_in => '0');

    -- 1001
    test(
    cond       => "1001",
    flags      => "0000",
    cond_ex_in => '1');
    test(
    cond       => "1001",
    flags      => "0010",
    cond_ex_in => '0');
    test(
    cond       => "1001",
    flags      => "0100",
    cond_ex_in => '1');
    test(
    cond       => "1001",
    flags      => "0110",
    cond_ex_in => '1');

    -- 1010
    test(
    cond       => "1010",
    flags      => "0000",
    cond_ex_in => '1');
    test(
    cond       => "1010",
    flags      => "0111",
    cond_ex_in => '0');
    test(
    cond       => "1010",
    flags      => "1000",
    cond_ex_in => '0');
    test(
    cond       => "1010",
    flags      => "1111",
    cond_ex_in => '1');

    -- 1011
    test(
    cond       => "1011",
    flags      => "0000",
    cond_ex_in => '0');
    test(
    cond       => "1011",
    flags      => "0111",
    cond_ex_in => '1');
    test(
    cond       => "1011",
    flags      => "1000",
    cond_ex_in => '1');
    test(
    cond       => "1011",
    flags      => "1111",
    cond_ex_in => '0');

    -- 1100
    test(
    cond       => "1100",
    flags      => "0000",
    cond_ex_in => '1');
    test(
    cond       => "1100",
    flags      => "0011",
    cond_ex_in => '0');
    test(
    cond       => "1100",
    flags      => "1000",
    cond_ex_in => '0');
    test(
    cond       => "1100",
    flags      => "1011",
    cond_ex_in => '1');
    test(
    cond       => "1100",
    flags      => "0100",
    cond_ex_in => '0');
    test(
    cond       => "1100",
    flags      => "0111",
    cond_ex_in => '0');
    test(
    cond       => "1100",
    flags      => "1100",
    cond_ex_in => '0');
    test(
    cond       => "1100",
    flags      => "1111",
    cond_ex_in => '0');

    -- 1101
    test(
    cond       => "1101",
    flags      => "0000",
    cond_ex_in => '0');
    test(
    cond       => "1101",
    flags      => "0011",
    cond_ex_in => '1');
    test(
    cond       => "1101",
    flags      => "1000",
    cond_ex_in => '1');
    test(
    cond       => "1101",
    flags      => "1011",
    cond_ex_in => '0');
    test(
    cond       => "1101",
    flags      => "0100",
    cond_ex_in => '1');
    test(
    cond       => "1101",
    flags      => "0111",
    cond_ex_in => '1');
    test(
    cond       => "1101",
    flags      => "1101",
    cond_ex_in => '1');
    test(
    cond       => "1101",
    flags      => "1111",
    cond_ex_in => '1');

    -- 1110
    test(
    cond       => "1110",
    flags      => "0101",
    cond_ex_in => '1');

    -- 1111
    test(
    cond       => "1111",
    flags      => "0101",
    cond_ex_in => '1');

    report "Testbench finished successfully!";
    wait;
  end process stimuli;
end architecture;