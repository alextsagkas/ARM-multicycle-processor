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
  -- State type definitions
  type state_type is (
    S0,                                    -- S0: Fetch Instruction from Instruction Memory
    S1,                                    -- S1: Decode with Instruction Decoder & Read RF
    S2a, S2b,                              -- S2: ALU Compute
    S3,                                    -- S3: Data Memory Access (Read/Write)
    S4a, S4b, S4c, S4d, S4e, S4f, S4g, S4h -- S4: Write Back to RF
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
  async : process (current_state, op, s_or_l, r_d, no_write_in, cond_ex_in)
    variable input_aggregate : std_logic_vector(8 downto 0);
  begin
    input_aggregate := op & s_or_l & r_d & no_write_in & cond_ex_in;

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
          when "100000001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100000011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100000101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100000111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100001001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100001011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100001101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100001111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100010001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100010011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100010101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100010111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100011001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100011011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100011101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100011111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100100001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100100011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100100101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100100111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100101001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100101011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100101101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100101111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100110001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100110011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100110101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100110111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100111001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100111011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100111101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "100111111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101000001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101000011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101000101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101000111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101001001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101001011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101001101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101001111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101010001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101010011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101010101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101010111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101011001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101011011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101011101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101011111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101100001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101100011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101100101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101100111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101101001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101101011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101101101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101101111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101110001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101110011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101110101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101110111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101111001" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101111011" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101111101" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ B ------------
          when "101111111" =>
            -- Next State
            next_state <= S4h;
            -- Outputs
            ------------ CMP ------------
          when "000000011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000000111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000001011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000001111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000010011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000010111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000011011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000011111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000100011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000100111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000101011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000101111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000110011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000110111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000111011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "000111111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001000011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001000111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001001011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001001111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001010011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001010111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001011011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001011111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001100011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001100111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001101011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001101111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001110011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001110111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001111011" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ CMP ------------
          when "001111111" =>
            -- Next State
            next_state <= S4g;
            -- Outputs
            ------------ LDR ------------
          when "000000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "000111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "001111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "010111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "011111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "100111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "101111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "110111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111000000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111000010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111000100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111000110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111001000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111001010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111001100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111001110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111010000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111010010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111010100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111010110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111011000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111011010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111011100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111011110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111100000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111100010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111100100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111100110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111101000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111101010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111101100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111101110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111110000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111110010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111110100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111110110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111111000" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111111010" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111111100" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ LDR ------------
          when "111111110" =>
            -- Next State
            next_state <= S4c;
            -- Outputs
            ------------ DP ------------
          when "000000001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000000101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000001001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000001101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000010001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000010101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000011001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000011101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000100001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000100101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000101001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000101101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000110001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000110101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000111001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "000111101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001000001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001000101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001001001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001001101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001010001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001010101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001011001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001011101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001100001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001100101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001101001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001101101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001110001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001110101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001111001" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ DP ------------
          when "001111101" =>
            -- Next State
            next_state <= S2b;
            -- Outputs
            ------------ LDR ------------
          when "010000001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010000011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010000101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010000111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010001001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010001011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010001101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010001111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010010001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010010011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010010101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010010111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010011001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010011011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010011101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010011111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010100001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010100011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010100101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010100111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010101001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010101011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010101101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010101111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010110001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010110011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010110101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010110111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010111001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010111011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010111101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "010111111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011000001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011000011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011000101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011000111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011001001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011001011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011001101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011001111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011010001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011010011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011010101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011010111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011011001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011011011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011011101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011011111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011100001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011100011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011100101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011100111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011101001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011101011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011101101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011101111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011110001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011110011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011110101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011110111" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011111001" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011111011" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011111101" =>
            -- Next State
            next_state <= S2a;
            -- Outputs
            ------------ LDR ------------
          when "011111111" =>
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
          when "000000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "000111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "010111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "100111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110000111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110001111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110010111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110011111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110100111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110101111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110110111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111000" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111001" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111010" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111011" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111100" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111101" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111110" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ STR ------------
          when "110111111" =>
            -- Next State
            next_state <= S4d;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "001111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "011111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "101111111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111000111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111001111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111010111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111011111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111100111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111101111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111110111" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111000" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111001" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111010" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111011" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111100" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111101" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111110" =>
            -- Next State
            next_state <= S3;
            -- Outputs
            ma_write <= '1';
            ------------ LDR ------------
          when "111111111" =>
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
          when "001111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "001111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "001111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "001111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "011111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "011111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "011111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "011111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "101111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "101111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "101111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "101111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "111111100" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "111111101" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "111111110" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "111111111" =>
            -- Next State
            next_state <= S4f;
            -- Outputs
            ------------ DP ------------
          when "001000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111000111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111001111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111010111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111011111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111100111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111101111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110100" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110101" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110110" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111110111" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "001111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "011111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "101111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111111000" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111111001" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111111010" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "111111011" =>
            -- Next State
            next_state <= S4e;
            -- Outputs
            ------------ DP ------------
          when "000111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "000111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "000111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "000111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "010111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "010111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "010111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "010111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "100111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "100111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "100111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "100111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "110111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "110111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "110111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "110111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ DP ------------
          when "000000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "000111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "010111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "100111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ DP ------------
          when "110111011" =>
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
          when "000111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "000111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "000111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "000111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "001111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "001111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "001111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "001111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "010111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "010111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "010111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "010111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "011111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "011111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "011111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "011111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "100111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "100111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "100111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "100111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "101111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "101111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "101111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "101111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "110111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "110111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "110111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "110111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "111111100" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "111111101" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "111111110" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "111111111" =>
            -- Next State
            next_state <= S4b;
            -- Outputs
            ------------ LDR ------------
          when "000000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111000111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111001111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111010111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111011111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111100111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111101111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110100" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110101" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110110" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111110111" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "000111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "001111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "010111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "011111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "100111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "101111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "110111011" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111111000" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111111001" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111111010" =>
            -- Next State
            next_state <= S4a;
            -- Outputs
            ------------ LDR ------------
          when "111111011" =>
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
        ------------ OTH ------------
      when others =>
        -- Next State
        next_state <= S0;
        -- Outputs
        pc_write <= '1';

    end case;

    -- ###################################################################### --

  end process async;
end architecture behavioral;