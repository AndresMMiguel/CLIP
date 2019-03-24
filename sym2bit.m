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