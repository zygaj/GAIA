close all;
clc;
clear all;

tCmd=telnet_Gaya_init();

x=0;y=0;z=0;
odb=Gaya_move(x,y,z,tCmd)

telnet_Gaya_close(tCmd);