close all;
clc;
clear all;

tCmd=telnet_Gaya_init();

x=0;y=0;z=0;
odb=Gaya_move(x,y,z,tCmd);

Rs=100;

% minY=-100
% maxY=100;
% krokY=10;

krokBe=10;
maxBe=180;

krokAl=10;
maxAl=180;

% R=Rs*cos(pi*beta/180);
% z=Rs*sin(pi*beta/180);
%glowica porusza sie po polokregach w plaszczyznie zx inkrementujac
%polozenie osi y
for alfa=krokAl:krokAl:maxAl-krokAl
        
        y=Rs*cos(pi*alfa/180);
        R=Rs*sin(pi*alfa/180);
        for beta=0:krokBe:maxBe
            x=R*cos(pi*beta/180);
            z=R*sin(pi*beta/180);
            odb=Gaya_move(x,y,z,tCmd);
            %pomiar
        end
    alfa=alfa+krokAl; 
        y=Rs*cos(pi*alfa/180);
        R=Rs*sin(pi*alfa/180);
        for beta=maxBe:-krokBe:0
            x=R*cos(pi*beta/180);
            z=R*sin(pi*beta/180);
            odb=Gaya_move(x,y,z,tCmd);
            %pomiar
        end
        
        display(['Wykonano: ' mat2str(round(100*alfa/maxAl)) '%'])
end


telnet_Gaya_close(tCmd);