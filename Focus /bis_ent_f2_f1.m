function P1_f2_f1=bis_ent_f2_f1(bisp,w_axis, f_s,f_1,f_2)
%Calcolo dell'entropia normalizzata del bispettro
%   bisp  :bispettro
%   waxis :asse delle freqenze
%   f_s: frequenza di campionamento
%   f_1,f_2: freq. di stimolo
%   P1_f2_f1:  entropia normalizzata

tot=0;
lw=length(w_axis);
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

%somma dei moduli della regione non ridondante
for k=1:100 
        tot=tot+sum(abs(bisp(puntof2-50:puntof2+49,puntof1-51+k)));
end 

p_i=0;
for k=puntof2-50:1:puntof2+49
    for j=puntof1-50:1:puntof1+49
        p_i=[p_i; abs(bisp(k,j))/tot];
    end
end

P1_f2_f1=0;
for k=2:length(p_i)
    if p_i(k)~=0
        P1_f2_f1=P1_f2_f1+p_i(k)*log(p_i(k));
    end
end
P1_f2_f1=-P1_f2_f1;