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
% loop through all train files
doClean=1;
do10=0;
do0=0;

%% clean/no noise
if doClean
    for i=1:length(EvalClean)
        data = EvalClean(i).data';
        t = 0:1/8000:(length(data)-1)/8000;
        plot(t,data);
        speechFileName = EvalClean(i).name;
        speechLength=length(data);
        speechFs = EvalClean(i).Fs;
        %% Pre-processing
        pro_data = PreEmphasis(data,0.97);
        %% Get statistics
        [En En_log autocorr lags S F T] = GetStatistics(pro_data,frameSize,stepSize,speechLength,speechFs);
    %     figure
    %     imagesc(T,F,log10(abs(S)))
        %% Process statistics
        decisions = ProcessStatistics(En,autocorr,lags,S,F,T,frameSize,stepSize,speechLength,0.9,speechFs);
        %% Evaluation
        [Pfa(i), Pmiss(i), aveError(i) grnd_truth] = evalSAD(decisions,strcat('2014/Eval/Labels/',speechFileName(1:length(speechFileName)-2),'txt'),1000*frameSize/speechFs);
        figure;
        plot(En);
        hold on;
        stem(decisions,'r');
        stem(grnd_truth,'g');
    end
    figure
    plot(aveError);
end
%% 10dB SNR
if do10
    for i=1:length(Eval10dB)
        data = Eval10dB(i).data';
        speechFileName = Eval10dB(i).name;
        speechLength=length(data);
        speechFs = Eval10dB(i).Fs;

        %% Pre-processing
        pro_data = PreEmphasis(data,0.97);
        %% Get statistics
        [En En_log autocorr lags S F T] = GetStatistics(pro_data,frameSize,stepSize,speechLength,speechFs);
    %     figure
    %     imagesc(T,F,log10(abs(S)))
        %% Process statistics
        decisions = ProcessStatistics(En,autocorr,lags,S,F,T,frameSize,stepSize,speechLength,0.1,speechFs);
        %% Evaluation 
       % [Pfa(i), Pmiss(i), aveError(i)] = evalSAD(decisions,speechFileName,frameSize);
    end
end

%0dB SNR
if do0
    for i=1:length(Eval0dB)
        data = Eval0dB(i).data';
        speechFileName = Eval0dB(i).name;
        speechLength=length(data);
        speechFs = Eval0dB(i).Fs;

        %% Pre-processing
        pro_data = PreEmphasis(data,0.97);
        %% Get statistics
        [En En_log autocorr lags S F T] = GetStatistics(pro_data,frameSize,stepSize,speechLength,speechFs);
        imagesc(T,F,log10(abs(S)))
        %% Process statistics
        decisions = ProcessStatistics(En,autocorr,lags,S,F,T,frameSize,stepSize,speechLength);
        [Pfa(i), Pmiss(i), aveError(i)] = evalSAD(decisions,speechFileName,frameSize);

    end
end



