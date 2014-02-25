close all
clear all


GrabFiles

for i=1:length(TrainClean)
   wavwrite(TrainClean(i).data,TrainClean(i).Fs,strcat('2014\Train\Clean\',TrainClean(i).name,'.wav')); 
end

for i=1:length(Train0dB)
   wavwrite(Train0dB(i).data,Train0dB(i).Fs,strcat('2014\Train\0dB\',Train0dB(i).name,'.wav')); 
end

for i=1:length(Train10dB)
   wavwrite(Train10dB(i).data,Train10dB(i).Fs,strcat('2014\Train\10dB\',Train10dB(i).name,'.wav')); 
end

for i=1:length(EvalClean)
   wavwrite(EvalClean(i).data,EvalClean(i).Fs,strcat('2014\Eval\Clean\',EvalClean(i).name,'.wav')); 
end

for i=1:length(Eval10dB)
   wavwrite(Eval10dB(i).data,Eval10dB(i).Fs,strcat('2014\Eval\10dB\',Eval10dB(i).name,'.wav')); 
end

for i=1:length(Eval0dB)
   wavwrite(Eval0dB(i).data,Eval0dB(i).Fs,strcat('2014\Eval\0dB\',Eval0dB(i).name,'.wav')); 
end