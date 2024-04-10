library ieee;
use ieee.std_logic_1164.all;

entity datapath is
  generic (
    N : integer := 32
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
end entity datapath;

architecture structural of datapath is
  -- Constants Declaration
  constant BUS_LEN        : integer := 32;
  constant IM_ADDRESS_LEN : integer := 6;
  constant RF_ADDRESS_LEN : integer := 4;
  constant DM_ADDRESS_LEN : integer := 5;

  -- Component Instantiation
  component pc is
    generic (
      N : integer := BUS_LEN
    );
    port (
      clk : in std_logic;
      rst : in std_logic;
      we  : in std_logic;
      d   : in std_logic_vector(N - 1 downto 0);
      q   : out std_logic_vector(N - 1 downto 0)
    );
  end component pc;

  component instr_mem is
    generic (
      N : integer := IM_ADDRESS_LEN;
      M : integer := BUS_LEN
    );
    port (
      address : in std_logic_vector(N - 1 downto 0);
      data    : out std_logic_vector(M - 1 downto 0)
    );
  end component instr_mem;

  component add_4 is
    generic (
      N : integer := BUS_LEN
    );
    port (
      input_1  : in std_logic_vector(N - 1 downto 0);
      input_2  : in std_logic_vector(N - 1 downto 0);
      output_1 : out std_logic_vector(N - 1 downto 0)
    );
  end component add_4;

  component register_file is
    generic (
      N : integer := RF_ADDRESS_LEN;
      M : integer := BUS_LEN
    );
    port (
      address_1    : in std_logic_vector(N - 1 downto 0);
      address_2    : in std_logic_vector(N - 1 downto 0);
      address_3    : in std_logic_vector(N - 1 downto 0);
      write_data_3 : in std_logic_vector(M - 1 downto 0);
      R15          : in std_logic_vector(M - 1 downto 0);
      clk          : in std_logic;
      we_3         : in std_logic;
      read_data_1  : out std_logic_vector(M - 1 downto 0);
      read_data_2  : out std_logic_vector(M - 1 downto 0)
    );
  end component register_file;

  component extend is
    generic (
      N : integer := BUS_LEN
    );
    port (
      data_in  : in std_logic_vector(23 downto 0);
      sel      : in std_logic_vector(1 downto 0);
      data_out : out std_logic_vector(N - 1 downto 0)
    );
  end component extend;

  component alu is
    generic (
      N : integer := BUS_LEN
    );
    port (
      source_1 : in std_logic_vector(N - 1 downto 0);
      source_2 : in std_logic_vector(N - 1 downto 0);
      imm      : in std_logic;
      shamt5   : in std_logic_vector(4 downto 0);
      sh       : in std_logic_vector(1 downto 0);
      control  : in std_logic_vector(2 downto 0);
      result   : out std_logic_vector(N - 1 downto 0);
      flags    : out std_logic_vector(3 downto 0) -- N, Z, C, V
    );
  end component alu;

  component status_reg is
    generic (
      N : integer := 4
    );
    port (
      clk : in std_logic;
      rst : in std_logic;
      we  : in std_logic;
      d   : in std_logic_vector(N - 1 downto 0);
      q   : out std_logic_vector(N - 1 downto 0)
    );
  end component status_reg;

  component data_mem is
    generic (
      N : integer := DM_ADDRESS_LEN;
      M : integer := BUS_LEN
    );
    port (
      address    : in std_logic_vector(N - 1 downto 0);
      write_data : in std_logic_vector(M - 1 downto 0);
      clk        : in std_logic;
      we         : in std_logic;
      read_data  : out std_logic_vector(M - 1 downto 0)
    );
  end component data_mem;

  component mux_2_to_1 is
    generic (
      N : integer := BUS_LEN
    );
    port (
      input_1  : in std_logic_vector(N - 1 downto 0);
      input_2  : in std_logic_vector(N - 1 downto 0);
      sel      : in std_logic;
      output_1 : out std_logic_vector(N - 1 downto 0)
    );
  end component mux_2_to_1;

  component mux_3_to_1 is
    generic (
      N : integer := BUS_LEN
    );
    port (
      input_1  : in std_logic_vector(N - 1 downto 0);
      input_2  : in std_logic_vector(N - 1 downto 0);
      input_3  : in std_logic_vector(N - 1 downto 0);
      sel      : in std_logic_vector(1 downto 0);
      output_1 : out std_logic_vector(N - 1 downto 0)
    );
  end component mux_3_to_1;

  component non_arch_reg_we is
    generic (
      N : integer := BUS_LEN
    );
    port (
      clk : in std_logic;
      we  : in std_logic;
      rst : in std_logic;
      d   : in std_logic_vector(N - 1 downto 0);
      q   : out std_logic_vector(N - 1 downto 0)
    );
  end component non_arch_reg_we;

  component non_arch_reg is
    generic (
      N : integer := BUS_LEN
    );
    port (
      clk : in std_logic;
      rst : in std_logic;
      d   : in std_logic_vector(N - 1 downto 0);
      q   : out std_logic_vector(N - 1 downto 0)
    );
  end component non_arch_reg;

  -- Signals Declaration
  signal PC_input  : std_logic_vector(N - 1 downto 0);
  signal PC_output : std_logic_vector(N - 1 downto 0);

  signal IM_output : std_logic_vector(N - 1 downto 0);

  signal IR_output : std_logic_vector(N - 1 downto 0);

  signal PCBY4_output : std_logic_vector(N - 1 downto 0);

  signal PCP4_output : std_logic_vector(N - 1 downto 0);

  signal RF_a1  : std_logic_vector(RF_ADDRESS_LEN - 1 downto 0);
  signal RF_a2  : std_logic_vector(RF_ADDRESS_LEN - 1 downto 0);
  signal RF_a3  : std_logic_vector(RF_ADDRESS_LEN - 1 downto 0);
  signal RF_wd3 : std_logic_vector(N - 1 downto 0);
  signal RF_r15 : std_logic_vector(N - 1 downto 0);
  signal RF_rd1 : std_logic_vector(N - 1 downto 0);
  signal RF_rd2 : std_logic_vector(N - 1 downto 0);

  signal EXTEND_output : std_logic_vector(N - 1 downto 0);

  signal B_output : std_logic_vector(N - 1 downto 0);

  signal I_output : std_logic_vector(N - 1 downto 0);

  signal ALU_source_a : std_logic_vector(N - 1 downto 0);
  signal ALU_source_b : std_logic_vector(N - 1 downto 0);
  signal ALU_flags    : std_logic_vector(3 downto 0);
  signal ALU_output   : std_logic_vector(N - 1 downto 0);

  signal SR_output : std_logic_vector(3 downto 0);

  signal DM_a      : std_logic_vector(N - 1 downto 0);
  signal DM_wd     : std_logic_vector(N - 1 downto 0);
  signal DM_output : std_logic_vector(N - 1 downto 0);

  signal RD_output : std_logic_vector(N - 1 downto 0);

  signal S_output : std_logic_vector(N - 1 downto 0);

  signal MEMTOREG_MUX2TO1_output : std_logic_vector(N - 1 downto 0);

begin
  -- Component Instantiation
  PC_reg : pc
  port map(
    clk => clk,
    we  => pc_write,
    rst => rst,
    d   => PC_input,
    q   => PC_output
  );

  Instruction_Memory : instr_mem
  port map(
    address => PC_output(IM_ADDRESS_LEN + 1 downto 2),
    data    => IM_output
  );

  IR_non_arch_reg : non_arch_reg_we
  port map(
    clk => clk,
    we  => ir_write,
    rst => rst,
    d   => IM_output,
    q   => IR_output
  );

  Increment_PC_by_4 : add_4
  port map(
    input_1  => PC_output,
    input_2  => "00000000000000000000000000000100",
    output_1 => PCBY4_output
  );

  PC_p4_non_arch_reg : non_arch_reg
  port map(
    clk => clk,
    rst => rst,
    d   => PCBY4_output,
    q   => PCP4_output
  );

  A1_mux2to1 : mux_2_to_1
  generic map(
    N => RF_ADDRESS_LEN
  )
  port map(
    input_1  => IR_output(19 downto 16),
    input_2  => "1111",
    sel      => reg_src(0),
    output_1 => RF_a1
  );

  A2_mux2to1 : mux_2_to_1
  generic map(
    N => RF_ADDRESS_LEN
  )
  port map(
    input_1  => IR_output(3 downto 0),
    input_2  => IR_output(15 downto 12),
    sel      => reg_src(1),
    output_1 => RF_a2
  );

  A3_mux2to1 : mux_2_to_1
  generic map(
    N => RF_ADDRESS_LEN
  )
  port map(
    input_1  => IR_output(15 downto 12),
    input_2  => "1110",
    sel      => reg_src(2),
    output_1 => RF_a3
  );

  Increment_PC_by_8 : add_4
  port map(
    input_1  => "00000000000000000000000000000100",
    input_2  => PCP4_output,
    output_1 => RF_r15
  );

  WD3_mux2to1 : mux_2_to_1
  port map(
    input_1  => MEMTOREG_MUX2TO1_output,
    input_2  => PCP4_output,
    sel      => reg_src(2),
    output_1 => RF_wd3
  );

  RF : register_file
  port map(
    address_1    => RF_a1,
    address_2    => RF_a2,
    address_3    => RF_a3,
    write_data_3 => RF_wd3,
    R15          => RF_r15,
    clk          => clk,
    we_3         => reg_write,
    read_data_1  => RF_rd1,
    read_data_2  => RF_rd2
  );

  Extend_Unit : extend
  port map(
    data_in  => IR_output(23 downto 0),
    sel      => imm_src,
    data_out => EXTEND_output
  );

  A_non_arch_reg : non_arch_reg
  port map(
    clk => clk,
    rst => rst,
    d   => RF_rd1,
    q   => ALU_source_a
  );

  B_non_arch_reg : non_arch_reg
  port map(
    clk => clk,
    rst => rst,
    d   => RF_rd2,
    q   => B_output
  );

  I_non_arch_reg : non_arch_reg
  port map(
    clk => clk,
    rst => rst,
    d   => EXTEND_output,
    q   => I_output
  );

  SourceB_mux2to1 : mux_2_to_1
  port map(
    input_1  => B_output,
    input_2  => I_output,
    sel      => alu_src,
    output_1 => ALU_source_b
  );

  ALU_Unit : alu
  port map(
    source_1 => ALU_source_a,
    source_2 => ALU_source_b,
    imm      => IR_output(25),
    shamt5   => IR_output(11 downto 7),
    sh       => IR_output(6 downto 5),
    control  => alu_control,
    result   => ALU_output,
    flags    => ALU_flags
  );

  SR : status_reg
  port map(
    clk => clk,
    rst => rst,
    we  => flags_write,
    d   => ALU_flags,
    q   => SR_output
  );

  MA_non_arch_reg : non_arch_reg_we
  port map(
    clk => clk,
    we  => ma_write,
    rst => rst,
    d   => ALU_output,
    q   => DM_a
  );

  WD_non_arch_reg : non_arch_reg
  port map(
    clk => clk,
    rst => rst,
    d   => B_output,
    q   => DM_wd
  );

  Data_Memory : data_mem
  port map(
    address    => DM_a(DM_ADDRESS_LEN + 1 downto 2),
    write_data => DM_wd,
    clk        => clk,
    we         => mem_write,
    read_data  => DM_output
  );

  RD_non_arch_reg : non_arch_reg
  port map(
    clk => clk,
    rst => rst,
    d   => DM_output,
    q   => RD_output
  );

  S_non_arch_reg : non_arch_reg
  port map(
    clk => clk,
    rst => rst,
    d   => ALU_output,
    q   => S_output
  );

  MemtoReg_mux2to1 : mux_2_to_1
  port map(
    input_1  => S_output,
    input_2  => RD_output,
    sel      => mem_to_reg,
    output_1 => MEMTOREG_MUX2TO1_output
  );

  PCSrc_mux3to1 : mux_3_to_1
  port map(
    input_1  => PCBY4_output,
    input_2  => ALU_output,
    input_3  => MEMTOREG_MUX2TO1_output,
    sel      => pc_src,
    output_1 => PC_input
  );

  -- Output Assignment
  pc_value   <= PC_output;
  instr      <= IM_output;
  alu_result <= ALU_output;
  write_data <= B_output;
  result     <= MEMTOREG_MUX2TO1_output;
  flags      <= SR_output;

end architecture structural;