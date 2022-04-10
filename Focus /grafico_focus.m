clear; clc; close all;

D20pre=load('Focus_S5_pre_20.mat');
D30pre=load('Focus_S5_pre_30.mat');
D40pre=load('Focus_S5_pre_40.mat');
D20post=load('Focus_S5_post_20.mat');
D30post=load('Focus_S5_post_30.mat');
D40post=load('Focus_S5_post_40.mat');

f2=D20pre.f2;

figure(1)
subplot(2,1,1)
plot(f2,D20pre.max_mag_DP,'r',f2,D30pre.max_mag_DP,'b',f2,D40pre.max_mag_DP,'g',f2,D20post.max_mag_DP,'--r',...
    f2,D30post.max_mag_DP,'--b',f2,D40post.max_mag_DP,'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Ampiezza');
title('Confronto ampiezza massima @(f1;f2-f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

subplot(2,1,2)
plot(f2,D20pre.max_mag_f2f1,'r',f2,D30pre.max_mag_f2f1,'b',f2,D40pre.max_mag_f2f1,'g',f2,D20post.max_mag_f2f1,'--r',...
    f2,D30post.max_mag_f2f1,'--b',f2,D40post.max_mag_f2f1,'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Ampiezza');
title('Confronto ampiezza massima @(f2;f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

figure(2)
subplot(2,1,1)
plot(f2,D20pre.A_avg_DP,'r',f2,D30pre.A_avg_DP,'b',f2,D40pre.A_avg_DP,'g',f2,D20post.A_avg_DP,'--r',...
    f2,D30post.A_avg_DP,'--b',f2,D40post.A_avg_DP,'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Ampiezza');
title('Confronto ampiezza media @(f1;f2-f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

subplot(2,1,2)
plot(f2,D20pre.A_avg_f2_f1,'r',f2,D30pre.A_avg_f2_f1,'b',f2,D40pre.A_avg_f2_f1,'g',f2,D20post.A_avg_f2_f1,'--r',...
    f2,D30post.A_avg_f2_f1,'--b',f2,D40post.A_avg_f2_f1,'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Ampiezza');
title('Confronto ampiezza media @(f2;f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

lin20pre_DP=polyval(polyfit(f2',D20pre.P1_DP,1),f2);
lin20post_DP=polyval(polyfit(f2',D20post.P1_DP,1),f2);
lin30pre_DP=polyval(polyfit(f2',D30pre.P1_DP,1),f2);
lin30post_DP=polyval(polyfit(f2',D30post.P1_DP,1),f2);
lin40pre_DP=polyval(polyfit(f2',D40pre.P1_DP,1),f2);
lin40post_DP=polyval(polyfit(f2',D40post.P1_DP,1),f2);

lin20pre_f2_f1=polyval(polyfit(f2',D20pre.P1_f2_f1,1),f2);
lin20post_f2_f1=polyval(polyfit(f2',D20post.P1_f2_f1,1),f2);
lin30pre_f2_f1=polyval(polyfit(f2',D30pre.P1_f2_f1,1),f2);
lin30post_f2_f1=polyval(polyfit(f2',D30post.P1_f2_f1,1),f2);
lin40pre_f2_f1=polyval(polyfit(f2',D40pre.P1_f2_f1,1),f2);
lin40post_f2_f1=polyval(polyfit(f2',D40post.P1_f2_f1,1),f2);

figure(3)
subplot(2,1,1)
plot(f2,lin20pre_DP,'r',f2,lin30pre_DP,'b',f2,lin40pre_DP,'g',f2,lin20post_DP,'--r',...
    f2,lin30post_DP,'--b',f2,lin40post_DP,'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Entropia');
title('Confronto regressione lineare entropia del bispettro @(f1;f2-f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

subplot(2,1,2)
plot(f2,lin20pre_f2_f1,'r',f2,lin30pre_f2_f1,'b',f2,lin40pre_f2_f1,'g',f2,lin20post_f2_f1,'--r',...
    f2,lin30post_f2_f1,'--b',f2,lin40post_f2_f1,'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Entropia');
title('Confronto regressione lineare entropia del bispettro @(f2;f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

Pelin20pre_DP=polyval(polyfit(f2',D20pre.P_e_DP,1),f2);
Pelin20post_DP=polyval(polyfit(f2',D20post.P_e_DP,1),f2);
Pelin30pre_DP=polyval(polyfit(f2',D30pre.P_e_DP,1),f2);
Pelin30post_DP=polyval(polyfit(f2',D30post.P_e_DP,1),f2);
Pelin40pre_DP=polyval(polyfit(f2',D40pre.P_e_DP,1),f2);
Pelin40post_DP=polyval(polyfit(f2',D40post.P_e_DP,1),f2);

figure(4)
subplot(2,1,1)
plot(f2,angle(Pelin20pre_DP),'r',f2,angle(Pelin30pre_DP),'b',f2,angle(Pelin40pre_DP),'g',f2,angle(Pelin20post_DP),'--r',...
    f2,angle(Pelin30post_DP),'--b',f2,angle(Pelin40post_DP),'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Fase');
title('Confronto regressione entropia di fase @(f1;f2-f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

subplot(2,1,2)
plot(f2,abs(Pelin20pre_DP),'r',f2,abs(Pelin30pre_DP),'b',f2,abs(Pelin40pre_DP),'g',f2,abs(Pelin20post_DP),'--r',...
    f2,abs(Pelin30post_DP),'--b',f2,abs(Pelin40post_DP),'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Modulo');
title('Confronto regressione entropia di fase @(f1;f2-f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post');

P_e_f2f1lin20pre_f2f1=polyval(polyfit(f2',D20pre.P_e_f2f1,1),f2);
P_e_f2f1lin20post_f2f1=polyval(polyfit(f2',D20post.P_e_f2f1,1),f2);
P_e_f2f1lin30pre_f2f1=polyval(polyfit(f2',D30pre.P_e_f2f1,1),f2);
P_e_f2f1lin30post_f2f1=polyval(polyfit(f2',D30post.P_e_f2f1,1),f2);
P_e_f2f1lin40pre_f2f1=polyval(polyfit(f2',D40pre.P_e_f2f1,1),f2);
P_e_f2f1lin40post_f2f1=polyval(polyfit(f2',D40post.P_e_f2f1,1),f2);

figure(5)
subplot(2,1,1)
plot(f2,angle(P_e_f2f1lin20pre_f2f1),'r',f2,angle(P_e_f2f1lin30pre_f2f1),'b',f2,angle(P_e_f2f1lin40pre_f2f1),'g',f2,angle(P_e_f2f1lin20post_f2f1),'--r',...
    f2,angle(P_e_f2f1lin30post_f2f1),'--b',f2,angle(P_e_f2f1lin40post_f2f1),'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Fase');
title('Confronto regressione entropia di fase @(f2;f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

subplot(2,1,2)
plot(f2,abs(P_e_f2f1lin20pre_f2f1),'r',f2,abs(P_e_f2f1lin30pre_f2f1),'b',f2,abs(P_e_f2f1lin40pre_f2f1),'g',f2,abs(P_e_f2f1lin20post_f2f1),'--r',...
    f2,abs(P_e_f2f1lin30post_f2f1),'--b',f2,abs(P_e_f2f1lin40post_f2f1),'--g'); grid on;
xlabel('Frequenze (Hz)'); ylabel('Modulo');
title('Confronto regressione entropia di fase @(f2;f1)');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post');
