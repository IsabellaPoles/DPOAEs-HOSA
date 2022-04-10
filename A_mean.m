function [A_m] = A_mean(Bispectrum, w_axis)

%AMPIEZZA MEDIA DEL BISPETTRO
% [A_mean] = A_mean(Bispectrum, w_axis)
        % A_mean    : ampiezza media del bispettro
        % Bispectrum: bispettro
        % w_axis : asse delle frequenze normalizzato 
        
lw = length(w_axis);
L = (lw^2)/2+lw/2; 
sum_m=0; 


for k=1:lw
    for j=k:lw
        sum_m = sum_m + abs(Bispectrum(k,j)); 
    end 
end 

A_m = sum_m/L; 
end 

        