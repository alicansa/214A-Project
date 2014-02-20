clear all
close all

TrainCleanList = dir('2014\Train\Clean\*.08');

for i=1:numel(TrainCleanList)
  TrainClean(i).name = TrainCleanList(i).name;
   TrainClean(i).data = FileReader(strcat('2014\Train\Clean\',TrainCleanList(i).name)); 
   TrainClean(i).Fs = 8000;
end

Train10dBList = dir('2014\Train\10dB\*.08');
for i=1:numel(Train10dBList)
  Train10dB(i).name = Train10dBList(i).name;
  Train10dB(i).data = FileReader(strcat('2014\Train\10dB\',Train10dBList(i).name));
  Train10dB(i).Fs = 8000;
end

Train0dBList = dir('2014\Train\0dB\*.08');
for i=1:numel(TrainCleanList)
  Train0dB(i).name = Train0dBList(i).name;
   Train0dB(i).data = FileReader(strcat('2014\Train\0dB\',Train0dBList(i).name)); 
   Train0dB(i).Fs = 8000;
end

EvalCleanList = dir('2014\Eval\Clean\*.08');
for i=1:numel(EvalCleanList)
  EvalClean(i).name = EvalCleanList(i).name;
   EvalClean(i).data = FileReader(strcat('2014\Eval\Clean\',EvalCleanList(i).name));
   EvalClean(i).Fs = 8000;
end

Eval10dBList =  dir('2014\Eval\10dB\*.08');
for i=1:numel(Eval10dBList)
  Eval10dB(i).name = Eval10dBList(i).name;
   Eval10dB(i).data = FileReader(strcat('2014\Eval\10dB\',Eval10dBList(i).name));
   Eval10dB(i).Fs = 8000;
end

Eval0dBList = dir('2014\Eval\0dB\*.08');
for i=1:numel(Eval0dBList)
  Eval0dB(i).name = Eval0dBList(i).name;
  Eval0dB(i).data = FileReader(strcat('2014\Eval\0dB\',Eval0dBList(i).name));
  Eval0dB(i).Fs = 8000;
end

clearvars TrainCleanList Train10dBList Train0dBList ...
          EvalCleanList Eval10dBList Eval0dBList i





