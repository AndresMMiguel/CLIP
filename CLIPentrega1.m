%% Andr�s Moreno, Jaime Garc�a y Andr�s Delabat
% TRABAJO FINAL TDS� (CLIP)
%% DATOS
load('sani1.mat')
load('sani2.mat')
load('sani3.mat')
Fs = 8e3;
%% RAMA SALIDA DEMODULADA z(n)
function [z]=demoduladorFSK(x, fs)
%funci�n que realiza una demodulaci�n de la se�al de entrada FSK y proporciona la
%correspondiente salida en banda base
%Parametros de entrada
% x: secuencia modulada que es la entratrada al demodulador
% fs: frecuencia de muestreo
%Par�metros de salida
% z: secuencia de salida demodulada

% Filtro0
wn0 = [1700/(Fs/2) 2500/(Fs/2)];
[B0,A0] = ellip(2,0.5,20,wn0);
% |.|^2
% FIR
% Filtro 1
wn1 = [900/(Fs/2) 1700/(Fs/2)];
[B1,A1] = ellip(2,0.5,20,wn1);
% ||^2
% FIR
end

%% RAMA PERIODO MUESTREO zt(n)
function [N,ultimaMuestra] = periodoMuestreo (z)
%funci�n que extrae el periodo �ptimo para
%muestrear la se�al z 
%Par�metros de entrada
%z: secuencia de salida demodulada
%Par�metros de salida
%N: periodo �ptimo de muestreo
%ultimaMuestra: valor de la �ltima muestra 
% ||^2
% Filtro Paso Banda
[Bz1,Az1] = ellip(6,1,50,[1150/(Fs/2) 1250/(Fs/2)]);
end

%% DECISOR
function [bits] = sym2bit(z,N,ultimaMuestra)
%funci�n que a partir de la �ltima muestra
%elige cada N muestras si el valor es un 1 (z>0)
% o un 0 (z<0)
%Par�metros de entrada
%z: secuencia de salida demodulada
%N: periodo �ptimo de muestreo
%ultimaMuestra: valor de la �ltima muestra
%Par�metro de salida
%bits: bits '1' y '0' resultantes

end
%% CODIFICACI�N DE BITS
function [MarkSignal,MessageType,MessageLenght,PresentationLayer,Checksum] = DLLDivisor (bits)
%funci�n que divide los bits resultantes del Data Link Layer 
%en sus respectivos campos
%Par�metro de entrada
%bits
%Par�metros de salida
%MarkSignal: 80 bits '1' seguidos.
%MessageType: tipo del mensaje enviado, Call Setup en nuestro caso
%MessageLength: longitud en octetos del Presentation Layer
%PresentationLayer: informaci�n que se quiere representar
%Checksum: complemento A2 de la suma de todos los octetos 
%desde Message Type hasta Presentation Layer (ambos incluidos)
end
function [ParameterType,ParameterLength,ParameterData] = PLMDivisor(PresentationLayer)
%funci�n que divide los bits resultantes del Presentation Layer Message
%Par�metro de entrada
%PresentationLayer: informaci�n que se quiere representar
%Par�metro de salida
%ParameterType: tipo del par�metro
%ParameterLenght: n�mero de octetos del Parameter Data 
%ParameterData: caracteres codificados en ASCII que se quieren representar
end
function [resultado] = resultado (ParameterData)
% funci�n que pasa los bits a ASCII y presenta los caracteres
%por pantalla
%Par�metro de entrada
%ParameterData: caracteres codificados en ASCII que se quieren representar
%Par�metro de salida
%resultado: caracteres legibles sacados por pantalla
end
function [validado] = checksum (Checksum)
%funci�n que valida el n�mero del Checksum recibido con 
%el complementa A2 de los octetos contemplados
%Par�metro de entrada
%Checksum: complemento A2 de la suma de todos los octetos 
%Par�metro de salida
%validado: valor l�gico que ser� 1 si el checksum coincide
%y 0 si no coincide
end