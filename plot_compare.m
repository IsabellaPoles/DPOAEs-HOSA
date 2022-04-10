clear; clc; close all;

D20pre=load('Risultati_S5_pre_20.mat');
D30pre=load('Risultati_S5_pre_30.mat');
D40pre=load('Risultati_S5_pre_40.mat');
D20post=load('Risultati_S5_post_20.mat');
D30post=load('Risultati_S5_post_30.mat');
D40post=load('Risultati_S5_post_40.mat');

f2=D20pre.f2;

figure(1)
plot(f2,D20pre.Max_mag,'r',f2,D30pre.Max_mag,'b',f2,D40pre.Max_mag,'g',f2,D20post.Max_mag,'--r',...
    f2,D30post.Max_mag,'--b',f2,D40post.Max_mag,'--g')
xlabel('Frequenze (Hz)'); ylabel('Ampiezza');
title('Confronto ampiezza massima in frequenza');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

figure(2)
plot(f2,D20pre.A_avg,'r',f2,D30pre.A_avg,'b',f2,D40pre.A_avg,'g',f2,D20post.A_avg,'--r',...
    f2,D30post.A_avg,'--b',f2,D40post.A_avg,'--g')
xlabel('Frequenze (Hz)'); ylabel('Ampiezza');
title('Confronto ampiezza media in frequenza');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

% plot(f2,D20pre.P1,'r',f2,D30pre.P1,'g',f2,D40pre.P1,'k',f2,D20post.P1,'--r',...
%     f2,D30post.P1,'--g',f2,D40post.P1,'--k'); grid on
% xlabel('Frequenze (Hz)'); ylabel('Entropia');
% title('Confronto entropia del bispettro');
% legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post');

lin20pre=polyval(polyfit(f2',D20pre.P1,1),f2);
lin20post=polyval(polyfit(f2',D20post.P1,1),f2);
lin30pre=polyval(polyfit(f2',D30pre.P1,1),f2);
lin30post=polyval(polyfit(f2',D30post.P1,1),f2);
lin40pre=polyval(polyfit(f2',D40pre.P1,1),f2);
lin40post=polyval(polyfit(f2',D40post.P1,1),f2);

%hold on
figure(3)
plot(f2,lin20pre,'r',f2,lin30pre,'b',f2,lin40pre,'g',f2,lin20post,'--r',...
    f2,lin30post,'--b',f2,lin40post,'--g','linewidth',1)
xlabel('Frequenze (Hz)'); ylabel('Entropia'); ylim([10.5, 12])
title('Confronto regressione lineare entropia del bispettro');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');
%hold off

Pelin20pre=polyval(polyfit(f2',D20pre.Pe,1),f2);
Pelin20post=polyval(polyfit(f2',D20post.Pe,1),f2);
Pelin30pre=polyval(polyfit(f2',D30pre.Pe,1),f2);
Pelin30post=polyval(polyfit(f2',D30post.Pe,1),f2);
Pelin40pre=polyval(polyfit(f2',D40pre.Pe,1),f2);
Pelin40post=polyval(polyfit(f2',D40post.Pe,1),f2);

figure(4)
subplot(2,1,1)
plot(f2,angle(Pelin20pre),'r',f2,angle(Pelin30pre),'b',f2,angle(Pelin40pre),'g',f2,angle(Pelin20post),'--r',...
    f2,angle(Pelin30post),'--b',f2,angle(Pelin40post),'--g')
xlabel('Frequenze (Hz)'); ylabel('Fase');
title('Confronto regressione entropia di fase');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post','location','best');

subplot(2,1,2)
plot(f2,abs(Pelin20pre),'r',f2,abs(Pelin30pre),'b',f2,abs(Pelin40pre),'g',f2,abs(Pelin20post),'--r',...
    f2,abs(Pelin30post),'--b',f2,abs(Pelin40post),'--g')
xlabel('Frequenze (Hz)'); ylabel('Modulo');
title('Confronto entropia del bispettro');
legend('20dB pre','30dB pre','40dB pre','20dB post','30dB post','40dB post');
