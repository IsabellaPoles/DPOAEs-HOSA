function [P_e_f2f1] = Pe_f2f1(Bispectrum,w_axis,f1,f2,fs)
%ENTROPIA DI FASE DEL BISPETTRO
%[Pe_f2f1] = Pe(Bispectrum,w_axis)
    %Bispectrum: bispettro del segnale 
    %w_axis: asse delle frequenze normalizzate
    %fs:    frequenza campionamento
    %f1,f2: frequenze stimolo
    %Pe_f2f1: valore dell'entropia di fase del bispettro

P_e_f2f1=0; 

%lw: calcolo della lunghezza del vettore delle frequenze 
lw= length(w_axis); 

%L: numero dei punti del bispettro appartenenti alla regione non ridontante 
L= 10000-(54^2)/2-54/2;

%phase_b: vettore delle componenti della fase del bispettro 
phase_b=0; 

%sum_phase: variabile per la somma delle componenti di fase del bispettro
sum_phase=0; 

%p_sp: vettore delle componenti di Pe non ridondanti 
p_sp=0; 

for k=1:lw
    for j=1:k
        Bispectrum(k,j)=0+0i;
    end
end

f_1_norm=f1/fs;
f_2_norm=f2/fs;

puntof1=0;
puntof2=0;
%individuo i 2 indici di f1 e f2 per usare un intorno 100x100 ~ 1000x1000Hz
k=1;
while puntof1==0
    if(w_axis(k)==f_1_norm)
        puntof1=k;
    end
   k=k+1; 
end
k=1;
while puntof2==0
    if(w_axis(k)==f_2_norm)
        puntof2=k;
    end
    k=k+1;
end

for k=puntof2-50:puntof2+49
    for j=puntof1-50:puntof1+49
        phase_b= [phase_b; angle(Bispectrum(k,j))];
    end 
end
for n=1:lw-1
    sum_phase=0; 
    
    % intervallo di definizione di sum_phase(n)
    sup= -pi+(2*pi*(n+1))/lw;
    low= -pi+2*pi*n/lw; 
    
    for k=2:length (phase_b) 
     
        if (phase_b(k)<sup && phase_b(k)>= low)
            sum_phase = sum_phase+ phase_b(k); 
        end 
        p_sp = sum_phase/L;
    end
    if p_sp~=0
        P_e_f2f1 = P_e_f2f1+ p_sp*log(p_sp);
    end
end
end










