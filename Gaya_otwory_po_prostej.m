function Gaya_otwory_po_prostej(x0,y0,x1,y1,glebokosc,gruboscmat,ile)

if nargin==0
    x0=-50
    y0=10
    x1=50
    y1=10
    glebokosc=1
    gruboscmat=0
    ile=5
end

offset=1.5
speed=250
gruboscoperac=5;

tCmd=telnet_Gaya_init();
%odb=Gaya_home(tCmd);

z=gruboscmat-glebokosc+gruboscoperac+offset;
odb=Gaya_move(x0,y0,z,tCmd,1000);

x=linspace(x0,x1,ile)
y=linspace(y0,y1,ile)

Gaya_wrzeciono(1,tCmd);

for n=1:ile

    z=gruboscmat-glebokosc+gruboscoperac+offset;
    odb=Gaya_move(x(n),y(n),z,tCmd,1000);

    z=gruboscmat-glebokosc+offset;
    odb=Gaya_move(x(n),y(n),z,tCmd,speed);

    z=gruboscmat-glebokosc+gruboscoperac+offset;
    odb=Gaya_move(x(n),y(n),z,tCmd,speed);

end

Gaya_wrzeciono(0,tCmd);

telnet_Gaya_close(tCmd);


