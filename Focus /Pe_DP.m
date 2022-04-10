function [P_e_DP] = Pe_DP(Bispectrum,w_axis,f1,fs)
%ENTROPIA DI FASE DEL BISPETTRO
%[Pe_DP] = Pe_DP(Bispectrum,w_axis)
    %Bispectrum: bispettro del segnale 
    %w_axis: asse delle frequenze normalizzate
    %fs:    frequenza campionamento
    %f1:    frequenza stimolo
    %Pe_DP: valore dell'entropia di fase del bispettro

P_e_DP=0; 

%lw: calcolo della lunghezza del vettore delle frequenze 
lw= length(w_axis); 

%L: numero dei punti del bispettro appartenenti alla regione non ridontante 
L= 10000;

%phase_b: vettore delle componenti della fase del bispettro 
phase_b=0; 

%sum_phase: variabile per la somma delle componenti di fase del bispettro
sum_phase=0; 

%p_sp: vettore delle componenti di Pe non ridondanti 
p_sp=0; 

f_1_norm=f1/fs;

%individuo l'indice relativo a f1 per usare un intorno di 100x100 ~
%1000x1000Hz
punto=0;
k=1;
while punto==0
    if(w_axis(k)==f_1_norm)
        punto=k;
    end
   k=k+1; 
end


for k=punto-50:punto+49
    for j=1:100
        phase_b= [phase_b; angle(Bispectrum(k,j))];
    end 
end
for n=0:lw-1
    sum_phase=0; 
    
    % intervallo di definizione di sum_phase(n)
    sup= -pi+(2*pi*(n+1))/lw;
    inf= -pi+2*pi*n/lw; 
    
    for k=2:length (phase_b) 
     
        if (phase_b(k)<sup && phase_b(k)>= inf)
            sum_phase = sum_phase+ phase_b(k); 
        end 
        p_sp = sum_phase/L;
    end
    if p_sp~=0
        P_e_DP = P_e_DP+ p_sp*log(p_sp);
    end
end
end










