function [mensaje] = resultadoNum (ParameterLenght,ParameterData)
% funci�n que pasa los bits a ASCII y presenta los caracteres
%por pantalla
%Par�metro de entrada
%ParameterLenght: n�mero de octetos del Parameter Data
%ParameterData: caracteres codificados en ASCII que se quieren representar
%Par�metro de salida
%mensaje: caracteres numericos legibles sacados por pantalla
for i = 1:bin2dec(num2str(ParameterLenght))
num(i)= char(bin2dec(num2str(ParameterData(i,:))));
end
horzcat('Desde el n�mero de tel�fono: ',num)
end