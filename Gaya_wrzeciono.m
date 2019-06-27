function odb=Gaya_wrzeciono(wlacznik,tCmd)

    if nargin==0
        wlacznik=1;
        tCmd=telnet_Gaya_init();
    end
    if nargin==1
        tCmd=telnet_Gaya_init_silent();
    end
    
    if wlacznik==1
        nad=['M3 S15000'];
    else
        nad=['M3 S0'];
    end
    
    odb=telnet_Gaya_write(tCmd,nad);
    
   if nargin==0
        if strcmp(odb,'ok')
            display(['Polecenie: ' nad ' wykonane poprawnie.'])
        end
        pause(1);
        nad=['M3 S0'];
        odb=telnet_Gaya_write(tCmd,nad);
        if strcmp(odb,'ok')
            display(['Polecenie: ' nad ' wykonane poprawnie.'])
        end
   end

   if nargin==0
        telnet_Gaya_close(tCmd);
   end
   if nargin==1
        telnet_Gaya_close_silent(tCmd);
   end
   
end