function obliczenia_czasu(t1,n,N)
 
    czas=etime(clock,t1);
    czas100=czas*N/n;
    czasdokonca=czas100-czas;
    cdkmin=round(czasdokonca/60-0.5);
    if cdkmin<0 
        cdkmin=0;
    end
    cdks=round(czasdokonca-cdkmin*60);
    %display([mat2str(round(100*n/N)) '% ' odb '.:' 'Polecenie: ' linie{n} ])
    %if n>10
        fprintf('%d%c Do koñca: %d min. ',round(100*n/N),37,cdkmin);
    %end
    
end