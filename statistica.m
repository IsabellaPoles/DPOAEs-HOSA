clc; clear all; close all; 

% confronto pre/post discoteca di tutti i soggetti a diverse intensità

DATA_20=load('Risultati_S10_pre_20.mat');
DATA_30=load('Risultati_S10_pre_30.mat');
DATA_40=load('Risultati_S10_pre_40.mat');

DATA_20_po=load('Risultati_S10_post_20.mat');
DATA_30_po=load('Risultati_S10_post_30.mat');
DATA_40_po=load('Risultati_S10_post_40.mat');


[p_20_Pe,h_20_Pe]=signrank(angle(DATA_20_po.Pe),angle(DATA_20.Pe))

[p_20_P1,h_20_P1]=signrank(DATA_20_po.P1,DATA_20.P1)

[p_30_Pe,h_30_Pe]=signrank(angle(DATA_30_po.Pe),angle(DATA_30.Pe))

[p_30_P1,h_30_P1]=signrank(DATA_30_po.P1,DATA_30.P1)

[p_40_Pe,h_40_Pe]=signrank(angle(DATA_40_po.Pe),angle(DATA_40.Pe))

[p_40_P1,h_40_P1]=signrank(DATA_40_po.P1,DATA_40.P1)

figure (1)
boxplot([DATA_20_po.P1-DATA_20.P1,DATA_30_po.P1-DATA_30.P1,DATA_40_po.P1-DATA_40.P1],'notch','on','labels',{'20dB','30dB','40dB'})
title('Confronto Entropia pre - Entropia post'); grid on
xlabel('Ampiezza stimolo[dB]')

figure (2)
boxplot([angle(DATA_20_po.Pe)-angle(DATA_20.Pe),angle(DATA_30_po.Pe)-angle(DATA_30.Pe),angle(DATA_40_po.Pe)-angle(DATA_40.Pe)],'notch','on','labels',{'20dB','30dB','40dB'})
title('Confronto Entropia fase pre - Entropia fase post'); grid on
xlabel('Ampiezza stimolo[dB]')

[p_20_A_avg,h_20_A_avg]=signrank(DATA_20_po.A_avg,DATA_20.A_avg)

[p_20_A_maX,h_20_A_max]=signrank(DATA_20_po.Max_mag,DATA_20.Max_mag)

[p_30_A_avg,h_30_A_avg]=signrank(DATA_30_po.A_avg,DATA_30.A_avg)

[p_30_A_max,h_30_A_max]=signrank(DATA_30_po.Max_mag,DATA_30.Max_mag)

[p_40_A_avg,h_40_A_avg]=signrank(DATA_40_po.A_avg,DATA_40.A_avg)

[p_40_A_max,h_40_A_max]=signrank(DATA_40_po.Max_mag,DATA_40.Max_mag)

figure (3)
boxplot([DATA_20_po.A_avg-DATA_20.A_avg,DATA_30_po.A_avg-DATA_30.A_avg,DATA_40_po.A_avg-DATA_40.A_avg],'notch','on','labels' ,{'20dB','30dB','40dB'})
title('Confronto A.media pre - A.media post'); 
grid on
xlabel('Ampiezza stimolo[dB]')

figure (4)
boxplot([DATA_20_po.Max_mag-DATA_20.Max_mag,DATA_30_po.Max_mag-DATA_30.Max_mag,DATA_40_po.Max_mag-DATA_40.Max_mag],'notch','on', 'labels',{'20dB', '30dB', '40dB'})
title('Confronto A.max pre - A.max post'); 
grid on
xlabel('Ampiezza stimolo[dB]')

