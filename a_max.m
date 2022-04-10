function [max_mag] = a_max(bis,w)

%AMPIEZZA MASSIMA DEL BISPETTRO
%  [max_mag] = a_max(bis,w)

%   Funzione che estrae la massima ampiezza del bispettro
%       max_mag:massima ampiezza
%       bis    :bipettro in indagine
%       w      :asse delle frequenze normalizzato

max_mag=0; 
lw=length(w);
for k=1:lw
    for j=k:lw
        if(abs(bis(k,j))>max_mag)
            max_mag=abs(bis(k,j));
        end
    end
end
        
