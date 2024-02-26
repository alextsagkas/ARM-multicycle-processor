library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- always one of the two inputs is 0x4 to achieve the increment by 4
-- to the other input
entity add_4 is
  generic (N : integer := 32);
  port (
    input_1  : in std_logic_vector(N - 1 downto 0);
    input_2  : in std_logic_vector(N - 1 downto 0);
    output_1 : out std_logic_vector(N - 1 downto 0)
  );
end entity add_4;

architecture dataflow of add_4 is
begin
  output_1 <= std_logic_vector(unsigned(input_1) + unsigned(input_2));
end architecture dataflow;