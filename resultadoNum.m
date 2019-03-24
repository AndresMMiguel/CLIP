function [mensaje] = resultadoNum (ParameterLenght,ParameterData)
% función que pasa los bits a ASCII y presenta los caracteres
%por pantalla
%Parámetro de entrada
%ParameterLenght: número de octetos del Parameter Data
%ParameterData: caracteres codificados en ASCII que se quieren representar
%Parámetro de salida
%mensaje: caracteres numericos legibles sacados por pantalla
for i = 1:bin2dec(num2str(ParameterLenght))
num(i)= char(bin2dec(num2str(ParameterData(i,:))));
end
horzcat('Desde el número de teléfono: ',num)
end