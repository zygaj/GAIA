function Gaya_rysuj_linie(x0,y0,x1,y1,gruboscmat,tCmd)

if nargin==0
    tCmd=telnet_Gaya_init();
    x0=-25
    y0=0
    x1=25
    y1=0
    gruboscmat=0
end

speed=1000
gruboscoperac=5;
gruboscoperac2=25;
offset=1.5;
zanurzenie=3;

%poz. spoczynkowa
z=gruboscmat+gruboscoperac+offset;
odb=Gaya_move(x0,y0,z,tCmd,speed);
%glowica w dol.
z=gruboscmat+offset-zanurzenie;
odb=Gaya_move(x0,y0,z,tCmd,speed);
%glowica rysuje kreske
odb=Gaya_move(x1,y1,z,tCmd,speed);
%poz. spoczynkowa
z=gruboscmat+gruboscoperac2+offset;
odb=Gaya_move(x1,y1,z,tCmd,1000);


if nargin==0
    telnet_Gaya_close(tCmd);
end
