%% PRUEBAS DE Z(N)
subplot(421);plot(x),title('Se�al original')
subplot(423);plot(saniFiltrada0),title('Se�al 0 tras paso banda')
subplot(424);plot(saniFiltrada1),title('Se�al 1 tras paso banda')
subplot(425);plot(saniPos0),title('Se�al 0 tras m�dulo al cuadrado')
subplot(426);plot(saniPos1),title('Se�al 1 tras m�dulo al cuadrado')
subplot(427);plot(saniFIR0),title('Se�al 0 tras FIR')
subplot(428);plot(saniFIR1),title('Se�al 1 tras FIR')
subplot(422);plot(z),title('Se�al z(n)')
subplot
%% PRUEBAS DE ZT(N)
figure(2)
% plot(z2)
% pause
stem(zt)
figure(3)
plot(muestras,contador),title('contador')
N, ultimaMuestra
%% PRUEBAS DECISOR
plot(bits),axis([-5 500 -0.05 1.05]),title('bits')