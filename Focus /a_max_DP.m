function [a_max_DP] = a_max_DP(bis,w_axis,f1,fs)

%AMPIEZZA MASSIMA DEL BISPETTRO
%  [a_max_DP] = a_max_DP(bis,w,f1,fs)

%   Funzione che estrae la massima ampiezza del bispettro
%       a_max_f2f1  :massima ampiezza
%       bis         :bipettro in indagine
%       w           :asse delle frequenze normalizzato
%       f1          :frequenze di stimolo
%       fs          :frequenza di campionamento

a_max_DP=0; 
lw=length(w_axis);

f1_norm=f1/fs;

punto=0;
k=1;
while punto==0
    if(w_axis(k)==f1_norm)
        punto=k;
    end
   k=k+1; 
end

for k=punto-50:punto+49
    for j=1:100
        if(abs(bis(k,j))>a_max_DP)
            a_max_DP=abs(bis(k,j));
        end
    end
end
        
