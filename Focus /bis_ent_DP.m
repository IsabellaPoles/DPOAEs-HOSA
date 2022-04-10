function P1_DP=bis_ent_DP(bisp,w_axis, f1, fs)
%Calcolo dell'entropia normalizzata del bispettro
%   bisp  :bispettro
%   waxis :asse delle freqenze
%   fs:    frequenza campionamento
%   f1:    frequenza stimolo
%   P1_DP:  entropia normalizzata

tot=0;
lw=length(w_axis);
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

%somma dei moduli della regione non ridondante
for k=1:100 
        tot=tot+sum(abs(bisp(punto-50:punto+49,k)));
end

p_i=0;
for k=1:100
    for j=punto-50:punto+49
        p_i=[p_i; abs(bisp(j,k))/tot];
    end
end

P1_DP=0;
for k=2:length(p_i)
    P1_DP=P1_DP+p_i(k)*log(p_i(k));
end
P1_DP=-P1_DP;