%function Gaya_gcode_play(plik)

%if nargin==0
    plik='kubek.gcode';
    %plik='kwadrat.cnc';
    clc
%end

%odczyt pliku
[linie N]=gcode_read(plik);

%polaczenie z Gaia
tCmd=telnet_Gaya_init();

t1=clock;
for n=1:N
    nad=linie{n};    
    czas=etime(clock,t1);
    czas100=czas*N/n;
    czasdokonca=czas100-czas;
    cdkmin=round(czasdokonca/60-0.5);
    if cdkmin<0 
        cdkmin=0;
    end
    cdks=round(czasdokonca-cdkmin*60);
    %display([mat2str(round(100*n/N)) '% ' odb '.:' 'Polecenie: ' linie{n} ])
    if n>10
        fprintf('%d%c Do konca: %d min. %d s, Polecenie: %s ;--->',round(100*n/N),37,cdkmin,cdks,linie{n});
    else
        fprintf('%d%c Polecenie: %s ;--->',round(100*n/N),37,linie{n});
    end
    odb=telnet_Gaya_write(tCmd,nad); 
    display([odb '.']);

end

%zamkniecie polaczenia z Gaia
telnet_Gaya_close(tCmd);

%end