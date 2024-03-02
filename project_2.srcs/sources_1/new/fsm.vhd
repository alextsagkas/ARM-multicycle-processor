library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port (
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
begin

end architecture behavioral;