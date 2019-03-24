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
k=ultimaMuestra;
bits=[];
while k<=length(z)
    if z(round(k))>0
        bits =[bits 1];
        k= k+N;
    else
        bits =[bits 0];
        k=k+N;
    end
end
end