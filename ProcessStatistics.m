function [decisions] = ProcessStatistics(En,autocorr,lags,S,T,F,frameSize,stepSize,speechLength, ...
                                        autocorr_threshold,Fs)
%% Process short time autocorrelation
%Find frames which contain vowels
%Use a threshold
%check the average of the absolute value of 
%autocorrelation function
N = size(autocorr);
k=1;
decisions = zeros(1,N(1));
for i=1:N(1)
    %find peaks of the short time autocorr function
    [peaks locs]=findpeaks(autocorr(i,:),'SORTSTR','descend');
    %pick first 4 peaks to estimate pitch
    pitch(i) = mean([(max(locs(3),locs(2)) - locs(1)),(max(locs(5),locs(4))-max(locs(3),locs(2)))]);
    pitch_div = (max(locs(3),locs(2)) - locs(1))/(max(locs(5),locs(4))-max(locs(3),locs(2)));
    a = mean(abs(autocorr(i,:)));
    if (pitch_div >0.95 && pitch_div<1.05)
        vowel_frame_indices(k) = i;
        decisions(i) = 1;
        k=k+1;
    end
end
figure
plot(En)
hold on
stem(decisions,'r');
figure
plot(decisions.*pitch,'ko');

%% Process short time energy

%% Process STFT of the signal
%Look at the energy of the higher frequency bands to avoid the affect of
%babble noise


end

