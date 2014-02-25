function [Pfa, Pmiss, aveError grnd_truth] = evalSAD(input,ref,winLen)
%======================================================================
% SAD Performance detection
%
%Input:  input:  Feature column vector with 1 (speech) or 0 (non-speech)
%                decisions (every 10 ms)
%	      ref  : Textfile name with labels for the given input
%         winLen: Window length used to frame your signal (in ms)
%
%Output: Pfa:   Probability of False Alarm (Percentage)
%	     Pmiss: Probability of Missing     (Percentage)
%        aveError: Average error
%
%
%=======================================================================
if ~iscolumn(input)
    input = input';
end

grnd_truth = read_labels(ref,winLen);


if(length(grnd_truth)>length(input))
    grnd_truth = grnd_truth(1:length(input));
end

ref1 = grnd_truth==1;
ref0 = grnd_truth==0;
n1 = sum(ref1);
n0 = sum(ref0);



vec1 = input(ref1);
vec0 = input(ref0);
n1_to_1 = sum(vec1==1);
n1_to_0 = n1-n1_to_1;
n0_to_0 = sum(vec0==0);
n0_to_1 = n0-n0_to_0;

if(n1>0)
    Pmiss = n1_to_0/n1*100;
else
    Pmiss = 0;
end
if(n0>0)
    Pfa = n0_to_1/n0*100;
else
    Pfa = 0;
end


aveError = (n1_to_0/n1 + n0_to_1/n0)/2;



end






