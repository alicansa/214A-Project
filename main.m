%Stefan was here!!

%% EE214A Final Project:Speech Activity Detection
clear all
%% Read all the files into workspace
GrabFiles

%% MAIN LOOP
%initial parameters
frameSize = 0.02*8000; % duration(ms)*fs(Hz) 20ms
stepSize = 0.01*8000; %10ms
threshEnergy = 40;
threshF = 185;
threshSF = 5;
hammWin = HammingWindow(frameSize);
rectWin = RectWindow(frameSize);
%loop through all train files
%clean/no noise
for i=1:length(TrainClean)
    data = TrainClean(i).data';
    speechFileName = TrainClean(i).name;
    speechLength=length(data);
    speechFs = TrainClean(i).Fs;
    
    %% Pre-processing
    pro_data = PreEmphasis(data,0.97);
    %% Get statistics
    [En autocorr lags] = GetStatistics(pro_data,frameSize,stepSize,speechLength);
    plot(En);
    figure
    plot(lags(125,:),autocorr(125,:));
    figure
    plot(lags(100,:),autocorr(100,:));
    %% Process statistics
    
end

%10dB SNR
for i=1:length(Train10dB)
    data = Train10dB(i).data';
    plot(data);
    figure
    speechFileName = Train10dB(i).name;
    speechLength=length(data);
    speechFs = Train10dB(i).Fs;
    
    %% Pre-processing
    pro_data = PreEmphasis(data,0.97);
    %% Get statistics
    [En autocorr lags] = GetStatistics(pro_data,frameSize,stepSize,speechLength);
    %% Process statistics
    
end

%0dB SNR
for i=1:length(Train0dB)
    data = Train0dB(i).data';
    speechFileName = Train0dB(i).name;
    speechLength=length(data);
    speechFs = Train0dB(i).Fs;
    
    %% Pre-processing
    pro_data = PreEmphasis(data,0.97);
    %% Get statistics
    [En autocorr lags] = GetStatistics(pro_data,frameSize,stepSize,speechLength);
    %% Process statistics
    
    
end



