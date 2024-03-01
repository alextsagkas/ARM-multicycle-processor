library ieee;
use ieee.std_logic_1164.all;

entity instr_dec is
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
end entity instr_dec;

architecture behavioral of instr_dec is
begin
  process (op, funct)
    variable op_funct : std_logic_vector(7 downto 0);
  begin
    op_funct := op & funct;

    case op_funct is
        -- ADD
      when "0010100-" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "00";
        alu_control <= "000";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- ADD
      when "0000100-" =>
        reg_src     <= "000";
        alu_src     <= '0';
        imm_src     <= "--";
          alu_control <= "000";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- SUB
      when "0010010-" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "00";
        alu_control <= "001";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- SUB
      when "0000010-" =>
        reg_src     <= "000";
        alu_src     <= '0';
        imm_src     <= "--";
          alu_control <= "001";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- CMP
      when "00110101" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "00";
        alu_control <= "001";
        mem_to_reg  <= '-';
        no_write_in <= '1';
        -- CMP
      when "00010101" =>
        reg_src     <= "000";
        alu_src     <= '0';
        imm_src     <= "--";
          alu_control <= "001";
        mem_to_reg  <= '-';
        no_write_in <= '1';
        -- AND
      when "0010000-" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "00";
        alu_control <= "010";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- AND
      when "0000000-" =>
        reg_src     <= "000";
        alu_src     <= '0';
        imm_src     <= "--";
          alu_control <= "010";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- XOR
      when "0010001-" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "00";
        alu_control <= "011";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- XOR
      when "0000001-" =>
        reg_src     <= "000";
        alu_src     <= '0';
        imm_src     <= "--";
          alu_control <= "011";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- MOV / NOP
      when "00111010" =>
        reg_src     <= "0--";
          alu_src     <= '1';
        imm_src     <= "00";
        alu_control <= "100";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- MOV / NOP / LSL / ASR
      when "00011010" =>
        reg_src     <= "00-";
        alu_src     <= '0';
        imm_src     <= "--";
          alu_control <= "100";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- MVN
      when "00111110" =>
        reg_src     <= "0--";
          alu_src     <= '1';
        imm_src     <= "00";
        alu_control <= "101";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- MVN
      when "00011110" =>
        reg_src     <= "00-";
        alu_src     <= '0';
        imm_src     <= "--";
          alu_control <= "101";
        mem_to_reg  <= '0';
        no_write_in <= '0';
        -- LDR
      when "01011001" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "01";
        alu_control <= "000";
        mem_to_reg  <= '1';
        no_write_in <= '0';
        -- LDR
      when "01010001" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "01";
        alu_control <= "001";
        mem_to_reg  <= '1';
        no_write_in <= '0';
        -- STR
      when "01011000" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "01";
        alu_control <= "000";
        mem_to_reg  <= '-';
        no_write_in <= '0';
        -- STR
      when "01010000" =>
        reg_src     <= "0-0";
        alu_src     <= '1';
        imm_src     <= "01";
        alu_control <= "001";
        mem_to_reg  <= '-';
        no_write_in <= '0';
        -- B
      when "1010----" =>
        reg_src     <= "--1";
          alu_src     <= '1';
        imm_src     <= "10";
        alu_control <= "000";
        mem_to_reg  <= '-';
        no_write_in <= '0';
        -- BL
      when "1011----" =>
        reg_src     <= "1-1";
        alu_src     <= '1';
        imm_src     <= "10";
        alu_control <= "000";
        mem_to_reg  <= '-';
        no_write_in <= '0';
        -- OTHERS
      when others =>
        reg_src     <= "---";
          alu_src     <= '-';
        imm_src     <= "--";
          alu_control <= "---";
          mem_to_reg  <= '-';
        no_write_in <= '-';
    end case;

  end process;
end architecture behavioral;