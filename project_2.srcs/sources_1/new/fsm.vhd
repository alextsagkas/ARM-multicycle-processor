library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port (
    rst         : in std_logic;
    clk         : in std_logic;
    op          : in std_logic_vector(1 downto 0);
    s_or_l      : in std_logic;
    r_d         : in std_logic_vector(3 downto 0);
    no_write_in : in std_logic;
    bl_in       : in std_logic;
    cond_ex_in  : in std_logic;
    ir_write    : out std_logic;
    reg_write   : out std_logic;
    ma_write    : out std_logic;
    mem_write   : out std_logic;
    flags_write : out std_logic;
    pc_src      : out std_logic_vector(1 downto 0);
    pc_write    : out std_logic
  );
end entity fsm;

architecture behavioral of fsm is
  -- State type definitions:
  -- * S0: Fetch Instruction from Instruction Memory
  -- * S1: Decode with Instruction Decoder & Read RF (Also wirte R14 when BL)
  -- * S2: ALU Compute
  -- * S3: Data Memory Access (Read/Write)
  -- * S4: Write Back to RF
  type state_type is (
    S0,
    S1,
    S2a, S2b,
    S3,
    S4a, S4b, S4c, S4d, S4e, S4f, S4g, S4h, S4i
  );
  -- Internal signals
  signal current_state, next_state : state_type;
