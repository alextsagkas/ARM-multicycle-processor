library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
  generic (
    N : integer := 32
  );
  port (
    source_1 : in std_logic_vector(N - 1 downto 0);
    source_2 : in std_logic_vector(N - 1 downto 0);
    shamt5   : in std_logic_vector(4 downto 0);
    control  : in std_logic_vector(2 downto 0);
    result   : out std_logic_vector(N - 1 downto 0);
    flags    : out std_logic_vector(3 downto 0) -- N, Z, C, V
  );
end entity alu;

architecture behavioral of alu is
begin
  process (source_1, source_2, shamt5, control)
    -- Addition & Subtraction
    variable source_1_v : signed (N + 1 downto 0);
    variable source_2_v : signed (N + 1 downto 0);
    variable result_v   : signed (N + 1 downto 0);
    -- And & XOR
    variable tmp : std_logic_vector(N - 1 downto 0);
  begin
    -- Initialize flags to avoid latches
    flags <= (others => '0');

    case control is

        -- ADD(S)
      when "000" =>
        -- Format sources
        source_1_v := signed('0' & source_1(N - 1) & source_1);
        source_2_v := signed('0' & source_2(N - 1) & source_2);
        -- Result
        result_v := source_1_v + source_2_v;
        result <= std_logic_vector(result_v(N - 1 downto 0));
        -- V
        flags(0) <= std_logic(result_v(N) xor result_v(N - 1));
        -- C
        flags(1) <= std_logic(result_v(N + 1));
        -- Z
        if (result_v(N - 1 downto 0) = 0) then
          flags(2) <= '1';
        else
          flags(2) <= '0';
        end if;
        -- N
        if (result_v(N - 1) = '1') then
          flags(3) <= '1';
        else
          flags(3) <= '0';
        end if;

        -- SUB(S)
      when "001" =>
        -- Format sources
        source_1_v := signed('0' & source_1(N - 1) & source_1);
        source_2_v := signed('0' & not source_2(N - 1) & not source_2) + 1; -- 2's complement
        -- Result
        result_v := source_1_v + source_2_v;
        result <= std_logic_vector(result_v(N - 1 downto 0));
        -- V
        flags(0) <= std_logic(result_v(N) xor result_v(N - 1));
        -- C
        flags(1) <= std_logic(result_v(N + 1));
        -- Z
        if (result_v(N - 1 downto 0) = 0) then
          flags(2) <= '1';
        else
          flags(2) <= '0';
        end if;
        -- N
        if (result_v(N - 1) = '1') then
          flags(3) <= '1';
        else
          flags(3) <= '0';
        end if;

        -- AND(S)
      when "010" =>
        tmp := source_1 and source_2;
        result <= std_logic_vector(tmp);
        -- V
        flags(0) <= '0';
        -- C
        flags(1) <= '0';
        -- Z
        if (signed(tmp) = 0) then
          flags(2) <= '1';
        else
          flags(2) <= '0';
        end if;
        -- N
        if (tmp(N - 1) = '1') then
          flags(3) <= '1';
        else
          flags(3) <= '0';
        end if;

        -- XOR(S)
      when "011" =>
        tmp := source_1 xor source_2;
        result <= std_logic_vector(tmp);
        -- V
        flags(0) <= '0';
        -- C
        flags(1) <= '0';
        -- Z
        if (signed(tmp) = 0) then
          flags(2) <= '1';
        else
          flags(2) <= '0';
        end if;
        -- N
        if (tmp(N - 1) = '1') then
          flags(3) <= '1';
        else
          flags(3) <= '0';
        end if;

        -- MOV & NOP (S=0)
      when "100" =>
        result <= source_2;

        -- MVN (S=0)
      when "101" =>
        result <= not source_2;

        -- LSL (S=0)
      when "110" =>
        result <= std_logic_vector(shift_left(signed(source_2), to_integer(unsigned(shamt5))));

        -- ASR (S=0)
      when "111" =>
        result <= std_logic_vector(shift_right(signed(source_2), to_integer(unsigned(shamt5))));

        -- When others do nothing
      when others => null;

    end case;
  end process;

end architecture behavioral;