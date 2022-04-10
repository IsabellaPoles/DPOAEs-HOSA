clc; clear all; close all; 

% confronto pre/post discoteca a diverse intensità
DATA_20=load('Risultati_S5_pre_20.mat')
DATA_30=load('Risultati_S5_pre_30.mat')
DATA_40=load('Risultati_s5_pre_40.mat')

DATA_20_po=load('Risultati_S5_post_20.mat')
DATA_30_po=load('Risultati_S5_post_30.mat')
DATA_40_po=load('Risultati_S5_post_40.mat')

gain=10.5;
% ampiezza media 
figure(1)
subplot(2,1,2)
plot(DATA_20.f2,20*log10(DATA_20.A_avg), 'r', DATA_30.f2,20*log10 (DATA_30.A_avg), 'b', DATA_40.f2,20*log10 (DATA_40.A_avg), 'g')
title ('Andamenti delle ampiezze medie post disco')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2[Hz]')
ylabel ('A.Media[dB]')
ylim ([-120 -30])
grid on 

subplot (2,1,1)
plot(DATA_20_po.f2,20*log10(DATA_20_po.A_avg), 'r', DATA_30_po.f2,20*log10 (DATA_30_po.A_avg), 'b', DATA_40_po.f2,20*log10 (DATA_40_po.A_avg), 'g')
title ('Andamenti delle ampiezze medie pre disco')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2[Hz]')
ylabel ('A.Media[dB]')
ylim ([-120 -30])
grid on 

% ampiezza massima 
figure(2)
subplot(2,1,2)
plot(DATA_20.f2,20*log10(DATA_20.Max_mag), 'r')
hold on 
plot(DATA_30.f2,20*log10 (DATA_30.Max_mag), 'b', DATA_40.f2,20*log10 (DATA_40.Max_mag), 'g')
hold off
title ('Andamenti delle ampiezze massime post disco')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('A.Max[dB]')
xlabel ('f2[Hz]')
ylim ([-60 20])
grid on 

subplot (2,1,1)
plot(DATA_20_po.f2,20*log10(DATA_20_po.Max_mag), 'r')
hold on 
plot(DATA_30_po.f2,20*log10 (DATA_30_po.Max_mag), 'b', DATA_40_po.f2,20*log10 (DATA_40_po.Max_mag), 'g')
hold off
title ('Andamenti delle ampiezze massima pre disco')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2[Hz]')
ylabel ('A.Max[dB]')
ylim ([-60 20])
grid on 

% entropia di fase 
figure (3)
subplot(2,1,2)
plot(DATA_20.f2,angle(DATA_20.Pe), 'r')
hold on 
plot(DATA_30.f2,angle(DATA_30.Pe), 'b', DATA_40.f2, angle(DATA_40.Pe), 'g')
hold off
title ('Andamenti entropia di fase post disco')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia Fase')
xlabel ('f2[Hz]')
ylim([-3 -0.5])
grid on 


subplot (2,1,1)
plot(DATA_20_po.f2, angle(DATA_20_po.Pe), 'r')
hold on 
plot(DATA_30_po.f2,angle(DATA_30_po.Pe), 'b', DATA_40_po.f2, angle(DATA_40_po.Pe), 'g')
hold off
title ('Andamenti entropia di fase pre disco')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2[Hz]')
ylabel ('Entropia Fase')
ylim([-3 -0.5])
grid on 

%entropia del bispettro
figure (4)
subplot(2,1,2)
plot(DATA_20.f2,DATA_20.P1, 'r')
hold on 
plot(DATA_30.f2,DATA_30.P1, 'b', DATA_40.f2, DATA_40.P1, 'g')
hold off
title ('Andamenti entropia del bispettro post disco')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia')
xlabel ('f2[Hz]')
ylim([10 14.5])
grid on 


subplot  (2,1,1)
plot(DATA_20_po.f2,DATA_20_po.P1, 'r')
hold on 
plot(DATA_30_po.f2,DATA_30_po.P1, 'b', DATA_40_po.f2,DATA_40_po.P1, 'g')
hold off
title ('Andamenti entropia del bispettro pre disco')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2[Hz]')
ylabel ('Entropia')
ylim([10 14.5])
grid on 

%P_DPOAE
figure (5)
subplot(2,1,2)
plot(DATA_20.f2,DATA_20.P_DPOAE,'r',DATA_30.f2,DATA_30.P_DPOAE,'b',DATA_40.f2,DATA_40.P_DPOAE,'g')
title ('Andamenti potenza DPOAE post disco')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Potenza[dB spl]')
xlabel ('f2[Hz]')
ylim([-50 10])
grid on 

subplot  (2,1,1)
plot(DATA_20_po.f2,DATA_20_po.P_DPOAE,'r',DATA_30_po.f2,DATA_30_po.P_DPOAE,'b',DATA_40_po.f2,DATA_40_po.P_DPOAE,'g')
title ('Andamenti potenza DPOAE pre disco')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2[Hz]')
ylabel ('Potenza[dB spl]')
ylim([-50 10])
grid on 





