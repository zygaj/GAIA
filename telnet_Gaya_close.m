function telnet_Gaya_close(tCmd)
    %zamkniecie portu
    fclose(tCmd);
    display('Polaczenie z Gaya zostalo zamkniete.')
end