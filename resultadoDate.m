function [mensaje] = resultadoDate (ParameterData)
% función que pasa los bits a ASCII y presenta los caracteres
%por pantalla
%Parámetro de entrada
%ParameterData: caracteres codificados en ASCII que se quieren representar
%Parámetro de salida
%mensaje: caracteres de fecha legibles sacados por pantalla
mes1 = bin2dec(num2str(ParameterData(1,:)));
mes2 = bin2dec(num2str(ParameterData(2,:)));
dia1 = bin2dec(num2str(ParameterData(3,:)));
dia2 = bin2dec(num2str(ParameterData(4,:)));
hora1 = bin2dec(num2str(ParameterData(5,:)));
hora2 = bin2dec(num2str(ParameterData(6,:)));
minuto1 = bin2dec(num2str(ParameterData(7,:)));
minuto2 = bin2dec(num2str(ParameterData(8,:)));
    %representamos el resultado
mensaje = horzcat('Llamada realizada el ',char([dia1 dia2 '/' mes1 mes2]),' a las ',char([hora1 hora2 ':' minuto1 minuto2]));
end
