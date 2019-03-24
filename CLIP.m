%% Andrés Moreno, Jaime García y Andrés Delabat
% TRABAJO FINAL TDSÑ (CLIP)
%% DATOS
clear,clc
load('sani1.mat')
load('sani2.mat')
load('sani3.mat')
fs = 8e3;
x = sani1;
% LLAMADAS A FUNCIONES
z = demoduladorFSK(x,fs);
[N,ultimaMuestra] = periodoMuestreo(z,fs);
bits = sym2bit(z,N,ultimaMuestra);
[MessageType,MessageLength,PresentationLayer,Checksum] = DLLDivisor (bits);
[ParameterType,ParameterLength,ParameterData] = PLMDivisor(PresentationLayer);
validado = checksum (MessageType,MessageLength,PresentationLayer,Checksum);
if validado
    disp('El checksum ha sido validado')
else
    disp('El checksum no es correcto')
end