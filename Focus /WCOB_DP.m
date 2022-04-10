function [f1_wcob_norm_DP,f2_wcob_norm_DP] = WCOB_DP(Bispectrum,w_axis,f_s,f_1)
%WCOB (Weighted center of Bispectrum)
%[f1_wcob_norm_DP,f2_wcob_norm_DP] = WCOB_DP(Bispectrum,w_axis,f_s,f_1,f_2)
    % Bispectrum : bispettro 
    % w_axis : asse delle frequenze normalizzate 
    % f_s: frequenza di campionamento
    % f_1: freq. di stimolo
    % f1_wcob_norm_DP: frequenza normalizzata del WCOB 
    % f2_wcob_norm_DP: frequenza normalizzata del WCOB 

lw= length(w_axis); 
f1_wcob_n=0; f1_wcob_d=0;
f2_wcob_n=0; f2_wcob_d=0;
%k: indice delle frequenze f2
%j: indice delle frequenze f1

f_1_norm=f_1/f_s;

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


for k=1:100
    f2_wcob_n=f2_wcob_n+w_axis(k)*f_s*sum(abs(Bispectrum(punto-50:punto+49,k)));
    f2_wcob_d=f2_wcob_d+sum(abs(Bispectrum(punto-50:punto+49,k))); 

   f1_wcob_n=f1_wcob_n+w_axis(punto-51+k)*f_s*sum(abs(Bispectrum(punto-51+k,1:100)));
   f1_wcob_d= f1_wcob_d+sum(abs(Bispectrum(punto-51+k,1:100)));
end
f1_wcob= f1_wcob_n/f1_wcob_d;
f1_wcob_n=  f1_wcob/f_s;
f1_wcob_norm_DP=real(f1_wcob_n);
        
f2_wcob= f2_wcob_n/f2_wcob_d;
f2_wcob_n=  f2_wcob/f_s;
f2_wcob_norm_DP=real(f2_wcob_n);
end

