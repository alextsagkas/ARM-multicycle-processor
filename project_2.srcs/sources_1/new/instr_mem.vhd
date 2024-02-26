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
  X"E3A00000", X"E3E01000", X"E0812000", X"E24230FF",
  X"E1A00000", X"EAFFFFF9", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000",
  X"00000000", X"00000000", X"00000000", X"00000000");
  -- The corresponding assembly code is:
  -- MAIN PROGGRAM: 
  -- MOV R0, #0; R0 = 0x00000000
  -- MVN R1, #0; R1 = 0xFFFFFFFF
  -- ADD R2, R1, R0; R2 = R1 + R0
  -- SUB R3, R2, #255; R3 = R2 - 0d255
  -- MOV R0, R0; // NOP
  -- B MAIN PROGRAM
begin
  data <= ROM(to_integer(unsigned(address)));
end architecture behavioral;