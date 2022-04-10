function [A_m_f2f1] = A_mean_f2_f1(Bispectrum, w_axis, f_s,f_1,f_2)

%AMPIEZZA MEDIA DEL BISPETTRO
% [A_mean_f2_f1] = A_mean_f2_f1(Bispectrum, w_axis,f_s,f_1,f_2)
        % A_mean_f2_f1    : ampiezza media del bispettro
        % Bispectrum: bispettro
        % w_axis : asse delle frequenze normalizzato 
        % f_s: frequenza di campionamento
        % f_1,f_2: freq. di stimolo
lw = length(w_axis);
L = 10000; 
tot=0; 
f_1_norm=f_1/f_s;
f_2_norm=f_2/f_s;
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

for k=1:lw
    for j=1:k
        bisp(k,j)=0+0i;
    end
end


for k=1:100
        tot = tot + sum(abs(Bispectrum(puntof2-50:puntof2+49,puntof1-51+k))); 
end 

A_m_f2f1 = tot/L; 

end 
