library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
  generic (
    N : integer := 32
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    ir  : in std_logic_vector(N - 1 downto 0);
    sr  : in std_logic_vector(3 downto 0);
    -- instr_dec
    reg_src     : out std_logic_vector(2 downto 0);
    alu_src     : out std_logic;
    imm_src     : out std_logic_vector(1 downto 0);
    alu_control : out std_logic_vector(2 downto 0);
    mem_to_reg  : out std_logic;
    -- fsm
    ir_write    : out std_logic;
    reg_write   : out std_logic;
    ma_write    : out std_logic;
    mem_write   : out std_logic;
    flags_write : out std_logic;
    pc_src      : out std_logic_vector(1 downto 0);
    pc_write    : out std_logic
  );
end entity control_unit;

architecture structural of control_unit is
  -- Component Instantiation
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
  component cond_logic is
    port (
      cond       : in std_logic_vector(3 downto 0);
      flags      : in std_logic_vector(3 downto 0); -- (N, Z, C, V)
      cond_ex_in : out std_logic
    );
  end component cond_logic;
  -- Singal Declaration
  signal no_write_in : std_logic;
  signal cond_ex_in  : std_logic;
begin
  -- Component Instantiation
  instruction_decoder : instr_dec
  port map(
    -- Inputs
    op    => ir(27 downto 26),
    funct => ir(25 downto 20),
    -- Outputs
    reg_src     => reg_src,
    alu_src     => alu_src,
    imm_src     => imm_src,
    alu_control => alu_control,
    mem_to_reg  => mem_to_reg,
    no_write_in => no_write_in
  );
  finite_state_machine : fsm
  port map(
    -- Inputs
    rst         => rst,
    clk         => clk,
    op          => ir(27 downto 26),
    s_or_l      => ir(20),
    r_d         => ir(15 downto 12),
    no_write_in => no_write_in,
    cond_ex_in  => cond_ex_in,
    -- Outputs
    ir_write    => ir_write,
    reg_write   => reg_write,
    ma_write    => ma_write,
    mem_write   => mem_write,
    flags_write => flags_write,
    pc_src      => pc_src,
    pc_write    => pc_write
  );
  conditional_logic : cond_logic
  port map(
    -- Inputs
    cond  => ir(31 downto 28),
    flags => sr,
    -- Outputs
    cond_ex_in => cond_ex_in
  );
end architecture structural;