function [buf_nad ind potw]=telnet_Gaya_write_multi(tCmd,nad,buf_nad,ind,potw,t1,NN,rozm_buf)

if nargin<8
    rozm_buf=3;
end

N=length(nad);

if buf_nad < 1 && ind > 1
    display('Mo¿liwe zniekszta³cenia bufor danych opró¿niony !!!')
end

while buf_nad < rozm_buf && ind <= N
    %nadawanie znakow
    fprintf(tCmd,nad{ind});
    ind=ind+1;    
    buf_nad=buf_nad+1;
end
    
%     %oczekiwanie na dane z serwera
%     while(tCmd.BytesAvailable<=0)
%         drawnow
%     end

%     %odbieranie znakow
%     ile_znakow=tCmd.BytesAvailable;
%     odb = fscanf(tCmd, '%s', ile_znakow);
%     if length(odb)~=2
%         odb=odb(2:end);    
%     end

while tCmd.BytesAvailable > 0
    %odbieranie znakow
    ile_znakow=tCmd.BytesAvailable;
    odb = fscanf(tCmd, '%s', ile_znakow);
    if length(odb)~=2
        odb=odb(2:end);    
    end
    if strcmp(odb,'ok')
        obliczenia_czasu(t1,ind-buf_nad,NN);
        display([ 'Polecenie ' mat2str(ind-buf_nad) ': ' nad{ind-buf_nad} '  '])
        buf_nad=buf_nad-1;
        potw=potw+1;
    end
    drawnow
end
    
 


%     if nargout==0
%         if strcmp(odb,'ok')
%             display(['Polecenie: ' nad ' wykonane poprawnie.'])
%         end
%     end
%     if nargin<2
%             telnet_Gaya_close(tCmd);
%     end

end