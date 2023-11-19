library IEEE;
use IEEE.std_logic_1164.all;
entity ASM is
 port( CLK, RESET, P1, P2, P3, C1, C2, C3, C4 : in std_logic;
 V1, V2, V3, R1, R2, R3: out std_logic);
end ASM; 
architecture behavior of ASM is
type state is (t0,t1,t2,t3,t4,t5,t6,t7,t8,t9);
signal currs,nexts:state;
signal sum , x ,p,y :integer ;
begin 
process(currs, P1, P2, P3, C1, C2, C3, C4)
begin
case currs is
when t0 =>
if(p1='1') then
nexts <=t1;
elsif(p1='0' and p2='1') then
nexts <=t1;
elsif(p1='0' and p2='0' and p3='1') then
nexts <=t1;
elsif(p1='0' and p2='0' and p3='0') then
nexts <=t0;
end if;
when t1 =>
if(c1='1') then
nexts <=t2;
elsif(c1='0' and c2='1') then
nexts <=t2;
elsif(c1='0' and c2='0' and c3='1')then
nexts <=t2;
elsif(c1='0' and c2='0' and c3='0' and c4='1') then
nexts <=t2;
elsif(c1='0' and c2='0' and c3='0' and c4='0') then
nexts<=t1;
end if;
when t2 =>
if(sum<x) then
nexts <=t1;
else
nexts <=t3;
end if;
when t3 =>
nexts <=t4;
when t4 =>
if(y>5) then
nexts <=t5;
else
nexts <=t6;
end if;
when t5 =>
nexts <=t4;
when t6 =>
if(y>=2)then
nexts <=t7;
else
nexts <=t8;
end if;
when t7 =>
nexts <=t6;
when t8 =>
if(y>=1) then
nexts <=t9;
else 
nexts <=t0;
end IF;
when t9 =>
nexts <=t8;
end case;
end process;


process(CLK)
begin

if(clk'event and clk='1') then
if(currs=t0) then
sum <=0;
v1 <='0';
v2 <='0';
v3 <='0';
r1 <='0';
r2 <='0';
r3 <='0';
if(p1='1') then
p <=1;
x <=4;
elsif(p1='0' and p2='1') then
p <=2;
x <=6;
elsif(p1='0' and p2 ='0' and p3='1') then
p <=3;
x <=7;
end if;
elsif(currs=t1) then
if(c1='1') then
sum <=sum+1;
elsif(c1='0' and c2='1') then
sum <=sum+2;
elsif(c1='0' and c2='0' and c3='1') then
sum <=sum+5;
elsif(c1='0' and c2='0' and c3='0' and c4='1') then
sum <=sum+10;
end if;
elsif(currs=t3) then
y <=sum-x;
if(p=1) then
v1 <='1';
elsif(p=2) then
v2 <='1';
else
v3 <='1';
end if;
elsif(currs=t4) then
r3 <='0';
elsif(currs=t5) then
r3 <='1';
y <=y-5;
elsif(currs=t6) then
r2 <='0';
elsif(currs=t7) then
r2 <='1';
y <=y-2;
elsif(currs=t8) then
r1 <='0';
elsif(currs=t9) then
r1 <='1';
y <=y-1;
end if;
end if;
end process;
process (clk,reset)
begin
if(reset='0') then
currs<=t0;
elsif(clk'event and clk='1') then
currs<=nexts;
end if;
end process;

end behavior;