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

Y = Data(:,end);

X = [Data(:,1:end-1) -ones(length(Data), 1)];
W = inv(X'*X)*X'*Y;

Output = (X*W) >= 0.5;
   

accuracy = sum(Y == Output)/size(X, 1);
accuracy

ECM = (norm(Y - Output, 2))^2/size(X, 1);
ECM


