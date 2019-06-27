function odb=Gaya_home(tCmd)

    if nargin==0
        tCmd=telnet_Gaya_init();
    end
       
    nad=['G28'];
    odb=telnet_Gaya_write(tCmd,nad);
    
   if nargin==0
        if strcmp(odb,'ok')
            display(['Polecenie: ' nad ' wykonane poprawnie.'])
        end
   end
    
   if nargin==0
        telnet_Gaya_close(tCmd);
   end
   
end