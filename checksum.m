function [validado] = checksum (MessageType,MessageLength,PresentationLayer,Checksum)
%funci�n que valida el n�mero del Checksum recibido con 
%el complementa A2 de los octetos contemplados
%Par�metro de entrada
%MessageType: tipo del mensaje enviado, Call Setup en nuestro caso
%MessageLength: longitud en octetos del Presentation Layer
%PresentationLayer: informaci�n que se quiere representar
%Checksum: complemento A2 de la suma de todos los octetos 
%Par�metro de salida
%validado: valor l�gico que ser� 1 si el checksum coincide
%y 0 si no coincide
suma= bin2dec(num2str(MessageType));
suma = suma + bin2dec(num2str(MessageLength));
for i = 1:bin2dec(num2str(MessageLength))
    suma = suma + bin2dec(num2str(PresentationLayer(i,:)));
end
checksum = 256 -mod(suma,256);
if checksum == bin2dec(num2str(Checksum))
validado = 1;
else
    validado = 0;
end