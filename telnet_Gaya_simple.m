function odb=telnet_Gaya_simple(ip,nad)

    if nargin==1
        nad=ip;
        ip='10.1.6.246';
    end
    if nargin==0
        %ustawienia wej.
        ip='10.1.6.246';
        %ip='10.10.1.116';
        nad='ls';
        nad='G1 X0Y0Z100';
    end

    portCmd=23;
    buffSize=1024;

    %przygotowanie srodowiska
    tCmd = tcpip(ip, portCmd);
    set(tCmd,'InputBufferSize',buffSize);
    set(tCmd,'OutputBufferSize',buffSize);

    %otwarcie portu
    fopen(tCmd);

    %oczekiwanie na dane z serwera
    while(tCmd.BytesAvailable<=0)
        drawnow
    end

    %odbieranie znakow
    ile_znakow=tCmd.BytesAvailable;
    odb = fscanf(tCmd, '%s', ile_znakow);
    
    %nadawanie znakow
    fprintf(tCmd,nad);

    %oczekiwanie na dane z serwera
    while(tCmd.BytesAvailable<=0)
        drawnow
    end

    %odbieranie znakow
    ile_znakow=tCmd.BytesAvailable;
    odb = fscanf(tCmd, '%s', ile_znakow);
    odb=odb(2:end);    
    
    while tCmd.BytesAvailable > 0
        %odbieranie znakow
        ile_znakow=tCmd.BytesAvailable;
        odb = [odb 13 fscanf(tCmd, '%s', ile_znakow)];
    end
    
    
    %zamkniecie portu
    fclose(tCmd);

end



