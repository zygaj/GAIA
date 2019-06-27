function [ok]=gcode_przesun_model(plikr,plikw,z_offset)
%linie bez enterow!

if nargin==0
    plikr='kubek.gcode';
    plikw='kubek_wr4.gcode';
    z_offset=0.1;
end

[linie N]=gcode_read(plikr);
liniew=linie;

for n=1:N
    tmp = linie{n};
    
        k = strfind(tmp,'Z');
        if ~isempty(k)
            e = strfind(tmp,' ');
            if ~isempty(e)
                e = e(e>k);
                if ~isempty(e)
                    z=str2double(tmp(k+1:e(1)));
                    z=z+z_offset;
                    tmpnewz=num2str(z);
                    tmp=[tmp(1:k) tmpnewz tmp(e(1):end)];
                end
            end
        end
    
    liniew{n}=tmp;
end

[ok]=gcode_write(plikw,liniew);

end