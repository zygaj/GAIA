function linie=Gaya_przeskaluj_prekdosc(linie)

pp=0;
for n=1:length(linie)
    
    tmp=linie{n};
        k = strfind(tmp,'F');
        if ~isempty(k)
            linie{n}=tmp(1:k-1);      
            pp=pp+1;
        end
end

if pp>0
    disp(['Przeskalowano parametr F:' mat2str(pp) ' razy.']);
end