library ieee;
use ieee.std_logic_1164.all;
use work.string_pkg.all;

entity fsm_tb is
end entity fsm_tb;

architecture sim of fsm_tb is
  -- Component declaration
  component fsm is
    port (
      op          : in std_logic_vector(1 downto 0);
      s_or_l      : in std_logic;
      r_d         : in std_logic_vector(3 downto 0);
      no_write_in : in std_logic;
      cond_ex_in  : in std_logic;
      ir_write    : out std_logic;
      reg_write   : out std_logic;
      ma_write    : out std_logic;
      mem_write   : out std_logic;
      flags_write : out std_logic;
      pc_src      : out std_logic_vector(1 downto 0);
      pc_write    : out std_logic
    );
  end component fsm;
  -- Signal declaration
  signal op_tb          : std_logic_vector(1 downto 0);
  signal s_or_l_tb      : std_logic;
  signal r_d_tb         : std_logic_vector(3 downto 0);
  signal no_write_in_tb : std_logic;
  signal cond_ex_in_tb  : std_logic;
  signal ir_write_tb    : std_logic;
  signal reg_write_tb   : std_logic;
  signal ma_write_tb    : std_logic;
  signal mem_write_tb   : std_logic;
  signal flags_write_tb : std_logic;
  signal pc_src_tb      : std_logic_vector(1 downto 0);
  signal pc_write_tb    : std_logic;
begin
  -- Instantaite unit under test
  uut : fsm
  port map(
    op          => op_tb,
    s_or_l      => s_or_l_tb,
    r_d         => r_d_tb,
    no_write_in => no_write_in_tb,
    cond_ex_in  => cond_ex_in_tb,
    ir_write    => ir_write_tb,
    reg_write   => reg_write_tb,
    ma_write    => ma_write_tb,
    mem_write   => mem_write_tb,
    flags_write => flags_write_tb,
    pc_src      => pc_src_tb,
    pc_write    => pc_write_tb
  );

  -- Stimulus process
  simuli : process

    -- Procedure to report errors
    procedure report_errors (
      op                  : in std_logic_vector(1 downto 0);
      s_or_l              : in std_logic;
      r_d                 : in std_logic_vector(3 downto 0);
      no_write_in         : in std_logic;
      cond_ex_in          : in std_logic;
      ir_write            : in std_logic;
      ir_write_correct    : in std_logic;
      reg_write           : in std_logic;
      reg_write_correct   : in std_logic;
      ma_write            : in std_logic;
      ma_write_correct    : in std_logic;
      mem_write           : in std_logic;
      mem_write_correct   : in std_logic;
      flags_write         : in std_logic;
      flags_write_correct : in std_logic;
      pc_src              : in std_logic_vector(1 downto 0);
      pc_src_correct      : in std_logic_vector(1 downto 0);
      pc_write            : in std_logic;
      pc_write_correct    : in std_logic) is

    begin
      if (
        ir_write /= ir_write_correct or
        reg_write /= reg_write_correct or
        ma_write /= ma_write_correct or
        mem_write /= mem_write_correct or
        flags_write /= flags_write_correct or
        pc_src /= pc_src_correct or
        pc_write /= pc_write_correct) then
        assert false
        report
          "op = " & to_bstring(op) & ", " &
          "s_or_l = " & to_bstring(s_or_l) & ", " &
          "r_d = " & to_bstring(r_d) & ", " &
          "no_write_in = " & to_bstring(no_write_in) & ", " &
          "cond_ex_in = " & to_bstring(cond_ex_in) & " | " &
          "ir_write = " & to_bstring(ir_write) & ", " &
          "ir_write_correct = " & to_bstring(ir_write_correct) & " | " &
          "reg_write = " & to_bstring(reg_write) & ", " &
          "reg_write_correct = " & to_bstring(reg_write_correct) & " | " &
          "ma_write = " & to_bstring(ma_write) & ", " &
          "ma_write_correct = " & to_bstring(ma_write_correct) & " | " &
          "mem_write = " & to_bstring(mem_write) & ", " &
          "mem_write_correct = " & to_bstring(mem_write_correct) & " | " &
          "flags_write = " & to_bstring(flags_write) & ", " &
          "flags_write_correct = " & to_bstring(flags_write_correct) & " | " &
          "pc_src = " & to_bstring(pc_src) & ", " &
          "pc_src_correct = " & to_bstring(pc_src_correct) & " | " &
          "pc_write = " & to_bstring(pc_write) & ", " &
          "pc_write_correct = " & to_bstring(pc_write_correct)
          severity failure;
      end if;
    end procedure report_errors;

    -- Apply test
    procedure test (
      op          : in std_logic_vector(1 downto 0);
      s_or_l      : in std_logic;
      r_d         : in std_logic_vector(3 downto 0);
      no_write_in : in std_logic;
      cond_ex_in  : in std_logic;
      ir_write    : out std_logic;
      reg_write   : out std_logic;
      ma_write    : out std_logic;
      mem_write   : out std_logic;
      flags_write : out std_logic;
      pc_src      : out std_logic_vector(1 downto 0);
      pc_write    : out std_logic) is
    begin
      wait for 10 ns;
      op_tb          <= op;
      s_or_l_tb      <= s_or_l;
      r_d_tb         <= r_d;
      no_write_in_tb <= no_write_in;
      cond_ex_in_tb  <= cond_ex_in;
      ir_write_tb    <= ir_write;
      reg_write_tb   <= reg_write;
      ma_write_tb    <= ma_write;
      mem_write_tb   <= mem_write;
      flags_write_tb <= flags_write;
      pc_src_tb      <= pc_src;
      pc_write_tb    <= pc_write;

      wait for 15 ns; -- get the timing simulation time to settle the signals
      report_errors(
      op                  => op,
      s_or_l              => s_or_l,
      r_d                 => r_d,
      no_write_in         => no_write_in,
      cond_ex_in          => cond_ex_in,
      ir_write            => ir_write_tb,
      ir_write_correct    => ir_write,
      reg_write           => reg_write_tb,
      reg_write_correct   => reg_write,
      ma_write            => ma_write_tb,
      ma_write_correct    => ma_write,
      mem_write           => mem_write_tb,
      mem_write_correct   => mem_write,
      flags_write         => flags_write_tb,
      flags_write_correct => flags_write,
      pc_src              => pc_src_tb,
      pc_src_correct      => pc_src,
      pc_write            => pc_write_tb,
      pc_write_correct    => pc_write
      );
    end procedure test;

  begin
    wait for 100 ns;

    report "Testbench finished successfully!";

    wait;
  end process simuli;

end architecture sim;