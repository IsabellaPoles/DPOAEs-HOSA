%% ANALISI DI SEGNALE
%soggetto numero:
%intensità del segnale:

clear all; clc; close all;

DATA=load('Subject5_a.mat');

% richiamo tutte le frequenze ad una specifica intensità
for i = 1 : 23

f_s = DATA.Meas.par.srate; %estraggo frequenza di campionamento
f1=DATA.Meas.par.f1(i);
f2=DATA.Meas.par.f2(i);
gain=DATA.Meas.par.inputgain;

%scarico i dati
signal_40=DATA.Meas.data{i,1}.tresp;

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

% salvataggio del plot
fstring = num2str(f2);
for k=1:length(fstring)
    if fstring(k)=='.'
        fstring(k)=','
    end
end

f1name = strcat('spettroP_f2=', fstring);
ff1 = convertCharsToStrings(f1name);
saveas(gcf,ff1, 'jpg')

%%
%stampo il bispettro del segnale usando come parametri n. campioni per segmento: 128 e
%overlap 50

figure (2)
[B_40,w_40]=BISPECD(signal_40, length(signal_40),8,128);
%estraggo del bispettro la zona di non ridondanza
B_nr_40=B_40(2049:4096,2049:4096);
%lunghezza del lato della finestra
w_nr_40=w_40(2049:end,:);
figure (3)
contour(w_nr_40(1:L/8).*48000,w_nr_40(1:L/8).*48000,abs(B_nr_40(1:L/8,1:L/8)),4),grid on 
title('Bispectrum estimated via the direct (FFT) method')
xlabel('f1(Hz)'), ylabel('f2(Hz)')
set(gcf,'Name','Hosa estratto BISPECD')

% salvataggio del plot
f2name = strcat('bispettro_f2=', fstring);
ff2 = convertCharsToStrings(f2name);
saveas(gcf,ff2, 'jpg')

%% PRIMO PARAMENTRO focus - AMPIEZZA MEDIA
[A_m_DP] = A_mean_DP(B_nr_40, w_nr_40,f1,f_s)
[A_m_f2_f1] = A_mean_f2_f1(B_nr_40, w_nr_40,f_s,f1,f2)

%% SECONDO PARAMETRO focus - AMPIEZZA MASSIMA
[max_mag_DP] = a_max_DP(B_nr_40,w_nr_40,f1,f_s)
[max_mag_f2f1] = a_max_f2f1(B_nr_40,w_nr_40,f1,f2,f_s)

%% TERZO PARAMETRO focus - ENTROPIA DEL BISPETTRO
P1_DP=bis_ent_DP(B_nr_40,w_nr_40,f1,f_s)
P1_f2_f1=bis_ent_f2_f1(B_nr_40,w_nr_40,f_s,f1,f2)

%% SESTO PARAMETRO - ENTROPIA DI FASE DEL BISPETTRO
[P_e_DP] = Pe_DP(B_nr_40,w_nr_40,f1,f_s)
[P_e_f2f1] = Pe_f2f1(B_nr_40,w_nr_40,f1,f2,f_s)

%% BARICENTRO DP
[f1_wcob_norm_DP,f2_wcob_norm_DP] = WCOB_DP(B_nr_40,w_nr_40,f_s,f1);
f1_wcob_DP=f1_wcob_norm_DP*f_s
f2_wcob_DP=f2_wcob_norm_DP*f_s

figure (11)
contour(w_nr_40(1:L/8).*48000,w_nr_40(1:L/8).*48000,abs(B_nr_40(1:L/8,1:L/8)),4),grid on 
title('Bispectrum estimated via the direct (FFT) method')
xlabel('f1(Hz)'), ylabel('f2(Hz)')
set(gcf,'Name','Hosa estratto BISPECD')
hold on
scatter (f1_wcob_DP,f2_wcob_DP,'r')
hold off

% salvataggio del plot
f2name = strcat('bispettroWCOB_DP_f2=', fstring);
ff2 = convertCharsToStrings(f2name);
saveas(gcf,ff2, 'jpg')

%% BARICENTRO f1_f2
[f1_wcob_f2_f1,f2_wcob_f2_f1] = WCOB_f2_f1(B_nr_40,w_nr_40,f_s,f1,f2);
f1_wcob_f2f1=f1_wcob_f2_f1*f_s
f2_wcob_f2f1=f2_wcob_f2_f1*f_s

figure (3)
contour(w_nr_40(1:L/8).*48000,w_nr_40(1:L/8).*48000,abs(B_nr_40(1:L/8,1:L/8)),4),grid on 
title('Bispectrum estimated via the direct (FFT) method')
xlabel('f1(Hz)'), ylabel('f2(Hz)')
set(gcf,'Name','Hosa estratto BISPECD')
hold on
scatter (f1_wcob_f2f1,f2_wcob_f2f1,'r')
hold off

% salvataggio del plot
f2name = strcat('bispettroWCOB_f2f1_f2=', fstring);
ff2 = convertCharsToStrings(f2name);
saveas(gcf,ff2, 'jpg')

%% salvataggio parametri

fname = sprintf('parametri_Sx_Ax_f2=%d.mat', f2);
save(fname, 'A_m_DP', 'A_m_f2_f1', 'max_mag_DP', 'max_mag_f2f1', 'P1_DP', 'P1_f2_f1', 'P_e_DP', 'P_e_f2f1', 'f1_wcob_DP','f2_wcob_DP','f1_wcob_f2f1','f2_wcob_f2f1');

end