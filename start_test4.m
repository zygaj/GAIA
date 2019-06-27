close all;
clc;
clear all;

tCmd=telnet_Gaya_init();

X=10
Y=10
Z=100
F=3000;
E=10;

str=generuj_Gcode('move',X,Y,Z,F,E);
%str=generuj_Gcode('move',X,Y,Z);

nad=str

odb=telnet_Gaya_write(tCmd,nad)

telnet_Gaya_close(tCmd);
