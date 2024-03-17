library ieee;
use ieee.std_logic_1164.all;

package dont_care_pkg is
  function compare_dont_care(
    a : in std_logic_vector;
    b : in std_logic_vector
  ) return boolean;
  function compare_dont_care(
    a : in std_logic;
    b : in std_logic
  ) return boolean;
end package;

package body dont_care_pkg is
  -- Compare don't care singal vectors (containing dashes)
  function compare_dont_care(
    a : in std_logic_vector;
    b : in std_logic_vector
  ) return boolean is
    variable result    : boolean;
    variable dont_care : std_logic := '-';
  begin
    result := false;
    for i in a'range loop
      if (a(i) /= dont_care and b(i) /= dont_care and a(i) /= b(i)) then
        result := true;
        exit;
      end if;
    end loop;
    return result;
  end function compare_dont_care;

  -- Compare don't care singlas (containing dashes)
  function compare_dont_care(
    a : in std_logic;
    b : in std_logic
  ) return boolean is
    variable result    : boolean;
    variable dont_care : std_logic := '-';
  begin
    result := false;
    if (a /= dont_care and b /= dont_care and a /= b) then
      result := true;
    end if;
    return result;
  end function compare_dont_care;
end package body dont_care_pkg;