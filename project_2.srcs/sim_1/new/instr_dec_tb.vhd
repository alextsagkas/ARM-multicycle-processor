library ieee;
use ieee.std_logic_1164.all;
use work.string_pkg.all;
use work.dont_care_pkg.all;

entity instr_dec_tb is
end instr_dec_tb;

architecture sim of instr_dec_tb is
  -- Component declaration
  component instr_dec is
    port (
      op          : in std_logic_vector(1 downto 0);
      funct       : in std_logic_vector(5 downto 0);
      reg_src     : out std_logic_vector(2 downto 0);
      alu_src     : out std_logic;
      imm_src     : out std_logic_vector(1 downto 0);
      alu_control : out std_logic_vector(2 downto 0);
      mem_to_reg  : out std_logic;
      no_write_in : out std_logic
    );
  end component instr_dec;
  -- Signal declaration
  signal op_tb          : std_logic_vector(1 downto 0);
  signal funct_tb       : std_logic_vector(5 downto 0);
  signal reg_src_tb     : std_logic_vector(2 downto 0);
  signal alu_src_tb     : std_logic;
  signal imm_src_tb     : std_logic_vector(1 downto 0);
  signal alu_control_tb : std_logic_vector(2 downto 0);
  signal mem_to_reg_tb  : std_logic;
  signal no_write_in_tb : std_logic;
