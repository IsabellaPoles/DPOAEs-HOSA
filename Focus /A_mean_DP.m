function [A_m_DP] = A_mean_DP(Bispectrum, w_axis, f1, fs)

%AMPIEZZA MEDIA DEL BISPETTRO
% [A_mean_DP] = A_mean_DP(Bispectrum, w_axis)
        % A_mean_DP   : ampiezza media del bispettro
        % Bispectrum: bispettro
        %   fs:    frequenza campionamento
        %   f1:    frequenza stimolo
        % w_axis : asse delle frequenze normalizzato 
        
lw = length(w_axis);
L =10000; 
tot=0; 
f1_norm=f1/fs;

%individuo l'indice relativo a f1 per usare un intorno di 100x100 ~
%1000x1000Hz
punto=0;
k=1;
while punto==0
    if(w_axis(k)==f1_norm)
        punto=k;
    end
   k=k+1; 
end

for k=1:100
    for j=punto-50:punto+49
        tot = tot + abs(Bispectrum(k,j)); 
    end 
end 

A_m_DP = tot/L; 
end 

        