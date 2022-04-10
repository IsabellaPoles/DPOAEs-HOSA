function [f1_wcob_f2_f1,f2_wcob_f2_f1] = WCOB_f2_f1(Bispectrum,w_axis,f_s,f_1,f_2)
%WCOB (Weighted center of Bispectrum)
%[f1_wcob_f2_f1,f2_wcob_f2_f1] = WCOB_f2_f1(Bispectrum,w_axis,f_s,f_1,f_2)
    % Bispectrum : bispettro 
    % w_axis : asse delle frequenze normalizzate 
    % f_s: frequenza di campionamento
    % f_1,f_2: freq. di stimolo
    % f1_wcob_f2_f1: frequenza normalizzata del WCOB 
    % f2_wcob_f2_f1: frequenza normalizzata del WCOB 

lw= length(w_axis); 
f1_wcob_n=0; f1_wcob_d=0;
f2_wcob_n=0; f2_wcob_d=0;
%k: indice delle frequenze f2
%j: indice delle frequenze f1

for k=1:lw
    for j=1:k
        Bispectrum(k,j)=0+0i;
    end
end

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

for k=1:100
    f1_wcob_n=f1_wcob_n+w_axis(puntof2-51+k)*f_s*sum(abs(Bispectrum(puntof2-50:puntof2+49,puntof1-51+k)));
    f1_wcob_d=f1_wcob_d+sum(abs(Bispectrum(puntof2-50:puntof2+49,puntof1-51+k))); 

   f2_wcob_n=f2_wcob_n+w_axis(puntof1-51+k)*f_s*sum(abs(Bispectrum(puntof1-51+k,puntof1-51:puntof1+49)));
   f2_wcob_d= f2_wcob_d+sum(abs(Bispectrum(puntof1-51+k,puntof1-51:puntof1+49)));
end
f1_wcob= f1_wcob_n/f1_wcob_d;
f1_wcob_n=  f1_wcob/f_s;
f1_wcob_f2_f1=real(f1_wcob_n);
        
f2_wcob= f2_wcob_n/f2_wcob_d;
f2_wcob_n=  f2_wcob/f_s;
f2_wcob_f2_f1=real(f2_wcob_n);
end

