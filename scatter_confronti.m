clc; clear all; close all; 

% confronto pre/post discoteca a diverse intensità
DATA_20=load('Risultati_S7_pre_20.mat')
DATA_30=load('Risultati_S7_pre_30.mat')
DATA_40=load('Risultati_S7_pre_40.mat')

DATA_20_po=load('Risultati_S7_post_20.mat')
DATA_30_po=load('Risultati_S7_post_30.mat')
DATA_40_po=load('Risultati_S7_post_40.mat')


% ampiezza media 

figure(1)
plot(20*log10(DATA_20_po.A_avg),20*log10(DATA_20.A_avg),'or',20*log10(DATA_30_po.A_avg),20*log10(DATA_30.A_avg),'*b',20*log10(DATA_40_po.A_avg),20*log10(DATA_40.A_avg),'xg')
title ('A media pre e post')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('A.Media pre[dB]')
ylabel ('A.Media post[dB]')
ylim ([-120 -20])
xlim ([-120 -20])
grid on 

avg_lin=fitlm([DATA_20_po.A_avg; DATA_30_po.A_avg;DATA_40_po.A_avg] ,...
    [DATA_20.A_avg; DATA_30.A_avg; DATA_40.A_avg]); 
A_avg_mq=avg_lin.Coefficients; 
A_avg_R2=avg_lin.Rsquared;

% ampiezza massima 

figure(2)
plot(20*log10(DATA_20_po.Max_mag),20*log10(DATA_20_po.Max_mag),'or',20*log10(DATA_30_po.Max_mag),...
    20*log10(DATA_30.Max_mag),'*b',20*log10(DATA_40_po.Max_mag),20*log10(DATA_40.Max_mag),'xg')
title ('A massima pre e post')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('A.Max post[dB]')
xlabel ('A.Max pre[dB]')
ylim ([-60 10])
xlim ([-60 10])
grid on 

max_lin=fitlm([DATA_20_po.Max_mag;DATA_30_po.Max_mag; DATA_40_po.Max_mag],...
   [DATA_20.Max_mag; DATA_30.Max_mag; DATA_40.Max_mag]); 
Max_mag_R2=max_lin.Rsquared;
Max_mag_mq=max_lin.Coefficients; 


% entropia di fase 
figure (3)
plot(angle(DATA_20_po.Pe),angle(DATA_20.Pe), 'or',angle(DATA_30_po.Pe),angle(DATA_30.Pe), '*b', angle(DATA_40_po.Pe), angle(DATA_40.Pe), 'xg')
title ('Entropia di fase pre e post')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia Fase post')
xlabel ('Entropia Fase pre')
ylim ([-3 -0.5])
xlim ([-3 -0.5])
grid on 

phase_lin=fitlm([angle(DATA_20_po.Pe);angle(DATA_30_po.Pe);angle(DATA_40_po.Pe)],...
    [angle(DATA_20.Pe);angle(DATA_30.Pe); angle(DATA_40.Pe)]);
EntF_R2=phase_lin.Rsquared;
EntF_mq=phase_lin.Coefficients; 

%entropia del bispettro
figure (4)
plot(DATA_20_po.P1,DATA_20.P1, 'or',DATA_30_po.P1,DATA_30.P1,'*b', DATA_40_po.P1, DATA_40.P1, 'xg')
title ('Entropia pre e post')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia post')
xlabel ('Entropia pre')
ylim ([10 12.5])
xlim ([10 12.5])
grid on 

ent_lin=fitlm([DATA_20_po.P1;DATA_30_po.P1;DATA_40_po.P1],...
    [DATA_20.P1;DATA_30.P1; DATA_40.P1]);
ent_R2=ent_lin.Rsquared;
ent_mq=ent_lin.Coefficients;


save('S7_Rquadro', 'A_avg_R2','A_avg_mq','Max_mag_R2','Max_mag_mq', 'EntF_R2','EntF_mq','ent_R2','ent_mq');