begin
  -- Instantiate unit under test
  utt : instr_dec
  port map(
    op          => op_tb,
    funct       => funct_tb,
    reg_src     => reg_src_tb,
    alu_src     => alu_src_tb,
    imm_src     => imm_src_tb,
    alu_control => alu_control_tb,
    mem_to_reg  => mem_to_reg_tb,
    no_write_in => no_write_in_tb
  );

  -- Stimulus process
  stimuli : process

    -- Procedure to report errors
    procedure report_errors (
      op                  : in std_logic_vector(1 downto 0);
      funct               : in std_logic_vector(5 downto 0);
      reg_src             : in std_logic_vector(2 downto 0);
      reg_src_correct     : in std_logic_vector(2 downto 0);
      alu_src             : in std_logic;
      alu_src_correct     : in std_logic;
      imm_src             : in std_logic_vector(1 downto 0);
      imm_src_correct     : in std_logic_vector(1 downto 0);
      alu_control         : in std_logic_vector(2 downto 0);
      alu_control_correct : in std_logic_vector(2 downto 0);
      mem_to_reg          : in std_logic;
      mem_to_reg_correct  : in std_logic;
      no_write_in         : in std_logic;
      no_write_in_correct : in std_logic) is
    begin
      if (
        compare_dont_care(reg_src, reg_src_correct) or
        compare_dont_care(alu_src, alu_src_correct) or
        compare_dont_care(imm_src, imm_src_correct) or
        compare_dont_care(alu_control, alu_control_correct) or
        compare_dont_care(mem_to_reg, mem_to_reg_correct) or
        compare_dont_care(no_write_in, no_write_in_correct)) then
        assert false
        report
          "op = " & to_bstring(op) & ", " &
          "funct = " & to_bstring(funct) & " | " &
          "reg_src = " & to_bstring(reg_src) & ", " &
          "reg_src_correct = " & to_bstring(reg_src_correct) & " | " &
          "alu_src = " & to_bstring(alu_src) & ", " &
          "alu_src_correct = " & to_bstring(alu_src_correct) & " | " &
          "imm_src = " & to_bstring(imm_src) & ", " &
          "imm_src_correct = " & to_bstring(imm_src_correct) & " | " &
          "alu_control = " & to_bstring(alu_control) & ", " &
          "alu_control_correct = " & to_bstring(alu_control_correct) & " | " &
          "mem_to_reg = " & to_bstring(mem_to_reg) & ", " &
          "mem_to_reg_correct = " & to_bstring(mem_to_reg_correct) & " | " &
          "no_write_in = " & to_bstring(no_write_in) & " | " &
          "no_write_in_correct = " & to_bstring(no_write_in_correct)
          severity failure;
      end if;
    end procedure report_errors;

    -- Apply test
    procedure test (
      op                  : in std_logic_vector(1 downto 0);
      funct               : in std_logic_vector(5 downto 0);
      reg_src_correct     : in std_logic_vector(2 downto 0);
      alu_src_correct     : in std_logic;
      imm_src_correct     : in std_logic_vector(1 downto 0);
      alu_control_correct : in std_logic_vector(2 downto 0);
      mem_to_reg_correct  : in std_logic;
      no_write_in_correct : in std_logic) is
    begin
      wait for 10 ns;
      op_tb    <= op;
      funct_tb <= funct;

      wait for 15 ns; -- get the timing simulation time to settle the signals
      report_errors(
      op                  => op,
      funct               => funct,
      reg_src             => reg_src_tb,
      reg_src_correct     => reg_src_correct,
      alu_src             => alu_src_tb,
      alu_src_correct     => alu_src_correct,
      imm_src             => imm_src_tb,
      imm_src_correct     => imm_src_correct,
      alu_control         => alu_control_tb,
      alu_control_correct => alu_control_correct,
      mem_to_reg          => mem_to_reg_tb,
      mem_to_reg_correct  => mem_to_reg_correct,
      no_write_in         => no_write_in_tb,
      no_write_in_correct => no_write_in_correct);
    end procedure test;
  begin
    wait for 100 ns;

    -- ADD
    test(
    op                  => "00",
    funct               => "10100-",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "00",
    alu_control_correct => "000",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- ADD
    test(
    op                  => "00",
    funct               => "00100-",
    reg_src_correct     => "000",
    alu_src_correct     => '0',
    imm_src_correct     => "--",
    alu_control_correct => "000",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- SUB
    test(
    op                  => "00",
    funct               => "10010-",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "00",
    alu_control_correct => "001",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- SUB
    test(
    op                  => "00",
    funct               => "00010-",
    reg_src_correct     => "000",
    alu_src_correct     => '0',
    imm_src_correct     => "--",
    alu_control_correct => "001",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- CMP
    test(
    op                  => "00",
    funct               => "110101",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "00",
    alu_control_correct => "001",
    mem_to_reg_correct  => '-',
    no_write_in_correct => '1');
    -- CMP
    test(
    op                  => "00",
    funct               => "010101",
    reg_src_correct     => "000",
    alu_src_correct     => '0',
    imm_src_correct     => "--",
    alu_control_correct => "001",
    mem_to_reg_correct  => '-',
    no_write_in_correct => '1');
    -- AND
    test(
    op                  => "00",
    funct               => "10000-",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "00",
    alu_control_correct => "010",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- AND
    test(
    op                  => "00",
    funct               => "00000-",
    reg_src_correct     => "000",
    alu_src_correct     => '0',
    imm_src_correct     => "--",
    alu_control_correct => "010",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- XOR
    test(
    op                  => "00",
    funct               => "10001-",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "00",
    alu_control_correct => "011",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- XOR
    test(
    op                  => "00",
    funct               => "00001-",
    reg_src_correct     => "000",
    alu_src_correct     => '0',
    imm_src_correct     => "--",
    alu_control_correct => "011",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- MOV / NOP
    test(
    op                  => "00",
    funct               => "111010",
    reg_src_correct     => "0--",
    alu_src_correct     => '1',
    imm_src_correct     => "00",
    alu_control_correct => "100",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- MOV / NOP / LSL / ASR
    test(
    op                  => "00",
    funct               => "011010",
    reg_src_correct     => "00-",
    alu_src_correct     => '0',
    imm_src_correct     => "--",
    alu_control_correct => "100",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- MVN
    test(
    op                  => "00",
    funct               => "111110",
    reg_src_correct     => "0--",
    alu_src_correct     => '1',
    imm_src_correct     => "00",
    alu_control_correct => "101",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- MVN
    test(
    op                  => "00",
    funct               => "011110",
    reg_src_correct     => "00-",
    alu_src_correct     => '0',
    imm_src_correct     => "--",
    alu_control_correct => "101",
    mem_to_reg_correct  => '0',
    no_write_in_correct => '0');
    -- LDR
    test(
    op                  => "01",
    funct               => "011001",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "01",
    alu_control_correct => "000",
    mem_to_reg_correct  => '1',
    no_write_in_correct => '0');
    -- LDR
    test(
    op                  => "01",
    funct               => "010001",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "01",
    alu_control_correct => "001",
    mem_to_reg_correct  => '1',
    no_write_in_correct => '0');
    -- STR
    test(
    op                  => "01",
    funct               => "011000",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "01",
    alu_control_correct => "000",
    mem_to_reg_correct  => '-',
    no_write_in_correct => '0');
    -- STR
    test(
    op                  => "01",
    funct               => "010000",
    reg_src_correct     => "0-0",
    alu_src_correct     => '1',
    imm_src_correct     => "01",
    alu_control_correct => "001",
    mem_to_reg_correct  => '-',
    no_write_in_correct => '0');
    -- B
    test(
    op                  => "10",
    funct               => "10----",
    reg_src_correct     => "--1",
    alu_src_correct     => '1',
    imm_src_correct     => "10",
    alu_control_correct => "000",
    mem_to_reg_correct  => '-',
    no_write_in_correct => '0');
    -- BL
    test(
    op                  => "10",
    funct               => "11----",
    reg_src_correct     => "1-1",
    alu_src_correct     => '1',
    imm_src_correct     => "10",
    alu_control_correct => "000",
    mem_to_reg_correct  => '-',
    no_write_in_correct => '0');
    report "Testbench finished successfully!";

    wait;
  end process stimuli;

end architecture sim;