--Code your design here
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity seq_gate is
port(
  a_in : in std_logic;
  b_in : in std_logic;
  c_in : in std_logic;
  x : in std_logic;
  clk : in std_logic;
  a_out : out std_logic;
  b_out : out std_logic;
  c_out : out std_logic;
  y : out std_logic
  );
end seq_gate;

architecture blackbox of seq_gate is
begin
  process(a_in,b_in,c_in,x) is
  begin
    a_out <= (not a_in) and (not b_in) and (x);
    b_out <= (a_in) or ((not c_in) and (not x )) or ((b_in and c_in) and (x));
    c_out <= ((not a_in) and (not b_in) and (not c_in) and (not x)) or (a_in and x) or (c_in and x);
    y <= (not a_in) and (x);
  end process;
end blackbox;