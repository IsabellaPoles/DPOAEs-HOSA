clc; clear all; close all; 

% confronto pre/post discoteca a diverse intensità
DATA_20=load('Focus_S5_pre_20.mat');
DATA_30=load('Focus_S5_pre_30.mat');
DATA_40=load('Focus_S5_pre_40.mat');

DATA_20_po=load('Focus_S5_post_20.mat');
DATA_30_po=load('Focus_S5_post_30.mat');
DATA_40_po=load('Focus_S5_post_40.mat');


% DP  @(f1;f2-f1)
% ampiezza media 
figure(1)
subplot(2,1,2)
plot(DATA_20.f2,20*log10(DATA_20.A_avg_DP), 'r', DATA_30.f2,20*log10 (DATA_30.A_avg_DP), 'b', DATA_40.f2,20*log10 (DATA_40.A_avg_DP), 'g')
title ('Andamenti delle ampiezze medie post disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Media [dB]')
ylim([-90 -10]);
grid on 

subplot (2,1,1)
plot(DATA_20_po.f2,20*log10(DATA_20_po.A_avg_DP), 'r', DATA_30_po.f2,20*log10 (DATA_30_po.A_avg_DP), 'b', DATA_40_po.f2,20*log10 (DATA_40_po.A_avg_DP), 'g')
title ('Andamenti delle ampiezze medie pre disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Media [dB]')
ylim([-90 -10]);
grid on 

% ampiezza massima 
figure(2)
subplot(2,1,2)
plot(DATA_20.f2,20*log10(DATA_20.max_mag_DP), 'r')
hold on 
plot(DATA_30.f2,20*log10 (DATA_30.max_mag_DP), 'b', DATA_40.f2,20*log10 (DATA_40.max_mag_DP), 'g')
hold off
title ('Andamenti delle ampiezze massime post disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Max [dB]')
ylim([-80 10]);
grid on 


subplot (2,1,1)
plot(DATA_20_po.f2,20*log10(DATA_20_po.max_mag_DP), 'r')
hold on 
plot(DATA_30_po.f2,20*log10 (DATA_30_po.max_mag_DP), 'b', DATA_40_po.f2,20*log10 (DATA_40_po.max_mag_DP), 'g')
hold off
title ('Andamenti delle ampiezze massime pre disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Max [dB]')
ylim ([-80 10]);
grid on

% entropia di fase 
figure(3)
subplot(2,1,2)
plot(DATA_20.f2,angle(DATA_20.P_e_DP), 'r')
hold on 
plot(DATA_30.f2,angle(DATA_30.P_e_DP), 'b', DATA_40.f2, angle(DATA_40.P_e_DP), 'g')
hold off
title ('Andamenti entropia di fase post disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia Fase')
ylim ([-3.5 -0.5])
grid on 


subplot (2,1,1)
plot(DATA_20_po.f2, angle(DATA_20_po.P_e_DP), 'r')
hold on 
plot(DATA_30_po.f2,angle(DATA_30_po.P_e_DP), 'b', DATA_40_po.f2, angle(DATA_40_po.P_e_DP), 'g')
hold off
title ('Andamenti entropia di fase pre disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia Fase')
ylim ([-3.5 -0.5])
grid on 

%entropia del bispettro
figure(4)
subplot(2,1,2)
plot(DATA_20.f2,DATA_20.P1_DP, 'r')
hold on 
plot(DATA_30.f2,DATA_30.P1_DP, 'b', DATA_40.f2, DATA_40.P1_DP, 'g')
hold off
title ('Andamenti entropia del bispettro post disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia')
ylim ([8 9])
grid on 

subplot (2,1,1)
plot(DATA_20_po.f2,DATA_20_po.P1_DP, 'r')
hold on 
plot(DATA_30_po.f2,DATA_30_po.P1_DP, 'b', DATA_40_po.f2,DATA_40_po.P1_DP, 'g')
hold off
title ('Andamenti entropia del bispettro pre disco @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia')
ylim ([8 9])
grid on 

% @(f2;f1)
% ampiezza media 
figure(5)
subplot(2,1,2)
plot(DATA_20.f2,20*log10(DATA_20.A_avg_f2_f1), 'r', DATA_30.f2,20*log10 (DATA_30.A_avg_f2_f1), 'b', DATA_40.f2,20*log10 (DATA_40.A_avg_f2_f1), 'g')
title ('Andamenti delle ampiezze medie post disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Media [dB]')
ylim ([-90 0])
grid on 

subplot (2,1,1)
plot(DATA_20_po.f2,20*log10(DATA_20_po.A_avg_f2_f1), 'r', DATA_30_po.f2,20*log10 (DATA_30_po.A_avg_f2_f1), 'b', DATA_40_po.f2,20*log10 (DATA_40_po.A_avg_f2_f1), 'g')
title ('Andamenti delle ampiezze medie pre disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Media [dB]')
ylim ([-90 0])
grid on 

% ampiezza massima 
figure(6)
subplot(2,1,2)
plot(DATA_20.f2,20*log10(DATA_20.max_mag_f2f1), 'r')
hold on 
plot(DATA_30.f2,20*log10 (DATA_30.max_mag_f2f1), 'b', DATA_40.f2,20*log10 (DATA_40.max_mag_f2f1), 'g')
hold off
title ('Andamenti delle ampiezze massime post disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Max [dB]')
ylim ([-80 10])
grid on 

subplot (2,1,1)
plot(DATA_20_po.f2,20*log10(DATA_20_po.max_mag_f2f1), 'r')
hold on 
plot(DATA_30_po.f2,20*log10 (DATA_30_po.max_mag_f2f1), 'b', DATA_40_po.f2,20*log10 (DATA_40_po.max_mag_f2f1), 'g')
hold off
title ('Andamenti delle ampiezze massime pre disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('A.Max [dB]')
ylim ([-80 10])
grid on 

% entropia di fase 
figure(7)
subplot(2,1,2)
plot(DATA_20.f2,angle(DATA_20.P_e_f2f1), 'r')
hold on 
plot(DATA_30.f2,angle(DATA_30.P_e_f2f1), 'b', DATA_40.f2, angle(DATA_40.P_e_f2f1), 'g')
hold off
title ('Andamenti entropia di fase post disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia Fase')
ylim ([-3.5 0])
grid on 

subplot (2,1,1)
plot(DATA_20_po.f2, angle(DATA_20_po.P_e_f2f1), 'r')
hold on 
plot(DATA_30_po.f2,angle(DATA_30_po.P_e_f2f1), 'b', DATA_40_po.f2, angle(DATA_40_po.P_e_f2f1), 'g')
hold off
title ('Andamenti entropia di fase pre disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia Fase')
ylim ([-3.5 0])
grid on 

%entropia del bispettro
figure(8)
subplot(2,1,2)
plot(DATA_20.f2,DATA_20.P1_f2_f1, 'r')
hold on 
plot(DATA_30.f2,DATA_30.P1_f2_f1, 'b', DATA_40.f2, DATA_40.P1_f2_f1, 'g')
hold off
title ('Andamenti entropia del bispettro post disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia')
ylim ([5.5 7])
grid on 

subplot(2,1,1)
plot(DATA_20_po.f2,DATA_20_po.P1_f2_f1, 'r')
hold on 
plot(DATA_30_po.f2,DATA_30_po.P1_f2_f1, 'b', DATA_40_po.f2,DATA_40_po.P1_f2_f1, 'g')
hold off
title ('Andamenti entropia del bispettro pre disco @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('f2 [Hz]')
ylabel ('Entropia')
ylim ([5.5 7])
grid on 


