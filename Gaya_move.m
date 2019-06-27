function odb=Gaya_move(x,y,z,tCmd,speed)

    if nargin==0
        x=0;y=0;z=10;
        tCmd=telnet_Gaya_init();
    end
    if nargin<=3
        tCmd=telnet_Gaya_init_silent();
    end
    if nargin<5
        speed=2000;
    end
    
    if abs(x)>100
        display('Operacja przerwana X>100.');
        odb='no';
        if nargin>=3
            telnet_Gaya_close_silent(tCmd);
        end
        return;
    end
    if abs(y)>100
        display('Operacja przerwana Y>100.');
        odb='no';
        if nargin>=3
            telnet_Gaya_close_silent(tCmd);
        end        
        return;
    end  
    if z>400
        display('Operacja przerwana Z>400.');
        odb='no';
        if nargin<=3
            telnet_Gaya_close_silent(tCmd);
        end        
        return;
    end
    if z<-10
        display('Operacja przerwana Z<0.');
        odb='no';
        if nargin<=3
            telnet_Gaya_close_silent(tCmd);
        end        
        return;
    end
    
    nad=['G1 X' mat2str(x) 'Y' mat2str(y) 'Z' mat2str(z) 'F' mat2str(speed)];
    odb=telnet_Gaya_write(tCmd,nad);
    
   if nargin==0
        if strcmp(odb,'ok')
            display(['Polecenie: ' nad ' wykonane poprawnie.'])
        end
   end
    
   if nargin<=3
        telnet_Gaya_close_silent(tCmd);
   end
   if nargin==0
        telnet_Gaya_close(tCmd);
   end
   
end