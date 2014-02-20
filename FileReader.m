function [output] = FileReader(fileName)
%Reads the sound files

fid = fopen(fileName, 'r', 'b');
y = fread(fid,inf, 'int16');
fclose(fid);
output = y/max(abs(y)); 

end

