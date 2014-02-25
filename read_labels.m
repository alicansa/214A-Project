function outSAD = read_labels(filename,winLen)
% Function read_label: Reads an annotation file from AURORA-2 database and
% determines Speech/Non Speech values per frame (every 10 ms).
%
%Input:     filename: String variable with the pathfile to the text file
%           winLen:   Window size (in ms)
%
%Output:    outSAD:   Column vector with ground truth labels (1 or 0) for 
%                     given filename (every 10 ms)



fid = fopen(filename);

C = textscan(fid,'%f32 %f32 %s %f32','headerLines', 1);
 %Read  time colums and s/ns decision
 time_left = double(C{1,1});  
 time_right = double(C{1,2});
 decision =  C{1,3};    %Non-Speech

%Get Time vector (per frame)
T = frame(winLen,time_right(end));
T=T';
N = length(T);

 outSAD = ones(1,N);
% point=1;
 ind_count=0;
%Get length of the decision vector
 decision_len = length(find(time_right <= T(end)+winLen/2));

for i=1:decision_len
 %Find the number of frames (and index) between each decision interval
 index =  find(time_left(i) <= T & T <= time_right(i)+10);
   ind_len =  length(index);
  
if strcmp(decision(i),'sp') || strcmp(decision(i),'sil')	%Non-Speech Frames
	outSAD(1,index(1):index(end)) = zeros(1,ind_len);   %  


end
  
ind_count = ind_len+ind_count;

end
 
outSAD = outSAD';

fclose(fid);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function T = frame(winLen, time_end)
% Creates Time vector for given window length (every 10 ms) and fs=8000

%Parameters:
fs = 8000;
win_shift = round(fs*10);    %10ms
win_Len = round(fs*winLen);    %30ms

mid = (win_Len)/(2*fs);      %initial window's midpoint

 
T = zeros(3000,1);
i=1;
while (time_end >= mid) %+winLen/2)

    T(i,1) = mid ;
    mid = mid + win_shift/(fs);
    i=i+1;
    
end

T = T(1:i-1,1);

end

