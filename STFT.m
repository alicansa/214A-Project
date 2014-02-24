function [S F T] = STFT(data,window,frameSize,overlap,Fs)
[S F T] = spectrogram(data,window,overlap,frameSize,Fs);
end

