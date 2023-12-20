clear;
clc;
close all;

load DatosAND
%load DatosLS5
%load DatosLS10
%load DatosLS50
%load DatosOR
%load DatosXOR

Data(:,end)=Data(:,end)==1; % Para transformar todos los -1 en 0

LR=-0.05;
Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;

ECM = zeros(Epoc, 1); % Vector para guardar el ECM cada Epoc

W=PerceptronWeigthsGenerator(Data);

Epoc=1;

while ~CheckPattern(Data,W) && Epoc<MaxEpoc
    error = 0;
     for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
        
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites);
        GrapNeuron(W,Limites);hold off;
        drawnow
%         pause;
        
        if max(Signo(Output), 0)~=Target % En vez de comparar con la salida (al ser continua), comparamos con el máximo entre el signo de esta y 0, para tener 0 si es negativa y 1 si es positiva
           W=UpdateNet(W,LR,Output,Target,Input);
        end
        
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites)
        GrapNeuron(W,Limites);hold off;
        drawnow
%         pause;
    error = error + (Target - Output)^2; % Calculamos el sumatorio del ECM
    end
    ECM(Epoc) = error/size(Data, 1); % Y dividimos ese sumatorio entre el número de datos
    Epoc=Epoc+1;
end

% Graficamos el ECM frente al número de Epocs

plot(1:size(ECM), ECM)
xlabel('Epoc')
ylabel('ECM')
