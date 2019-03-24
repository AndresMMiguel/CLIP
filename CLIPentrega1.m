%% Andrés Moreno, Jaime García y Andrés Delabat
% TRABAJO FINAL TDSÑ (CLIP)
%% DATOS
load('sani1.mat')
load('sani2.mat')
load('sani3.mat')
Fs = 8e3;
%% RAMA SALIDA DEMODULADA z(n)
function [z]=demoduladorFSK(x, fs)
%función que realiza una demodulación de la señal de entrada FSK y proporciona la
%correspondiente salida en banda base
%Parametros de entrada
% x: secuencia modulada que es la entratrada al demodulador
% fs: frecuencia de muestreo
%Parámetros de salida
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
%función que extrae el periodo óptimo para
%muestrear la señal z 
%Parámetros de entrada
%z: secuencia de salida demodulada
%Parámetros de salida
%N: periodo óptimo de muestreo
%ultimaMuestra: valor de la última muestra 
% ||^2
% Filtro Paso Banda
[Bz1,Az1] = ellip(6,1,50,[1150/(Fs/2) 1250/(Fs/2)]);
end

%% DECISOR
function [bits] = sym2bit(z,N,ultimaMuestra)
%función que a partir de la última muestra
%elige cada N muestras si el valor es un 1 (z>0)
% o un 0 (z<0)
%Parámetros de entrada
%z: secuencia de salida demodulada
%N: periodo óptimo de muestreo
%ultimaMuestra: valor de la última muestra
%Parámetro de salida
%bits: bits '1' y '0' resultantes

end
%% CODIFICACIÓN DE BITS
function [MarkSignal,MessageType,MessageLenght,PresentationLayer,Checksum] = DLLDivisor (bits)
%función que divide los bits resultantes del Data Link Layer 
%en sus respectivos campos
%Parámetro de entrada
%bits
%Parámetros de salida
%MarkSignal: 80 bits '1' seguidos.
%MessageType: tipo del mensaje enviado, Call Setup en nuestro caso
%MessageLength: longitud en octetos del Presentation Layer
%PresentationLayer: información que se quiere representar
%Checksum: complemento A2 de la suma de todos los octetos 
%desde Message Type hasta Presentation Layer (ambos incluidos)
end
function [ParameterType,ParameterLength,ParameterData] = PLMDivisor(PresentationLayer)
%función que divide los bits resultantes del Presentation Layer Message
%Parámetro de entrada
%PresentationLayer: información que se quiere representar
%Parámetro de salida
%ParameterType: tipo del parámetro
%ParameterLenght: número de octetos del Parameter Data 
%ParameterData: caracteres codificados en ASCII que se quieren representar
end
function [resultado] = resultado (ParameterData)
% función que pasa los bits a ASCII y presenta los caracteres
%por pantalla
%Parámetro de entrada
%ParameterData: caracteres codificados en ASCII que se quieren representar
%Parámetro de salida
%resultado: caracteres legibles sacados por pantalla
end
function [validado] = checksum (Checksum)
%función que valida el número del Checksum recibido con 
%el complementa A2 de los octetos contemplados
%Parámetro de entrada
%Checksum: complemento A2 de la suma de todos los octetos 
%Parámetro de salida
%validado: valor lógico que será 1 si el checksum coincide
%y 0 si no coincide
end