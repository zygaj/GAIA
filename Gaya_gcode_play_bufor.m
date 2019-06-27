%function Gaya_gcode_play_bufor(plik)

%if nargin==0
close all
    plik='kubek2.gcode';
    plik='kubeczek.gcode';
    %plik='kwadrat.cnc';
    %plik='shape_cube.gcode';
    plik='obudowa_wysw.gcode'
    plik='pcb2.gcode'
    plik='walec.gcode'
    clc
%end

%odczyt pliku
[linie N]=gcode_read(plik);
[mX,mY,mZ]=sprawdz_minmaxGcode(linie);
plotGcode(linie)


%linie=Gaya_przeskaluj_prekdosc(linie);


%polaczenie z Gaia

tCmd=telnet_Gaya_init();
gruboscmat=1;
% Gaya_rysuj_punktX(mX(1),mY(1),gruboscmat,tCmd)
% Gaya_rysuj_punktX(mX(1),mY(2),gruboscmat,tCmd)
% Gaya_rysuj_punktX(mX(2),mY(1),gruboscmat,tCmd)
% Gaya_rysuj_punktX(mX(2),mY(2),gruboscmat,tCmd)

% margines=10;
% Gaya_rysuj_linie(-50,mY(1)-margines,50,mY(1)-margines,gruboscmat,tCmd)

% return;

t1=clock;

ind=1;
buf_nad=0;potw=0;
nad=linie;
N=length(nad);
m=1;NN=N;buferr=0;
while ind<=N || potw < N
  
    [buf_nad ind potw]=telnet_Gaya_write_multi(tCmd,nad,buf_nad,ind,potw,t1,NN,5);
    if buf_nad<1
        buferr=buferr+1;
    end
end
czas=etime(clock,t1);
cdkmin=round(czas/60-0.5);
if cdkmin<0 
   cdkmin=0;
end
cdks=round(czas-cdkmin*60);
display(['Ukoñczono w: ' mat2str(cdkmin) ' min. i ',mat2str(cdks) ' sek.']);
display(['Wystapilo ' mat2str(buferr) ' problemow z buforem danych.']);

%zamkniecie polaczenia z Gaia
telnet_Gaya_close(tCmd);

%end