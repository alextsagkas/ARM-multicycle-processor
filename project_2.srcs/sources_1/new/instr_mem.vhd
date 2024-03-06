library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_mem is
  generic (
    N : integer := 6;
    M : integer := 32
  );
  port (
    address : in std_logic_vector(N - 1 downto 0);
    data    : out std_logic_vector(M - 1 downto 0)
  );
end entity instr_mem;

architecture behavioral of instr_mem is
  type instr_mem_array is array (0 to 2 ** N - 1) of std_logic_vector(M - 1 downto 0);
  constant ROM : instr_mem_array := (
  X"E3A00002", X"E1A00000", X"E3500002", X"03A01001",
  X"E3E020FC", X"E1E03001", X"E3530001", X"03E01001",
  X"E2834004", X"E0915000", X"E3530001", X"02811001",
  X"E0526003", X"E2457003", X"E3A08000", X"E3580001",
  X"12818001", X"E3A00005", X"E0149000", X"E205A002",
  X"0205B007", X"E1A0BF03", X"E3E0C000", X"E02BB00C",
  X"E228C005", X"E15B0003", X"62259007", X"E1A01101",
  X"01A01101", X"E1A03143", X"01A00140", X"E3A01000",
  X"E581C000", X"4581C004", X"E5910000", X"05911004",
  X"EAFFFFDA", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000"
  );
begin
  data <= ROM(to_integer(unsigned(address)));
end architecture behavioral;