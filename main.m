%Stefan was here!!

%% EE214A Final Project:Speech Activity Detection
clear all
%% Read all the files into workspace
GrabFiles
%% Initiate the parameters
speechLength=length(TrainClean(1).data(1,:));
fs = 8000;
frameSize = 0.02*8000; % duration(ms)*fs(Hz)
stepSize = 0.01*8000;
threshEnergy = 40;
threshF = 185;
threshSF = 5;

%% Framing the signal
k=1;
for i=1:stepSize:speechLength-frameSize
   z(k,1:frameSize) = TrainClean(1).data(1,i:i+frameSize-1);
   k=k+1;
end
