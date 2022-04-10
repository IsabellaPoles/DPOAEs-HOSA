function [P_e] = Pe(Bispectrum,w_axis)
%ENTROPIA DI FASE DEL BISPETTRO
%[Pe] = Pe(Bispectrum,w_axis)
    %Bispectrum: bispettro del segnale 
    %w_axis: asse delle frequenze normalizzate 
    %Pe: valore dell'entropia di fase del bispettro

P_e=0; 

%lw: calcolo della lunghezza del vettore delle frequenze 
lw= length(w_axis); 

%L: numero dei punti del bispettro appartenenti alla regione non ridontante 
L= (lw/2)^2+(lw/4);

%phase_b: vettore delle componenti della fase del bispettro 
phase_b=0; 

%sum_phase: variabile per la somma delle componenti di fase del bispettro
sum_phase=0; 

%p_sp: vettore delle componenti di Pe non ridondanti 
p_sp=0; 

for k=1:lw
    for j=k:lw
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
        P_e = P_e+ p_sp*log(p_sp);
    end
end
end










