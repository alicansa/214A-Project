function [output lags] = ShortTimeAutoCorr(data,window,delay)
window_delayed = conv(DiracDelta(delay,length(data)),window,'same');
data_win = data.*window_delayed;
[output lags] = xcorr(data_win,160);
end

