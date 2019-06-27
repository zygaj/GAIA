function odb=telnet_Gaya_read(tCmd)

    %oczekiwanie na dane z serwera
    while(tCmd.BytesAvailable<=0)
        drawnow
    end

    %odbieranie znakow
    ile_znakow=tCmd.BytesAvailable;
    odb = fscanf(tCmd, '%s', ile_znakow);

end