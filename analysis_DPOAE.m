%% ANALISI DI SEGNALE

clear all; clc; close all;


DATA=load('Subject5_a.mat');

f_s = DATA.Meas.par.srate; %estraggo frequenza di campionamento
f1=DATA.Meas.par.f1(7);
f2=DATA.Meas.par.f2(7);
gain=DATA.Meas.par.inputgain;

%scarico i dati, nel caso il 7° segnale con ampiezza 40
signal_40=DATA.Meas.data{7,3}.tresp;

%estrazione di 400 campioni per un grafico del segnale nel tempo
s_40=signal_40(:,1000:1399);
t=1000:1399;
tw=t/f_s;

%estrazione frequenza di campionamento
L=length(signal_40);
f = f_s*(0:(L/2))/L;
%calcolo fft
F_40=fft(signal_40);

P2_40 = (abs(F_40).^2)/L;
P1_40 = P2_40(1:L/2+1);
%P1_40(2:end-1) = 2*P1_40(2:end-1);

P1_spl=10*log10(P1_40./20e-6)-gain;

DPOAE=2*f1-f2;
P_f1=P1_spl(f==f1)
P_f2=P1_spl(f==f2)
P_DPOAE=P1_spl(f==DPOAE)

figure(1)
subplot (2,1,1)
plot(tw,s_40);
title('DPOAE nel tempo')
xlabel('tempo(ms)')
ylabel('Intensità')
subplot(2,1,2)
plot(f(1:L/8),P1_spl(1:L/8))
title('Spettro della DPOAE')
xlabel('frequenza(Hz)')
ylabel('Potenza(dB spl)')
grid on

%%
%stampo il bispettro del segnale usando come parametri n. campioni per segmento: 8 e
%overlap 50

figure (2)
[B_40,w_40]=BISPECD(signal_40, length(signal_40),8,128);
%estraggo del bispettro la zona di non ridondanza
B_nr_40=B_40(2049:4096,2049:4096);
%lunghezza del lato della finestra
w_nr_40=w_40(2049:end,:);
figure (3)
contour(w_nr_40.*48000,w_nr_40.*48000,abs(B_nr_40),4),grid on 
title('Bispectrum estimated via the direct (FFT) method')
xlabel('f1(Hz)'), ylabel('f2(Hz)')
set(gcf,'Name','Hosa estratto BISPECD')

%plot primo quadrante
% figure(3)
% contour(w_nr_40,w_nr_40,abs(B_nr_40),4),grid on 
% title('Bispectrum estimated via the direct (FFT) method')
% xlabel('f1'), ylabel('f2')
% set(gcf,'Name','Hosa estratto BISPECD')


%% PRIMO PARAMENTRO - AMPIEZZA MEDIA
[A_mean] = A_mean(B_nr_40, w_nr_40)

%% SECONDO PARAMETRO - AMPIEZZA MASSIMA
[max_mag] = a_max(B_nr_40,w_nr_40)

%% TERZO PARAMETRO - ENTROPIA DEL BISPETTRO
[P1] = bis_ent(B_nr_40,w_nr_40)

%% QUARTO PARAMETRO - INVARIANTE
%coefficiente angolare della linea di integrazione (SCELTA DALL'UTENTE)
m = 0.2;
[P] = invar(B_nr_40,w_nr_40,m) 

%% QUINTO PARAMETRO - BARICENTRO
[f1_wcob_norm,f2_wcob_norm] = WCOB(B_nr_40,w_nr_40,f_s)
f1_wcob=f1_wcob_norm*f_s
f2_wcob=f2_wcob_norm*f_s

%% SESTO PARAMETRO - ENTROPIA DI FASE DEL BISPETTRO
[Pe] = Pe(B_nr_40,w_nr_40)
