close all;
clc;
clear all;

tCmd=telnet_Gaya_init();

x=0;y=0;z=100;
odb=Gaya_move(x,y,z,tCmd);

R=100;
for alfa=0:10:360
    x=R*cos(pi*alfa/180);
    z=R*sin(pi*alfa/180)+100;
    odb=Gaya_move(x,y,z,tCmd);
end

telnet_Gaya_close(tCmd);