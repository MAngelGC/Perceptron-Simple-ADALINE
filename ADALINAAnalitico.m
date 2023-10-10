clear;
clc;
close all;

%load DatosAND
%load DatosLS5
load DatosLS10
%load DatosLS50
%load DatosOR
%load DatosXOR

Data(:,end)=Data(:,end)==1;

Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;


W = PerceptronWeigthsGenerator(Data);
Y = Data(:,end);

Epoc=1;

%while ~CheckPattern(Data,W) && Epoc<MaxEpoc
        % GrapDatos(Data,Limites);
        % GrapPatron(Input,Output,Limites);
        % GrapNeuron(W,Limites);hold off;
        % drawnow
        % pause;
        
        X = [Data(:,1:end-1) -ones(length(Data), 1)];
        W = inv(X'*X)*X'*Y;
    
        % GrapDatos(Data,Limites);
        % GrapPatron(Input,Output,Limites)
        % GrapNeuron(W,Limites);hold off;
        % drawnow
        % pause;
        %Epoc=Epoc+1;
%end

acc = sum(Y == max(Signo(X*W), 0))/length(Y);
acc


