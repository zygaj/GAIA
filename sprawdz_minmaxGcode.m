function [mX,mY,mZ]=sprawdz_minmaxGcode(linie)

N=length(linie);

nx=1;nz=1;ny=1;
X=[];Y=[];Z=[];

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

    %end
end 

mX=[min(X) max(X) max(X)-min(X)]
mY=[min(Y) max(Y) max(Y)-min(Y)]
mZ=[min(Z) max(Z) max(Z)-min(Z)]

% disp(mX)
% disp(mY)
% disp(mZ)

if mX(1)<-150 || mX(2) >150
    error('STOP. Przekroczony zakres X.')
end
if mY(1)<-150 || mY(2) >150
    error('STOP. Przekroczony zakres Y.')
end
if mZ(1)<-10 || mZ(2) >400
    error('STOP. Przekroczony zakres Z.')
end

    
