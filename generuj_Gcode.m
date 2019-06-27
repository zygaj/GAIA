function str=generuj_Gcode(instrukcja,X,Y,Z,F,E)

if nargin==0
    instrukcja='move';
    X=0;
    Y=0;
    Z=0;
    F=1200;
    E=0;
end

if strcmp(instrukcja,'move')
    
    if nargin<5
        str=['G1 X' mat2str(X) ' Y' mat2str(Y) ' Z' mat2str(Z)]
    else
        str=['G1 X' mat2str(X) ' Y' mat2str(Y) ' Z' mat2str(Z) ' F' mat2str(F)]
    end

    
end

end
