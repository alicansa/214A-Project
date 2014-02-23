function [En autocorr lags] = GetStatistics(data,frameSize,stepSize,speechLength)
hammWin = HammingWindow(frameSize);
rectWin = RectWindow(frameSize);

%% short time energy 
%Use hamming window
En = ShortTimeEnergy(data,hammWin,stepSize);
    
%% check periodicity with autocorrelation
%Use rectangular window
k=1;
for j=1:stepSize:speechLength
   [autocorr(k,:),lags(k,:)] = ShortTimeAutoCorr(data,rectWin,j);
   k=k+1;
end
    
    %% check energy of certain frequency bands

end

