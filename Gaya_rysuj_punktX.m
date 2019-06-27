function Gaya_rysuj_punktX(x,y,gruboscmat,tCmd)

if nargin==0
    tCmd=telnet_Gaya_init();
    x=50
    y=50
    gruboscmat=0
end

speed=1000
gruboscoperac=5;
gruboscoperac2=50;
offset=1.5;
zanurzenie=3;

%poz. spoczynkowa
z=gruboscmat+gruboscoperac+offset;
odb=Gaya_move(x+1,y,z,tCmd,speed);
%glowica w dol.
z=gruboscmat+offset-zanurzenie;
odb=Gaya_move(x+1,y,z,tCmd,speed);
%glowica rysuje kreske
odb=Gaya_move(x-1,y,z,tCmd,speed);
%poz. spoczynkowa
z=gruboscmat+gruboscoperac+offset;
odb=Gaya_move(x-1,y,z,tCmd,1000);
odb=Gaya_move(x,y-1,z,tCmd,1000);
%glowica w dol.
z=gruboscmat+offset-zanurzenie;
odb=Gaya_move(x,y-1,z,tCmd,speed);
%glowica rysuje kreske
odb=Gaya_move(x,y+1,z,tCmd,speed);
%poz. spoczynkowa
z=gruboscmat+gruboscoperac2+offset;
odb=Gaya_move(x,y+1,z,tCmd,1000);
odb=Gaya_move(x,y,z,tCmd,1000);


if nargin==0
    telnet_Gaya_close(tCmd);
end

