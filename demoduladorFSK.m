function [z]=demoduladorFSK(x, fs)
%función que realiza una demodulación de la señal de entrada FSK y proporciona la
%correspondiente salida en banda base
%Parametros de entrada
% x: secuencia modulada que es la entratrada al demodulador
% fs: frecuencia de muestreo
%Parámetros de salida
% z: secuencia de salida demodulada
h=[1/3 1/3 1/3];
% Filtro0
wn0 = [1700/(fs/2) 2500/(fs/2)];
[B0,A0] = ellip(2,0.5,20,wn0);
saniFiltrada0 = filter(B0,A0,x);
% |.|^2
saniPos0=abs(saniFiltrada0).^2;
% FIR
saniFIR0=filter(h,1,saniPos0);
% Filtro 1
wn1 = [900/(fs/2) 1700/(fs/2)];
[B1,A1] = ellip(2,0.5,20,wn1);
saniFiltrada1 = filter(B1,A1,x);
% ||^2
saniPos1=abs(saniFiltrada1).^2;
% FIR
saniFIR1=filter(h,1,saniPos1);
% Señal z(n)
z = saniFIR1-saniFIR0;
end