begin
  -- State register
  sync : process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        current_state <= S0;
      else
        current_state <= next_state;
      end if;
    end if;
  end process sync;

  -- Next state & ouput logic
  async : process (current_state, op, s_or_l, r_d, no_write_in, bl_in, cond_ex_in)
    variable input_aggregate : std_logic_vector(9 downto 0);
  begin
    input_aggregate := op & s_or_l & r_d & no_write_in & bl_in & cond_ex_in;

    -- ###################################################################### --

    ir_write    <= '0';
    reg_write   <= '0';
    ma_write    <= '0';
    mem_write   <= '0';
    flags_write <= '0';
    pc_src      <= "00";
    pc_write    <= '0';

    case current_state is

      when S0 =>
        ------------ LDR ------------
        -- Next State
        next_state <= S1;
        -- Outputs
        ir_write <= '1';

      when S1 =>
        case input_aggregate is
            ------------ B ------------
          when "1000000011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000000111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000001011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000001111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000010011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000010111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000011011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000011111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000100011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000100111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000101011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000101111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000110011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000110111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000111011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000111111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001000011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001000111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001001011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001001111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001010011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001010111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001011011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001011111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001100011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001100111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001101011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001101111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001110011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001110111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001111011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1001111111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010000011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010000111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010001011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010001111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010010011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010010111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010011011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010011111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010100011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010100111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010101011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010101111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010110011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010110111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010111011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1010111111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011000011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011000111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011001011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011001111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011010011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011010111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011011011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011011111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011100011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011100111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011101011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011101111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011110011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011110111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011111011" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1011111111" =>
            -- Next State
            next_state <= S4i;
            -- Outputs
            ------------ B ------------
          when "1000000001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000000101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000001001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000001101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000010001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000010101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000011001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000011101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000100001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000100101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000101001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000101101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000110001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000110101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000111001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1000111101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001000001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001000101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001001001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001001101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001010001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001010101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001011001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001011101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001100001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001100101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001101001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001101101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001110001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001110101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001111001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1001111101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010000001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010000101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010001001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010001101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010010001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010010101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010011001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010011101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010100001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010100101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010101001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010101101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010110001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010110101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010111001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1010111101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011000001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011000101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011001001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011001101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011010001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011010101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011011001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011011101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011100001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011100101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011101001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011101101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011110001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011110101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011111001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "1011111101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ CMP ------------
          when "0000000101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000000111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000001101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000001111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000010101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000010111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000011101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000011111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000100101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000100111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000101101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000101111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000110101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000110111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000111101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0000111111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001000101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001000111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001001101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001001111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001010101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001010111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001011101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001011111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001100101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001100111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001101101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001101111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001110101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001110111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001111101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0001111111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010000101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010000111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010001101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010001111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010010101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010010111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010011101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010011111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010100101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010100111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010101101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010101111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010110101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010110111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010111101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0010111111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011000101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011000111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011001101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011001111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011010101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011010111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011011101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011011111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011100101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011100111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011101101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011101111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011110101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011110111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011111101" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "0011111111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ LDR ------------
          when "0000000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0000111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0001111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0010111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0011111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0100111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0101111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0110111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "0111111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1000111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1001111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1010111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1011111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1100111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1101111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1110111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "1111111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ DP ------------
          when "0000000001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000000011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000001001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000001011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000010001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000010011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000011001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000011011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000100001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000100011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000101001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000101011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000110001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000110011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000111001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0000111011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001000001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001000011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001001001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001001011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001010001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001010011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001011001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001011011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001100001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001100011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001101001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001101011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001110001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001110011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001111001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0001111011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010000001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010000011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010001001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010001011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010010001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010010011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010011001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010011011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010100001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010100011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010101001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010101011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010110001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010110011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010111001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0010111011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011000001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011000011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011001001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011001011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011010001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011010011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011011001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011011011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011100001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011100011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011101001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011101011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011110001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011110011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011111001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "0011111011" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ LDR ------------
          when "0100000001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100000011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100000101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100000111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100001001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100001011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100001101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100001111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100010001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100010011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100010101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100010111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100011001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100011011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100011101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100011111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100100001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100100011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100100101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100100111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100101001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100101011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100101101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100101111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100110001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100110011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100110101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100110111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100111001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100111011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100111101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0100111111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101000001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101000011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101000101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101000111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101001001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101001011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101001101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101001111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101010001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101010011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101010101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101010111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101011001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101011011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101011101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101011111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101100001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101100011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101100101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101100111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101101001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101101011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101101101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101101111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101110001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101110011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101110101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101110111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101111001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101111011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101111101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0101111111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110000001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110000011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110000101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110000111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110001001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110001011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110001101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110001111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110010001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110010011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110010101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110010111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110011001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110011011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110011101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110011111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110100001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110100011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110100101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110100111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110101001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110101011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110101101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110101111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110110001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110110011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110110101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110110111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110111001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110111011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110111101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0110111111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111000001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111000011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111000101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111000111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111001001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111001011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111001101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111001111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111010001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111010011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111010101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111010111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111011001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111011011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111011101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111011111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111100001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111100011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111100101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111100111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111101001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111101011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111101101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111101111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111110001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111110011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111110101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111110111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111111001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111111011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111111101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "0111111111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ OTH ------------
          when others =>
            -- Next State
            next_state <= S0;
            -- Outputs
            pc_write <= '1';
        end case;

      when S2a =>
        case input_aggregate is
            ------------ STR ------------
          when "0000000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0000111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0001111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0100111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "0101111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1000111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1001111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1100111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "1101111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0010111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0011111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0110111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "0111111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1010111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1011111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1110111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "1111111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ OTH ------------
          when others =>
            -- Next State
            next_state <= S0;
            -- Outputs
            pc_write <= '1';
        end case;

      when S2b =>
        case input_aggregate is
            ------------ DP ------------
          when "0011111000" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0011111001" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0011111010" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0011111011" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0011111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0011111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0011111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0011111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111000" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111001" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111010" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111011" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0111111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111000" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111001" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111010" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111011" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1011111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111000" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111001" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111010" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111011" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "1111111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "0010000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0010111111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0110111111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1010111111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1110111111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0011110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0111110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1011110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "1111110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "0001111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0001111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0001111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0001111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0001111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0001111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0001111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0001111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0101111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1001111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "1101111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "0000000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0000111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0100111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1000111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1100111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0001110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "0101110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1001110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "1101110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ OTH ------------
          when others =>
            -- Next State
            next_state <= S0;
            -- Outputs
            pc_write <= '1';
        end case;

      when S3 =>
        case input_aggregate is
            ------------ LDR ------------
          when "0001111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0001111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0001111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0001111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0001111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0001111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0001111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0001111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0011111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0101111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0111111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1001111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1011111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1101111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111000" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111001" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111010" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111011" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "1111111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "0000000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0000111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0010111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0100111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0110111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1000111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1010111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1100111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1110111111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0001110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0011110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0101110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "0111110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1001110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1011110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1101110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "1111110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ OTH ------------
          when others =>
            -- Next State
            next_state <= S0;
            -- Outputs
            pc_write <= '1';
        end case;

      when S4a =>
        ------------ LDR ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        reg_write <= '1';
        pc_write  <= '1';

      when S4b =>
        ------------ LDR ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        pc_src   <= "10";
        pc_write <= '1';

      when S4c =>
        ------------ LDR ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        pc_write <= '1';

      when S4d =>
        ------------ STR ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        mem_write <= '1';
        pc_write  <= '1';

      when S4e =>
        ------------ DP ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        reg_write   <= '1';
        flags_write <= '1';
        pc_write    <= '1';

      when S4f =>
        ------------ DP ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        flags_write <= '1';
        pc_src      <= "10";
        pc_write    <= '1';

      when S4g =>
        ------------ CMP ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        flags_write <= '1';
        pc_write    <= '1';

      when S4h =>
        ------------ B ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        pc_src   <= "01";
        pc_write <= '1';

      when S4i =>
        ------------ B ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        reg_write <= '1';
        pc_src    <= "01";
        pc_write  <= '1';

      when others =>
        ------------ OTH ------------
        -- Next State
        next_state <= S0;
        -- Outputs
        pc_write <= '1';

    end case;

    -- ###################################################################### --

  end process async;
end architecture behavioral;