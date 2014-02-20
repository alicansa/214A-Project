%Stefan was here!!

%% EE214A Final Project:Speech Activity Detection
clear all
%% Read all the training file(clean) into workspace
files = dir('/Users/evanwu/Documents/MATLAB/Digital Speech Processing/Final Project/Train/Clean/*.08');
filesLength = length(files);
for i=1:filesLength
currentFileName=files(i).name;
fid = fopen(['/Users/evanwu/Documents/MATLAB/Digital Speech Processing/Final Project/Train/Clean/',currentFileName],'r','b');
y = fread(fid, inf, 'int16');
fclose(fid);
x(i,1:length(y)) = y/max(abs(y));
%wavwrite(x,8000,currentFileName);   %Write .wav file into current folder
end
clear y;
%% Initiate the parameters
speechLength=length(x(1,:));
fs = 8000;
frameSize = 0.02*8000; % duration(ms)*fs(Hz)
stepSize = 0.01*8000;
threshEnergy = 40;
threshF = 185;
threshSF = 5;

%% Framing the signal
k=1;
for i=1:stepSize:speechLength-frameSize
   z(k,1:frameSize) = x(1,i:i+frameSize-1);
   k=k+1;
end
