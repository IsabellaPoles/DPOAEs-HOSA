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
plot(20*log10(DATA_20_po.A_avg_DP),20*log10(DATA_20.A_avg_DP),'or',20*log10(DATA_30_po.A_avg_DP),20*log10(DATA_30.A_avg_DP),'*b',20*log10(DATA_40_po.A_avg_DP),20*log10(DATA_40.A_avg_DP),'xg')
title ('A media pre e post @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('A.Media pre[dB]')
ylabel ('A.Media post[dB]')
ylim ([-90 -10])
xlim ([-90 -10])
grid on 


A_avg_DP_lin=fitlm([DATA_20_po.A_avg_DP;DATA_30_po.A_avg_DP;DATA_40_po.A_avg_DP],[DATA_20.A_avg_DP;DATA_30.A_avg_DP;DATA_40.A_avg_DP]);
A_avg_DP_R2=A_avg_DP_lin.Rsquared;
A_avg_DP_mq=A_avg_DP_lin.Coefficients;
% hold on
% plot(20*log10([DATA_20_po.A_avg_DP;DATA_30_po.A_avg_DP;DATA_40_po.A_avg_DP]),polyval(polyfit([DATA_20.A_avg_DP;DATA_30.A_avg_DP;DATA_40.A_avg_DP],[DATA_20_po.A_avg_DP;DATA_30_po.A_avg_DP;DATA_40_po.A_avg_DP],1),[DATA_20_po.A_avg_DP;DATA_30_po.A_avg_DP;DATA_40_po.A_avg_DP]),'k--')
% hold off

% ampiezza massima 
figure(2)
plot(20*log10(DATA_20_po.max_mag_DP),20*log10(DATA_20.max_mag_DP),'or',20*log10(DATA_30_po.max_mag_DP),20*log10(DATA_30.max_mag_DP),'*b',20*log10(DATA_40_po.max_mag_DP),20*log10(DATA_40.max_mag_DP),'xg')
title ('A massima pre e post @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('A.Max post[dB]')
xlabel ('A.Max pre[dB]')
ylim ([-70 10])
xlim ([-70 10])
grid on 

max_mag_DP_lin=fitlm([DATA_20_po.max_mag_DP;DATA_30_po.max_mag_DP;DATA_40_po.max_mag_DP],[DATA_20.max_mag_DP;DATA_30.max_mag_DP;DATA_40.max_mag_DP]);
Max_mag_DP_R2=max_mag_DP_lin.Rsquared;
Max_mag_DP_mq=max_mag_DP_lin.Coefficients;
%hold on
%plot(DATA_20_po.max_mag_DP,polyval(polyfit(DATA_20_po.max_mag_DP,DATA_20.max_mag_DP,1),DATA_20_po.max_mag_DP),'r')
%hold off 

% entropia di fase 
figure(3)
plot(angle(DATA_20_po.P_e_DP),angle(DATA_20.P_e_DP),'or',angle(DATA_30_po.P_e_DP),angle(DATA_30.P_e_DP),'*b',angle(DATA_40_po.P_e_DP),angle(DATA_40.P_e_DP), 'xg')
title ('Entropia di fase pre e post @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia Fase post')
xlabel ('Entropia Fase pre')
ylim ([-3.5 -0.5])
xlim ([-3.5 -0.5])
grid on 

entF_DP_lin=fitlm([angle(DATA_20_po.P_e_DP);angle(DATA_30_po.P_e_DP);angle(DATA_40_po.P_e_DP)],[angle(DATA_20.P_e_DP);angle(DATA_30.P_e_DP);angle(DATA_40.P_e_DP)])
EntF_DP_R2=entF_DP_lin.Rsquared;
EntF_DP_mq=entF_DP_lin.Coefficients;
%hold on
%plot(angle(DATA_20_po.P_e_DP),polyval(polyfit(angle(DATA_20_po.P_e_DP),angle(DATA_20.P_e_DP),1),angle(DATA_20_po.P_e_DP)),'r')
%hold off
%%%%
%entropia del bispettro
figure(4)
plot(DATA_20_po.P1_DP,DATA_20.P1_DP,'or',DATA_30_po.P1_DP,DATA_30.P1_DP,'*b', DATA_40_po.P1_DP, DATA_40.P1_DP,'xg')
title ('Entropia pre e post @(f1;f2-f1)')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia post')
xlabel ('Entropia pre')
ylim ([8.1 8.8])
xlim ([8.1 8.8])
grid on 

ent_DP_lin=fitlm([DATA_20_po.P1_DP;DATA_30_po.P1_DP;DATA_40_po.P1_DP],[DATA_20.P1_DP;DATA_30.P1_DP;DATA_40.P1_DP])
ent_DP_R2=ent_DP_lin.Rsquared;
ent_DP_mq=ent_DP_lin.Coefficients;
%hold on
% plot(DATA_20.P1_DP,polyval(polyfit(DATA_20.P1_DP,DATA_20_po.P1_DP,1),DATA_20.P1_DP),'r')
%hold off

% @(f2;f1)
% ampiezza media 
figure(5)
plot(20*log10(DATA_20_po.A_avg_f2_f1),20*log10(DATA_20.A_avg_f2_f1),'or',20*log10(DATA_30_po.A_avg_f2_f1),20*log10(DATA_30.A_avg_f2_f1),'*b',20*log10(DATA_40_po.A_avg_f2_f1),20*log10(DATA_40.A_avg_f2_f1),'xg')
title ('A media pre e post @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
xlabel ('A.Media pre[dB]')
ylabel ('A.Media post[dB]')
ylim ([-90 10])
xlim ([-90 10])
grid on 

A_avg_f2f1_lin=fitlm([DATA_20_po.A_avg_f2_f1;DATA_30_po.A_avg_f2_f1;DATA_40_po.A_avg_f2_f1],[DATA_20.A_avg_f2_f1;DATA_30.A_avg_f2_f1;DATA_40.A_avg_f2_f1])
A_avg_f2f1_R2=A_avg_f2f1_lin.Rsquared;
A_avg_f2f1_mq=A_avg_f2f1_lin.Coefficients;
%hold on
% plot(DATA_20.A_avg_f2_f1,polyval(polyfit(DATA_20.A_avg_f2_f1,DATA_20_po.A_avg_f2_f1,1),DATA_20.A_avg_f2_f1),'r')
%hold off

% ampiezza massima 
figure(6)
plot(20*log10(DATA_20_po.max_mag_f2f1),20*log10(DATA_20.max_mag_f2f1),'or',20*log10(DATA_30_po.max_mag_f2f1),20*log10(DATA_30.max_mag_f2f1),'*b',20*log10(DATA_40_po.max_mag_f2f1),20*log10(DATA_40.max_mag_f2f1),'xg')
title ('A massima pre e post @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('A.Max post[dB]')
xlabel ('A.Max pre[dB]')
ylim ([-80 10])
ylim ([-80 10])
grid on 

max_mag_f2f1_lin=fitlm([DATA_20_po.max_mag_f2f1;DATA_30_po.max_mag_f2f1;DATA_40_po.max_mag_f2f1],[DATA_20.max_mag_f2f1;DATA_30.max_mag_f2f1;DATA_40.max_mag_f2f1])
Max_mag_f2f1_R2=max_mag_f2f1_lin.Rsquared;
Max_mag_f2f1_mq=max_mag_f2f1_lin.Coefficients;
%hold on
% plot(DATA_20.max_mag_f2f1,polyval(polyfit(DATA_20.max_mag_f2f1,DATA_20_po.max_mag_f2f1,1),DATA_20.max_mag_f2f1),'r')
% hold off

% entropia di fase 
figure(7)
plot(angle(DATA_20_po.P_e_f2f1),angle(DATA_20.P_e_f2f1),'or',angle(DATA_30_po.P_e_f2f1),angle(DATA_30.P_e_f2f1),'*b',angle(DATA_40_po.P_e_f2f1),angle(DATA_40.P_e_f2f1),'xg')
title ('Entropia di fase pre e post @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia Fase post')
xlabel ('Entropia Fase pre')
ylim ([-3.5 0])
xlim ([-3.5 0])
grid on 
 
entF_f2f1_lin=fitlm([angle(DATA_20_po.P_e_f2f1);angle(DATA_30_po.P_e_f2f1);angle(DATA_40_po.P_e_f2f1)],[angle(DATA_20.P_e_f2f1);angle(DATA_30.P_e_f2f1);angle(DATA_40.P_e_f2f1)])
EntF_f2f1_R2=entF_f2f1_lin.Rsquared;
EntF_f2f1_mq=entF_f2f1_lin.Coefficients;
%hold on
% plot(angle(DATA_20.P_e_f2f1),polyval(polyfit(angle(DATA_20.P_e_f2f1),angle(DATA_20_po.P_e_f2f1),1),angle(DATA_20.P_e_f2f1)),'r')
%hold off

%entropia del bispettro
figure(8)
plot(DATA_20_po.P1_f2_f1,DATA_20.P1_f2_f1,'or',DATA_30_po.P1_f2_f1,DATA_30.P1_f2_f1,'*b', DATA_40_po.P1_f2_f1,DATA_40.P1_f2_f1,'xg')
title ('Entropia pre e post @(f2;f1)')
legend ('20 dB', '30 dB', '40 dB')
ylabel ('Entropia post')
xlabel ('Entropia pre')
ylim ([5.6 6.8])
xlim ([5.6 6.8])
grid on 

ent_f2f1_lin=fitlm([DATA_20_po.P1_f2_f1;DATA_30_po.P1_f2_f1;DATA_40_po.P1_f2_f1],[DATA_20.P1_f2_f1;DATA_30.P1_f2_f1;DATA_40.P1_f2_f1])
ent_f2f1_R2=ent_f2f1_lin.Rsquared;
ent_f2f1_mq=ent_f2f1_lin.Coefficients;
%hold on
%plot([DATA_20_po.P1_f2_f1;DATA_30_po.P1_f2_f1;DATA_40_po.P1_f2_f1],polyval(polyfit([DATA_20.P1_f2_f1;DATA_30.P1_f2_f1;DATA_40.P1_f2_f1],[DATA_20_po.P1_f2_f1;DATA_30_po.P1_f2_f1;DATA_40_po.P1_f2_f1],1),[DATA_20_po.P1_f2_f1;DATA_30_po.P1_f2_f1;DATA_40_po.P1_f2_f1]),'--k')
%hold off

save('S5_Focus_Rquadro','A_avg_DP_R2','A_avg_f2f1_R2','A_avg_DP_mq','A_avg_f2f1_mq',...
    'Max_mag_DP_R2','Max_mag_f2f1_R2','Max_mag_DP_mq','Max_mag_f2f1_mq',...
    'EntF_DP_R2','EntF_f2f1_R2','EntF_DP_mq','EntF_f2f1_mq',...
    'ent_DP_R2','ent_f2f1_R2','ent_DP_mq','ent_f2f1_mq')