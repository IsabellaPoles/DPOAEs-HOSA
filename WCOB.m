function [f1_wcob_norm,f2_wcob_norm] = WCOB(Bispectrum,w_axis,f_s)
%WCOB (Weighted center of Bispectrum)
%[f1_wcob_norm,f2_wcob_norm] = WCOB(Bispectrum,w_axis,f_s)
    % Bispectrum : bispettro 
    % w_axis : asse delle frequenze normalizzate 
    % f_s: frequenza di campionamento
    % f1_wcob_norm: frequenza normalizzata del WCOB 
    % f2_wcob_norm: frequenza normalizzata del WCOB 

lw= length(w_axis); 
f1_wcob_n=0; f1_wcob_d=0;
f2_wcob_n=0; f2_wcob_d=0;
%i: indice delle frequenze f2
%j: indice delle frequenze f1
for k=1:lw
    f1_wcob_n=f1_wcob_n+w_axis(k)*f_s*sum(abs(Bispectrum(1:k,k)));
    f1_wcob_d=f1_wcob_d+sum(abs(Bispectrum(1:k,k))); 

   f2_wcob_n=f2_wcob_n+w_axis(k)*f_s*sum(abs(Bispectrum(k,k:lw)));
   f2_wcob_d= f2_wcob_d+sum(abs(Bispectrum(k,k:lw)));
end
f1_wcob= f1_wcob_n/f1_wcob_d;
f1_wcob_n=  f1_wcob/f_s;
f1_wcob_norm=real(f1_wcob_n);
        
f2_wcob= f2_wcob_n/f2_wcob_d;
f2_wcob_n=  f2_wcob/f_s;
f2_wcob_norm=real(f2_wcob_n);
end

