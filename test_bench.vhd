--Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
--empty
end testbench;

architecture tb of testbench is

--DUT component
component seq_gate is
port(
  --t: in std_logic;
  ---clk: in std_logic;
  --qout : out std_logic;
  a_in : in std_logic;
  b_in : in std_logic;
  c_in : in std_logic;
  x : in std_logic;
  clk : in std_logic;
  a_out : out std_logic;
  b_out : out std_logic;
  c_out : out std_logic;
  y : out std_logic);
end component;

signal a_in :  std_logic := '0';
signal b_in : std_logic := '0';
signal c_in : std_logic := '0';
signal x : std_logic := '0';
signal clk : std_logic := '0';
signal a_out : std_logic := '0';
signal b_out : std_logic := '0';
signal c_out : std_logic := '0';
signal y : std_logic := '0';



begin

--Connect DUT
	DUT: seq_gate port map(a_in,b_in,c_in,x,clk,a_out,b_out,c_out,y);

	process
	begin
    --first--;
      a_in <= '0';
      b_in <= '0';
      c_in <= '0';
      x <= '0';
      clk <= '1';
      wait for 1 ns;
      assert(a_out='0' and b_out='1' and c_out='1' and y='0') 
      report "Fail 0-0-0-0/0-1-1-0" severity error; 
      report " a_out : " & std_logic'image(a_out);
      report " b_out : " & std_logic'image(b_out);
      report " c_out : " & std_logic'image(c_out);
      report " y : " & std_logic'image(y);


	--second--;
      a_in <= '0';
      b_in <= '0';
      c_in <= '0';
      x <= '1';
      clk <= '1';
      wait for 1 ns;
      assert(a_out='1' and b_out='0' and c_out='0' and y='1') 
      report "Fail 0-0-0-1/1-0-0-1" severity error; 
      report " a_out : " & std_logic'image(a_out);
      report " b_out : " & std_logic'image(b_out);
      report " c_out : " & std_logic'image(c_out);
      report " y : " & std_logic'image(y);

--3
	  a_in <= '0';
      b_in <= '0';
      c_in <= '1';
      x <= '0';
      clk <= '1';
      wait for 1 ns;
      assert(a_out='0' and b_out='0' and c_out='1' and y='0') 
      report "Fail 0-0-1-0/0-0-1-0" severity error; 
      report " a_out : " & std_logic'image(a_out);
      report " b_out : " & std_logic'image(b_out);
      report " c_out : " & std_logic'image(c_out);
      report " y : " & std_logic'image(y);
      
--4
	  a_in <= '0';
      b_in <= '0';
      c_in <= '1';
      x <= '1';
      clk <= '1';
      wait for 1 ns;
      assert(a_out='1' and b_out='0' and c_out='0' and y='1') 
      report "Fail 0-0-1-1/1-0-0-1" severity error; 
      report " a_out : " & std_logic'image(a_out);
      report " b_out : " & std_logic'image(b_out);
      report " c_out : " & std_logic'image(c_out);
      report " y : " & std_logic'image(y);
--5
	  a_in <= '0';
      b_in <= '1';
      c_in <= '0';
      x <= '0';
      clk <= '1';
      wait for 1 ns;
      assert(a_out='0' and b_out='1' and c_out='0' and y='0') 
      report "Fail 0-1-0-0/0-1-0-0" severity error; 
      report " a_out : " & std_logic'image(a_out);
      report " b_out : " & std_logic'image(b_out);
      report " c_out : " & std_logic'image(c_out);
      report " y : " & std_logic'image(y);
    
    --Clear inputs
      a_in <= '0';
      b_in <= '0';
      c_in <= '0';

      assert false report "Test done." severity note;
      wait;
  end process;
end tb;