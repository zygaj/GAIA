function [linie N]=gcode_read(plik)
%linie bez enterow!

if nargin==0
    plik='kubek.gcode';
end

fileID = fopen(plik,'r');

%konwersja pliku na polecenia
n=0;
while ~feof(fileID)
    zapis='y';
    zaplin='y';
    tmp = fgets(fileID,1);
    if tmp==';' || tmp==13 || tmp==10 || tmp=='%'
        zapis='n';
        zaplin='n';
    else
        odb=tmp;
    end
        while tmp~=10
            tmp=fgets(fileID,1);
            if tmp==';' || tmp==10 || tmp==13
                zapis='n';
            end
            if zapis=='y'
                odb = [odb tmp];
            end
        end
        if zaplin=='y'
            n=n+1;linie{n}=odb;
        end
end

N=length(linie);
fclose(fileID);

end