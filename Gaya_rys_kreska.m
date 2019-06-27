function Gaya_rys_kreska(x0,y0,x1,y1,glebokosc,gruboscmat)

if nargin==0
    x0=-50
    y0=0
    x1=50
    y1=0
    glebokosc=1
    gruboscmat=0
end

offset=1.5
speed=500
gruboscoperac=50;

tCmd=telnet_Gaya_init();
%odb=Gaya_home(tCmd);

z=gruboscmat-glebokosc+gruboscoperac+offset
odb=Gaya_move(x0,y0,z,tCmd,1000);

z=gruboscmat-glebokosc+offset
odb=Gaya_move(x0,y0,z,tCmd,speed);

odb=Gaya_move(x1,y1,z,tCmd,speed);

z=gruboscmat+gruboscoperac+offset
odb=Gaya_move(x1,y1,z,tCmd,speed);

telnet_Gaya_close(tCmd);


