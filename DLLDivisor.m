function [MessageType,MessageLength,PresentationLayer,Checksum] = DLLDivisor (bits)
%función que divide los bits resultantes del Data Link Layer 
%en sus respectivos campos
%Parámetro de entrada
%bits
%Parámetros de salida
%MessageType: tipo del mensaje enviado, Call Setup en nuestro caso
%MessageLength: longitud en octetos del Presentation Layer
%PresentationLayer: información que se quiere representar
%Checksum: complemento A2 de la suma de todos los octetos 
%desde Message Type hasta Presentation Layer (ambos incluidos)
longMark = 0;
a=1;
for i = 1:length(bits)-1
    if bits(i)==1
        longMark = longMark + 1;
        MarkSignal(a) = bits(i);
        a = a+1;
    else
        longMark=0;
        MarkSignal=0;
        a=1;
    end
    if longMark == 80
        ultimoBitMark = i;
        break
    end
end
fila =1;
k=1;
for i = ultimoBitMark + 2:length(bits)
    if k <= 10
    dectetos(fila,k) = bits(i);
    k = k+1;
    else
        fila = fila + 1;
        k=1;
        dectetos(fila,k)=bits(i);
        k= k +1;
    end 
end
dectetos = fliplr(dectetos);
MessageType = dectetos(1,2:9);
if bin2dec(num2str(MessageType))~= 128
    disp('El tipo de mensaje no es CALL SETUP')
end
MessageLength = dectetos(2,2:9);
PresentationLayer = dectetos(3:2+bin2dec(num2str(MessageLength)),2:9);
Checksum = dectetos(3 + bin2dec(num2str(MessageLength)),2:9);
end
