function [a_max_f2f1] = a_max_f2f1(bis,w_axis,f1,f2,fs)

%AMPIEZZA MASSIMA DEL BISPETTRO
%  [a_max_f2f1] = a_max_f2f1(bis,w,f1,f2,fs)

%   Funzione che estrae la massima ampiezza del bispettro
%       a_max_f2f1  :massima ampiezza
%       bis         :bipettro in indagine
%       w           :asse delle frequenze normalizzato
%       f1,f2       :frequenze di stimolo
%       fs          :frequenza di campionamento

a_max_f2f1=0;
lw=length(w_axis);

f1_norm=f1/fs;
f2_norm=f2/fs;

puntof1=0;
puntof2=0;
%individuo i 2 indici di f1 e f2 per usare un intorno 100x100 ~ 1000x1000Hz
k=1;
while puntof1==0
    if(w_axis(k)==f1_norm)
        puntof1=k;
    end
   k=k+1; 
end
k=1;
while puntof2==0
    if(w_axis(k)==f2_norm)
        puntof2=k;
    end
    k=k+1;
end

for k=1:lw
    for j=1:k
        bis(k,j)=0+0i;
    end
end

for k=puntof2-50:puntof2+49
    for j=puntof1-50:puntof1+49
        if(abs(bis(k,j))>a_max_f2f1)
            a_max_f2f1=abs(bis(k,j));
        end
    end
end
        
