clear; close all; clc;

DATA=load('Subject5_a.mat');

f1=DATA.Meas.par.f1;
f2=DATA.Meas.par.f2;

clear DATA;

D1=load('parametri_S5_40_f2=3.468750e+03.mat');
D2=load('parametri_S5_40_f2=3.515625e+03.mat');
D3=load('parametri_S5_40_f2=3.562500e+03.mat');
D4=load('parametri_S5_40_f2=3.609375e+03.mat');
D5=load('parametri_S5_40_f2=3.656250e+03.mat');
D6=load('parametri_S5_40_f2=3.703125e+03.mat');
D7=load('parametri_S5_40_f2=3750.mat');
D8=load('parametri_S5_40_f2=3.796875e+03.mat');
D9=load('parametri_S5_40_f2=3.843750e+03.mat');
D10=load('parametri_S5_40_f2=3.890625e+03.mat');
D11=load('parametri_S5_40_f2=3.937500e+03.mat');
D12=load('parametri_S5_40_f2=3.984375e+03.mat');
D13=load('parametri_S5_40_f2=4.031250e+03.mat');
D14=load('parametri_S5_40_f2=4.078125e+03.mat');
D15=load('parametri_S5_40_f2=4125.mat');
D16=load('parametri_S5_40_f2=4.171875e+03.mat');
D17=load('parametri_S5_40_f2=4.218750e+03.mat');
D18=load('parametri_S5_40_f2=4.265625e+03.mat');
D19=load('parametri_S5_40_f2=4.312500e+03.mat');
D20=load('parametri_S5_40_f2=4.359375e+03.mat');
D21=load('parametri_S5_40_f2=4.406250e+03.mat');
D22=load('parametri_S5_40_f2=4.453125e+03.mat');
D23=load('parametri_S5_40_f2=4500.mat');

A_avg=[D1.A_mean;D2.A_mean;D3.A_mean;D4.A_mean;D5.A_mean;D6.A_mean;D7.A_mean;D8.A_mean;D9.A_mean;D10.A_mean;D11.A_mean;D12.A_mean;D13.A_mean;D14.A_mean;D15.A_mean;D16.A_mean;D17.A_mean;D18.A_mean;D19.A_mean;D20.A_mean;D21.A_mean;D22.A_mean;D23.A_mean];
Max_mag=[D1.max_mag;D2.max_mag;D3.max_mag;D4.max_mag;D5.max_mag;D6.max_mag;D7.max_mag;D8.max_mag;D9.max_mag;D10.max_mag;D11.max_mag;D12.max_mag;D13.max_mag;D14.max_mag;D15.max_mag;D16.max_mag;D17.max_mag;D18.max_mag;D19.max_mag;D20.max_mag;D21.max_mag;D22.max_mag;D23.max_mag];
P1=[D1.P1;D2.P1;D3.P1;D4.P1;D5.P1;D6.P1;D7.P1;D8.P1;D9.P1;D10.P1;D11.P1;D12.P1;D13.P1;D14.P1;D15.P1;D16.P1;D17.P1;D18.P1;D19.P1;D20.P1;D21.P1;D22.P1;D23.P1];
Pe=[D1.Pe;D2.Pe;D3.Pe;D4.Pe;D5.Pe;D6.Pe;D7.Pe;D8.Pe;D9.Pe;D10.Pe;D11.Pe;D12.Pe;D13.Pe;D14.Pe;D15.Pe;D16.Pe;D17.Pe;D18.Pe;D19.Pe;D20.Pe;D21.Pe;D22.Pe;D23.Pe];
P_f1=[D1.P_f1;D2.P_f1;D3.P_f1;D4.P_f1;D5.P_f1;D6.P_f1;D7.P_f1;D8.P_f1;D9.P_f1;D10.P_f1;D11.P_f1;D12.P_f1;D13.P_f1;D14.P_f1;D15.P_f1;D16.P_f1;D17.P_f1;D18.P_f1;D19.P_f1;D20.P_f1;D21.P_f1;D22.P_f1;D23.P_f1];
P_f2=[D1.P_f2;D2.P_f2;D3.P_f2;D4.P_f2;D5.P_f2;D6.P_f2;D7.P_f2;D8.P_f2;D9.P_f2;D10.P_f2;D11.P_f2;D12.P_f2;D13.P_f2;D14.P_f2;D15.P_f2;D16.P_f2;D17.P_f2;D18.P_f2;D19.P_f2;D20.P_f2;D21.P_f2;D22.P_f2;D23.P_f2];
P_DPOAE=[D1.P_DPOAE;D2.P_DPOAE;D3.P_DPOAE;D4.P_DPOAE;D5.P_DPOAE;D6.P_DPOAE;D7.P_DPOAE;D8.P_DPOAE;D9.P_DPOAE;D10.P_DPOAE;D11.P_DPOAE;D12.P_DPOAE;D13.P_DPOAE;D14.P_DPOAE;D15.P_DPOAE;D16.P_DPOAE;D17.P_DPOAE;D18.P_DPOAE;D19.P_DPOAE;D20.P_DPOAE;D21.P_DPOAE;D22.P_DPOAE;D23.P_DPOAE];
f1_wcob=[D1.f1_wcob;D2.f1_wcob;D3.f1_wcob;D4.f1_wcob;D5.f1_wcob;D6.f1_wcob;D7.f1_wcob;D8.f1_wcob;D9.f1_wcob;D10.f1_wcob;D11.f1_wcob;D12.f1_wcob;D13.f1_wcob;D14.f1_wcob;D15.f1_wcob;D16.f1_wcob;D17.f1_wcob;D18.f1_wcob;D19.f1_wcob;D20.f1_wcob;D21.f1_wcob;D22.f1_wcob;D23.f1_wcob];
f2_wcob=[D1.f2_wcob;D2.f2_wcob;D3.f2_wcob;D4.f2_wcob;D5.f2_wcob;D6.f2_wcob;D7.f2_wcob;D8.f2_wcob;D9.f2_wcob;D10.f2_wcob;D11.f2_wcob;D12.f2_wcob;D13.f2_wcob;D14.f2_wcob;D15.f2_wcob;D16.f2_wcob;D17.f2_wcob;D18.f2_wcob;D19.f2_wcob;D20.f2_wcob;D21.f2_wcob;D22.f2_wcob;D23.f2_wcob];
WCOB=[f1_wcob,f2_wcob];

save('Risultati_S5_pre_40', 'f1', 'f2', 'P_f1', 'P_f2', 'P_DPOAE', 'Pe', 'P1', 'Max_mag', 'A_avg', 'WCOB');