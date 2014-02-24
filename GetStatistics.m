function [En En_log autocorr lags S F T] = GetStatistics(data,frameSize,stepSize,speechLength,Fs)
hammWin = HammingWindow(frameSize);
rectWin = RectWindow(frameSize);

%% short time energy 
%Use hamming window
[En En_log] = ShortTimeEnergy(data,hammWin,stepSize);
    
%% short time autocorrelation
%Use rectangular window
k=1;
for j=1:stepSize:speechLength
   [autocorr(k,:),lags(k,:)] = ShortTimeAutoCorr(data,rectWin,j);
   k=k+1;
end


%% short time fourier transform 
%Use hamming window
[S F T] = STFT(data,hammWin,frameSize,stepSize,Fs);


end

