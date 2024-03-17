library ieee;
use ieee.std_logic_1164.all;

entity processor is
  generic (
    N : integer := 32
  );
  port (
    clk        : in std_logic;
    reset      : in std_logic;
    pc         : out std_logic_vector(7 downto 0);
    instr      : out std_logic_vector(N - 1 downto 0);
    alu_result : out std_logic_vector(N - 1 downto 0);
    write_data : out std_logic_vector(N - 1 downto 0);
    result     : out std_logic_vector(N - 1 downto 0)
  );
end entity processor;

architecture structural of processor is
  -- Constant Declaration
  constant BUS_WIDTH : integer := 32;

  -- Component Declaration
  component datapath is
    generic (
      N : integer := BUS_WIDTH
    );
    port (
      -- Inputs
      clk         : in std_logic;
      rst         : in std_logic;
      reg_src     : in std_logic_vector(2 downto 0);
      alu_src     : in std_logic;
      mem_to_reg  : in std_logic;
      alu_control : in std_logic_vector(2 downto 0);
      imm_src     : in std_logic_vector(1 downto 0);
      ir_write    : in std_logic;
      reg_write   : in std_logic;
      ma_write    : in std_logic;
      mem_write   : in std_logic;
      flags_write : in std_logic;
      pc_src      : in std_logic_vector(1 downto 0);
      pc_write    : in std_logic;
      -- Outputs
      pc_value   : out std_logic_vector(N - 1 downto 0);
      instr      : out std_logic_vector(N - 1 downto 0);
      alu_result : out std_logic_vector(N - 1 downto 0);
      write_data : out std_logic_vector(N - 1 downto 0);
      result     : out std_logic_vector(N - 1 downto 0);
      flags      : out std_logic_vector(3 downto 0)

    );
  end component datapath;

  component control_unit is
    generic (
      N : integer := BUS_WIDTH
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
  end component control_unit;

  -- Signal Declaration
  signal CONTROL_reg_src     : std_logic_vector(2 downto 0);
  signal CONTROL_alu_src     : std_logic;
  signal CONTROL_imm_src     : std_logic_vector(1 downto 0);
  signal CONTROL_alu_control : std_logic_vector(2 downto 0);
  signal CONTROL_mem_to_reg  : std_logic;
  signal CONTROL_ir_write    : std_logic;
  signal CONTROL_reg_write   : std_logic;
  signal CONTROL_ma_write    : std_logic;
  signal CONTROL_mem_write   : std_logic;
  signal CONTROL_flags_write : std_logic;
  signal CONTROL_pc_src      : std_logic_vector(1 downto 0);
  signal CONTROL_pc_write    : std_logic;

  signal DATAPATH_pc_value   : std_logic_vector(N - 1 downto 0);
  signal DATAPATH_instr      : std_logic_vector(N - 1 downto 0);
  signal DATAPATH_alu_result : std_logic_vector(N - 1 downto 0);
  signal DATAPATH_write_data : std_logic_vector(N - 1 downto 0);
  signal DATAPATH_result     : std_logic_vector(N - 1 downto 0);
  signal DATAPATH_flags      : std_logic_vector(3 downto 0);
begin

  -- Component Instantiation
  datapath_component : datapath
  generic map(
    N => BUS_WIDTH
  )
  port map(
    clk         => clk,
    rst         => reset,
    reg_src     => CONTROL_reg_src,
    alu_src     => CONTROL_alu_src,
    mem_to_reg  => CONTROL_mem_to_reg,
    alu_control => CONTROL_alu_control,
    imm_src     => CONTROL_imm_src,
    ir_write    => CONTROL_ir_write,
    reg_write   => CONTROL_reg_write,
    ma_write    => CONTROL_ma_write,
    mem_write   => CONTROL_mem_write,
    flags_write => CONTROL_flags_write,
    pc_src      => CONTROL_pc_src,
    pc_write    => CONTROL_pc_write,
    pc_value    => DATAPATH_pc_value,
    instr       => DATAPATH_instr,
    alu_result  => DATAPATH_alu_result,
    write_data  => DATAPATH_write_data,
    result      => DATAPATH_result,
    flags       => DATAPATH_flags
  );

  control_component : control_unit
  generic map(
    N => BUS_WIDTH
  )
  port map(
    clk         => clk,
    rst         => reset,
    ir          => DATAPATH_instr,
    sr          => DATAPATH_flags,
    reg_src     => CONTROL_reg_src,
    alu_src     => CONTROL_alu_src,
    imm_src     => CONTROL_imm_src,
    alu_control => CONTROL_alu_control,
    mem_to_reg  => CONTROL_mem_to_reg,
    ir_write    => CONTROL_ir_write,
    reg_write   => CONTROL_reg_write,
    ma_write    => CONTROL_ma_write,
    mem_write   => CONTROL_mem_write,
    flags_write => CONTROL_flags_write,
    pc_src      => CONTROL_pc_src,
    pc_write    => CONTROL_pc_write
  );

  -- Output Assignment
  pc         <= DATAPATH_pc_value(7 downto 0);
  instr      <= DATAPATH_instr;
  alu_result <= DATAPATH_alu_result;
  write_data <= DATAPATH_write_data;
  result     <= DATAPATH_result;

end architecture structural;