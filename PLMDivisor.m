function [ParameterType,ParameterLenght,ParameterData] = PLMDivisor(PresentationLayer)
%funci�n que divide los bits resultantes del Presentation Layer Message
%Par�metro de entrada
%PresentationLayer: informaci�n que se quiere representar
%Par�metro de salida
%ParameterType: tipo del par�metro
%ParameterLenght: n�mero de octetos del Parameter Data 
%ParameterData: caracteres codificados en ASCII que se quieren representar
ParameterType = PresentationLayer(1,:);
ParameterLenght = PresentationLayer(2,:);
ParameterData = PresentationLayer(3:2+bin2dec(num2str(ParameterLenght)),:);
if bin2dec(num2str(ParameterType))==1
    resultadoDate(ParameterData)
else
    disp('El primer Parameter Type no es Date and Time')
end
Parameter2 = 3+bin2dec(num2str(ParameterLenght));
ParameterType = PresentationLayer(Parameter2,:);
ParameterLenght = PresentationLayer(Parameter2+1,:);
ParameterData = PresentationLayer(Parameter2+2:Parameter2+bin2dec(num2str(ParameterLenght))+1,:);
if bin2dec(num2str(ParameterType))==2
    resultadoNum(ParameterLenght,ParameterData)
else
    disp('El segundo Parameter Type no es Calling Line Identity')
end
end
