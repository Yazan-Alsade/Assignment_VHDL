library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity testbench is
end testbench; 
architecture behavioral of testbench is
signal CLK, RESET, P1, P2, P3, C1, C2, C3, C4 : std_logic:='0';
signal  V1, V2, V3, R1, R2, R3: std_logic:='0';
component ASM 
 port( CLK, RESET, P1, P2, P3, C1, C2, C3, C4 : std_logic;
 V1, V2, V3, R1, R2, R3: out std_logic);
end component; 
constant t:time:=20 ns;
begin
ey:asm port map (CLK, RESET, P1, P2, P3, C1, C2, C3, C4,V1, V2, V3, R1, R2, R3);
process 
begin
clk <='0';
wait for t/2;
clk <='1';
wait for t/2;
end process;
process
begin
reset <='0';
wait for t*2;

reset <='1';
p1<='0';
p2<='0';
p3<='0';
c1<='0';
c2<='0';
c3<='0';
c4<='0';
wait for t*2;
p1<='1';
wait for t*2;
p1<='0';
wait for t*2;
c1<='1';
wait for t;
c1<='0';
wait for 3*t;
c2 <='1';
wait for t;
c2<='0';
wait for 3*t;
c3<='1';
wait for t*1;
c3<='0';
wait for t*10;
reset <='0';
wait for t*2;
reset <='1';
p1<='0';
p2<='0';
p3<='0';
c1<='0';
c2<='0';
c3<='0';
c4<='0';
wait for t*2;
p3<='1';
wait for t*2;
p3<='0';
wait for t*2;
c1<='1';
wait for t;
c1<='0';
wait for 3*t;
c3 <='1';
wait for t;
c3<='0';
wait for 3*t;
c4<='1';
wait for t*1;
c4<='0';
wait for t*10;
wait;
end process;
end behavioral;