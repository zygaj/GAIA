function plotGcode(linie)

if nargin==0
        plik='obudowa_wysw.gcode'
        %plik='kubeczek.gcode'
        %plik='kubek.gcode'
        plik='pcb2.gcode'
        plik='walec2.gcode'
        plik='ostroslup.gcode'

        plik='spinner2.gcode'
        %plik='cat.gcode'
        plik='hipopotamo.gcode';
        plik='kula2.gcode'
        
        
        [linie N]=gcode_read(plik);
               
end

N=length(linie);

nx=1;nz=1;ny=1;
X=[];Y=[];Z=[];
x=0;y=0;z=0;

close all;
% figure;
% hold on;
% figure(2);
% hold on;
% figure(3);
% hold on;

for n=1:N
    tmp=linie{n};
    %if tmp(1)=='G' %&& tmp(2)=='1'

        k = strfind(tmp,'X');
        if ~isempty(k)
            e = strfind(tmp,' ');
            if ~isempty(e)
                e = e(e>k);
                if ~isempty(e)
                    x=str2double(tmp(k+1:e(1)));
                    X(nx)=x;
                    nx=nx+1;
                end
            end
        end

        k = strfind(tmp,'Y');
        if ~isempty(k)
            e = strfind(tmp,' ');
            if ~isempty(e)
                e = e(e>k);
                if ~isempty(e)
                    y=str2double(tmp(k+1:e(1)));
                    Y(ny)=y;
                    ny=ny+1;
                end
            end
        end

        k = strfind(tmp,'Z');
        if ~isempty(k)
            e = strfind(tmp,' ');
            if ~isempty(e)
                e = e(e>k);
                if ~isempty(e)
                    z=str2double(tmp(k+1:e(1)));
                    Z(nz)=z;
                    nz=nz+1;
                end
            end
        end

        %if ~isempty(x) 
        pX(n)=x;
        %end
        pY(n)=y;
        pZ(n)=z;
        
%         if n>2
% %             figure(1)
%              plot3(pX(n-1:n),pY(n-1:n),pZ(n-1:n),'b')
%              plot3(x,y,z,'.r')
% %             figure(2)
% %             plot(pX(n-1:n),pZ(n-1:n),'b')
% %             plot(x,z,'.r')
% %             figure(3)
% %             plot(pY(n-1:n),pZ(n-1:n),'b')
% %             plot(y,z,'.r')            
%         end
%         pause(0.0001)
    %end
end 

mX=[min(X) max(X) max(X)-min(X)]
mY=[min(Y) max(Y) max(Y)-min(Y)]
mZ=[min(Z) max(Z) max(Z)-min(Z)]

% disp(mX)
% disp(mY)
% disp(mZ)

figure;
hold on;
plot3(pX,pY,pZ,'b')
plot3(pX,pY,pZ,'.r')


if mX(1)<-150 || mX(2) >150
    error('STOP. Przekroczony zakres X.')
end
if mY(1)<-150 || mY(2) >150
    error('STOP. Przekroczony zakres Y.')
end
if mZ(1)<-10 || mZ(2) >400
    error('STOP. Przekroczony zakres Z.')
end

    
