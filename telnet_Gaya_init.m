function tCmd=telnet_Gaya_init(ip)

    if nargin==0
        %clc
        %ustawienia wej.
        ip='10.1.6.247'
    end

    portCmd=23;
    buffSize=1024;

    %przygotowanie srodowiska
    tCmd = tcpip(ip, portCmd);
    set(tCmd,'InputBufferSize',buffSize);
    set(tCmd,'OutputBufferSize',buffSize);
    set(tCmd,'Timeout',30);

    %otwarcie portu
    fopen(tCmd);

    %oczekiwanie na dane z serwera
    while(tCmd.BytesAvailable<=0)
        drawnow
    end

    %odbieranie znakow
    ile_znakow=tCmd.BytesAvailable;
    odb = fscanf(tCmd, '%s', ile_znakow);

    if strcmp(odb,'Smoothiecommandshell')
        display('Polaczenie z Gaya zostalo otwarte.')
    end
    
    if nargout==0
        %zamkniecie portu
        fclose(tCmd);
        display('Polaczenie z Gaya zostalo zamkniete.')
    end
    

    
end

