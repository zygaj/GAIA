function [ok]=gcode_write(plik,linie)
%linie bez enterow!

if nargin==0
    plikr='kubek_wr2.gcode';
    [linie N]=gcode_read(plikr);
    plik='kubek_wr3.gcode';
end

N=length(linie);

fileID = fopen(plik,'w');

for n=1:N
    tmp = linie{n};
    dalej=0;
    while dalej==0
        if tmp(end)==' ' && length(tmp>1)
            tmp=tmp(1:end-1);
        else
            dalej=1;
        end
    end
    
    fprintf(fileID,'%s \r\n',tmp);
    
end

ok=fclose(fileID);

end