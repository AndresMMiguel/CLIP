function [N,ultimaMuestra] = periodoMuestreo (z,fs)
%función que extrae el periodo óptimo para
%muestrear la señal z 
%Parámetros de entrada
%z: secuencia de salida demodulada
%fs: frecuencia de muestreo
%Parámetros de salida
%N: periodo óptimo de muestreo
%ultimaMuestra: valor de la última muestra 
% ||^2
z2 = abs(z).^2;
% Filtro Paso Banda
[Bz1,Az1] = ellip(6,1,50,[1150/(fs/2) 1250/(fs/2)]);
zt = filter(Bz1,Az1,z2);


i=1;
a=1;
while i<length(zt)
    if (zt(i)>0 & zt(i+1)<0) % En las pendientes negativas de zt(n)
        if z(i)>0            % muestreamos z(n). Si z(n)>0 entonces zdig = 1
            zdig(a) = 1;     % si z(n)<0 entonces zdig = 0.
            muestras(a)= i;  % Guardamos la muestra en la que hemos muestreado.
            i = i+1;
            a = a+1;
        else
            zdig(a) = 0;
            muestras(a)= i;
              i = i+1;
              a = a+1;
        end
    else
        i = i+1;
    end
end
i=2;
contador(1)=0;
while i<=length(zdig)
    if (zdig(i)==zdig(i-1))
        contador(i) = contador(i-1)-1;
        i= i+1;
    else
        contador(i) = contador(i-1) +1;
        i= i+1;
    end
end

for k= 1:length(muestras)
    if contador(k)==100
        muestra1 = muestras(k);
    elseif contador(k)==250
        muestra2 = muestras(k);
        break
    end
end
N = abs(muestra2-muestra1)/150;
ultimaMuestra = muestra2;
end