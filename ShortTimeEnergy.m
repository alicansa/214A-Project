function [output] = ShortTimeEnergy(data,window,R)
%take square
sq_data = data.^2;
sq_window = window.^2;
%low pass filter with window
win_data = conv(sq_data,sq_window,'same');
%downsample by R
output = downsample(win_data,R);
end

