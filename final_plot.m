clc; clear all; close all; 

% confronto pre/post discoteca di tutti i soggetti a diverse intensità

D5_20=load('Risultati_S5_pre_20.mat');
D5_30=load('Risultati_S5_pre_30.mat');
D5_40=load('Risultati_S5_pre_40.mat');
D5_20_po=load('Risultati_S5_post_20.mat');
D5_30_po=load('Risultati_S5_post_30.mat');
D5_40_po=load('Risultati_S5_post_40.mat');
D7_20=load('Risultati_S7_pre_20.mat');
D7_30=load('Risultati_S7_pre_30.mat');
D7_40=load('Risultati_S7_pre_40.mat');
D7_20_po=load('Risultati_S7_post_20.mat');
D7_30_po=load('Risultati_S7_post_30.mat');
D7_40_po=load('Risultati_S7_post_40.mat');
D10_20=load('Risultati_S10_pre_20.mat');
D10_30=load('Risultati_S10_pre_30.mat');
D10_40=load('Risultati_S10_pre_40.mat');
D10_20_po=load('Risultati_S10_post_20.mat');
D10_30_po=load('Risultati_S10_post_30.mat');
D10_40_po=load('Risultati_S10_post_40.mat');
D16_20=load('Risultati_S16_pre_20.mat');
D16_30=load('Risultati_S16_pre_30.mat');
D16_40=load('Risultati_S16_pre_40.mat');
D16_20_po=load('Risultati_S16_post_20.mat');
D16_30_po=load('Risultati_S16_post_30.mat');
D16_40_po=load('Risultati_S16_post_40.mat');

f2=D16_40.f2;

figure(1)
subplot(2,3,1)
plot(f2,(D5_20_po.P_DPOAE+D7_20_po.P_DPOAE+D10_20_po.P_DPOAE+D16_20_po.P_DPOAE)/4,f2,(D5_20.P_DPOAE+D7_20.P_DPOAE+D10_20.P_DPOAE+D16_20.P_DPOAE)/4,'--')
title('Confronto DPOAE pre e post @20dB'); grid on
xlabel('f_2 [Hz]'); ylabel('DPOAE [dB spl]');
legend('media pre','media post'); ylim([-35 5])
subplot(2,3,4)
plot(f2,(20*log10(D5_20_po.Max_mag)+20*log10(D7_20_po.Max_mag)+20*log10(D10_20_po.Max_mag)+20*log10(D16_20_po.Max_mag))/4,f2,(20*log10(D5_20.Max_mag)+20*log10(D7_20.Max_mag)+20*log10(D10_20.Max_mag)+20*log10(D16_20.Max_mag))/4,'--',f2,((20*log10(D5_20_po.Max_mag)+20*log10(D7_20_po.Max_mag)+20*log10(D10_20_po.Max_mag)+20*log10(D16_20_po.Max_mag))/4)-((20*log10(D5_20.Max_mag)+20*log10(D7_20.Max_mag)+20*log10(D10_20.Max_mag)+20*log10(D16_20.Max_mag))/4),'-*k')
title('Confronto A.massima pre e post @20dB'); grid on
xlabel('f_2 [Hz]'); ylabel('A.max [dB]');
legend('media pre','media post','\Delta','location','southwest')

subplot(2,3,2)
plot(f2,(D5_30_po.P_DPOAE+D7_30_po.P_DPOAE+D10_30_po.P_DPOAE+D16_30_po.P_DPOAE)/4,f2,(D5_30.P_DPOAE+D7_30.P_DPOAE+D10_30.P_DPOAE+D16_30.P_DPOAE)/4,'--')
title('Confronto DPOAE pre e post @30dB'); grid on
xlabel('f_2 [Hz]'); ylabel('DPOAE [dB spl]');
legend('media pre','media post'); ylim([-35 5])
subplot(2,3,5)
plot(f2,(20*log10(D5_30_po.Max_mag)+20*log10(D7_30_po.Max_mag)+20*log10(D10_30_po.Max_mag)+20*log10(D16_30_po.Max_mag))/4,f2,(20*log10(D5_30.Max_mag)+20*log10(D7_30.Max_mag)+20*log10(D10_30.Max_mag)+20*log10(D16_30.Max_mag))/4,'--',f2,((20*log10(D5_30_po.Max_mag)+20*log10(D7_30_po.Max_mag)+20*log10(D10_30_po.Max_mag)+20*log10(D16_30_po.Max_mag))/4)-((20*log10(D5_30.Max_mag)+20*log10(D7_30.Max_mag)+20*log10(D10_30.Max_mag)+20*log10(D16_30.Max_mag))/4),'-*k')
title('Confronto A.massima pre e post @30dB'); grid on
xlabel('f_2 [Hz]'); ylabel('A.max [dB]');
legend('media pre','media post','\Delta','location','southwest')

subplot(2,3,3)
plot(f2,(D5_40_po.P_DPOAE+D7_40_po.P_DPOAE+D10_40_po.P_DPOAE+D16_40_po.P_DPOAE)/4,f2,(D5_40.P_DPOAE+D7_40.P_DPOAE+D10_40.P_DPOAE+D16_40.P_DPOAE)/4,'--')
title('Confronto DPOAE pre e post @40dB'); grid on
xlabel('f_2 [Hz]'); ylabel('DPOAE [dB spl]');
legend('media pre',' media post'); ylim([-35 5])
subplot(2,3,6)
plot(f2,(20*log10(D5_40_po.Max_mag)+20*log10(D7_40_po.Max_mag)+20*log10(D10_40_po.Max_mag)+20*log10(D16_40_po.Max_mag))/4,f2,(20*log10(D5_40.Max_mag)+20*log10(D7_40.Max_mag)+20*log10(D10_40.Max_mag)+20*log10(D16_40.Max_mag))/4,'--',f2,((20*log10(D5_40.Max_mag)+20*log10(D7_40.Max_mag)+20*log10(D10_40.Max_mag)+20*log10(D16_40.Max_mag))/4)-((20*log10(D5_40_po.Max_mag)+20*log10(D7_40_po.Max_mag)+20*log10(D10_40_po.Max_mag)+20*log10(D16_40_po.Max_mag))/4),'-*k')
title('Confronto A.massima pre e post @40dB'); grid on
xlabel('f_2 [Hz]'); ylabel('A.max [dB]');
legend('media pre','media post','\Delta','location','southwest')