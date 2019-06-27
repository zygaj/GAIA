function odb=telnet_Gaya_write(tCmd,nad)

if nargin==0
    tCmd=telnet_Gaya_init();
    nad='G1 X0Y0Z0';
end
if nargin==1
    nad=tCmd;
    tCmd=telnet_Gaya_init();
end

    %nadawanie znakow
    fprintf(tCmd,nad);

    %oczekiwanie na dane z serwera
    while(tCmd.BytesAvailable<=0)
        drawnow
    end

    %odbieranie znakow
    ile_znakow=tCmd.BytesAvailable;
    odb = fscanf(tCmd, '%s', ile_znakow);
    if length(odb)~=2
        odb=odb(2:end);    
    end
    
    while tCmd.BytesAvailable > 0
        %odbieranie znakow
        ile_znakow=tCmd.BytesAvailable;
        odb = [odb 13 fscanf(tCmd, '%s', ile_znakow)];
    end

    if nargout==0
        if strcmp(odb,'ok')
            display(['Polecenie: ' nad ' wykonane poprawnie.'])
        end
    end

    if nargin<2
            telnet_Gaya_close(tCmd);
    end
end