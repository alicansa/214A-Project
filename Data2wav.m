function [] = Data2wav(data,fileName,Fs)
%Produces a wav file from the input data
wavwrite(data,Fs,filename); 
end

