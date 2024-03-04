library ieee;
use ieee.std_logic_1164.all;
use work.string_pkg.all;

entity fsm_tb is
end entity fsm_tb;

architecture sim of fsm_tb is
  -- Component declaration
  component fsm is
    port (
      rst         : in std_logic;
      clk         : in std_logic;
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
  signal rst_tb         : std_logic;
  signal clk_tb         : std_logic;
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
  -- clk period
  constant clk_period : time := 20 ns; -- to succeed in timing simulation
begin
  -- Instantaite unit under test
  uut : fsm
  port map(
    rst         => rst_tb,
    clk         => clk_tb,
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

  -- Clock process
  clock : process
  begin
    clk_tb <= '0';
    wait for clk_period / 2;
    clk_tb <= '1';
    wait for clk_period / 2;
  end process;

  -- Stimulus process
  simuli : process

    -- Apply test
    procedure test (
      ir_write_correct    : in std_logic                    := '0';
      reg_write_correct   : in std_logic                    := '0';
      ma_write_correct    : in std_logic                    := '0';
      mem_write_correct   : in std_logic                    := '0';
      flags_write_correct : in std_logic                    := '0';
      pc_src_correct      : in std_logic_vector(1 downto 0) := "00";
      pc_write_correct    : in std_logic                    := '0') is
    begin
      if (
        ir_write_tb /= ir_write_correct or
        reg_write_tb /= reg_write_correct or
        ma_write_tb /= ma_write_correct or
        mem_write_tb /= mem_write_correct or
        flags_write_tb /= flags_write_correct or
        pc_src_tb /= pc_src_correct or
        pc_write_tb /= pc_write_correct
        ) then
        assert false
        report
          -- Inputs --
          "op = " & to_bstring(op_tb) & ", " &
          "s_or_l = " & to_bstring(s_or_l_tb) & ", " &
          "r_d = " & to_bstring(r_d_tb) & ", " &
          "no_write_in = " & to_bstring(no_write_in_tb) & ", " &
          "cond_ex_in = " & to_bstring(cond_ex_in_tb) & " | " &
          -- Outputs --
          "ir_write = " & to_bstring(ir_write_tb) & ", " &
          "ir_write_correct = " & to_bstring(ir_write_correct) & " | " &
          "reg_write = " & to_bstring(reg_write_tb) & ", " &
          "reg_write_correct = " & to_bstring(reg_write_correct) & " | " &
          "ma_write = " & to_bstring(ma_write_tb) & ", " &
          "ma_write_correct = " & to_bstring(ma_write_correct) & " | " &
          "mem_write = " & to_bstring(mem_write_tb) & ", " &
          "mem_write_correct = " & to_bstring(mem_write_correct) & " | " &
          "flags_write = " & to_bstring(flags_write_tb) & ", " &
          "flags_write_correct = " & to_bstring(flags_write_correct) & " | " &
          "pc_src = " & to_bstring(pc_src_tb) & ", " &
          "pc_src_correct = " & to_bstring(pc_src_correct) & " | " &
          "pc_write = " & to_bstring(pc_write_tb) & ", " &
          "pc_write_correct = " & to_bstring(pc_write_correct)
          severity failure;
      end if;
    end procedure test;

  begin
    rst_tb <= '1';
    wait for 5 * clk_period;

    rst_tb <= '0';

    -- LDR : S0 -> S1 -> S2a -> S3 -> S4a
    op_tb          <= "01";
    s_or_l_tb      <= '1';
    r_d_tb         <= "0101";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S2a
    wait for clk_period;
    test(
    ma_write_correct => '1'
    );
    -- S3
    wait for clk_period;
    test;
    -- S4a
    wait for clk_period;
    test(
    reg_write_correct => '1',
    pc_write_correct  => '1'
    );

    -- LDR : S0 -> S1 -> S2a -> S3 -> S4b
    wait for clk_period;
    op_tb          <= "01";
    s_or_l_tb      <= '1';
    r_d_tb         <= "1111";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S2a
    wait for clk_period;
    test(
    ma_write_correct => '1'
    );
    -- S3
    wait for clk_period;
    test;
    -- S4b
    wait for clk_period;
    test(
    pc_src_correct   => "10",
    pc_write_correct => '1'
    );

    -- LDR : S0 -> S1 -> S4c
    wait for clk_period;
    op_tb          <= "01";
    s_or_l_tb      <= '1';
    r_d_tb         <= "1011";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '0';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S4c
    wait for clk_period;
    test(
    pc_write_correct => '1'
    );

    report "LDR instructions finished successfully!";

    -- STR : S0 -> S1 -> S2a -> S4d
    wait for clk_period;
    op_tb          <= "01";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1001";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S2a
    wait for clk_period;
    test(
    ma_write_correct => '1'
    );
    -- S4d
    wait for clk_period;
    test(
    mem_write_correct => '1',
    pc_write_correct  => '1'
    );

    -- STR : S0 -> S1 -> S4c
    wait for clk_period;
    op_tb          <= "01";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1011";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '0';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S4c
    wait for clk_period;
    test(
    pc_write_correct => '1'
    );

    report "STR instructions finished successfully!";

    -- DP : S0 -> S1 -> S2b -> S4a
    wait for clk_period;
    op_tb          <= "00";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1000";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S2b
    wait for clk_period;
    test;
    -- S4e
    wait for clk_period;
    test(
    reg_write_correct => '1',
    pc_write_correct  => '1'
    );
    -- DP : S0 -> S1 -> S2b -> S4b
    wait for clk_period;
    op_tb          <= "00";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1111";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S2b
    wait for clk_period;
    test;
    -- S4e
    wait for clk_period;
    test(
    pc_src_correct   => "10",
    pc_write_correct => '1'
    );

    -- DP : S0 -> S1 -> S2b -> S4e
    wait for clk_period;
    op_tb          <= "00";
    s_or_l_tb      <= '1';
    r_d_tb         <= "1101";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S2b
    wait for clk_period;
    test;
    -- S4e
    wait for clk_period;
    test(
    reg_write_correct   => '1',
    flags_write_correct => '1',
    pc_write_correct    => '1'
    );

    -- DP : S0 -> S1 -> S2b -> S4f
    wait for clk_period;
    op_tb          <= "00";
    s_or_l_tb      <= '1';
    r_d_tb         <= "1111";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S2b
    wait for clk_period;
    test;
    -- S4f
    wait for clk_period;
    test(
    flags_write_correct => '1',
    pc_src_correct      => "10",
    pc_write_correct    => '1'
    );

    -- DP : S0 -> S1 -> S4c
    wait for clk_period;
    op_tb          <= "00";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1011";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '0';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S4c
    wait for clk_period;
    test(
    pc_write_correct => '1'
    );

    report "DP instructions finished successfully!";

    -- CMP : S0 -> S1 -> S4g
    wait for clk_period;
    op_tb          <= "00";
    s_or_l_tb      <= '0';
    r_d_tb         <= "0011";
    no_write_in_tb <= '1';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S4g
    wait for clk_period;
    test(
    flags_write_correct => '1',
    pc_write_correct    => '1'
    );

    -- CMP : S0 -> S1 -> S4c
    wait for clk_period;
    op_tb          <= "00";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1011";
    no_write_in_tb <= '1';
    cond_ex_in_tb  <= '0';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S4c
    wait for clk_period;
    test(
    pc_write_correct => '1'
    );

    report "CMP instruction finished successfully!";

    -- B : S0 -> S1 -> S4h
    wait for clk_period;
    op_tb          <= "10";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1010";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '1';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S4h
    wait for clk_period;
    test(
    pc_src_correct   => "01",
    pc_write_correct => '1'
    );

    -- B : S0 -> S1 -> S4c
    wait for clk_period;
    op_tb          <= "10";
    s_or_l_tb      <= '0';
    r_d_tb         <= "1011";
    no_write_in_tb <= '0';
    cond_ex_in_tb  <= '0';
    -- S0
    test(
    ir_write_correct => '1'
    );
    -- S1
    wait for clk_period;
    test;
    -- S4c
    wait for clk_period;
    test(
    pc_write_correct => '1'
    );

    report "B instructions finished successfully!";

    wait;
  end process simuli;

end architecture sim;