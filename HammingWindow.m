function [output] = HammingWindow(windowLength)
%HAMMINGWINDOW Summary of this function goes here
%   Detailed explanation goes here
n = 0:1:windowLength-1;
hammWin = 0.54 - 0.46*cos(2*pi*n/(windowLength-1));
output = hammWin;
end

