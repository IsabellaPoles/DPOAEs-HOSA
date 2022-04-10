function P1=bis_ent(bisp,waxis)
%Calcolo dell'entropia normalizzata del bispettro
%   bisp  :bispettro
%   waxis :asse delle freqenze
%   P1    :entropia normalizzata

tot=0;
lw=length(waxis);

%somma dei moduli della regione non ridondante
for k=1:lw
    for j=1:k
        tot=tot+abs(bisp(k,j));
    end
end

p_i=0;
for k=1:lw
    for j=k:lw
        p_i=[p_i; abs(bisp(k,j))/tot];
    end
end

P1=0;
for k=2:length(p_i)
    P1=P1+p_i(k)*log(p_i(k));
end
P1=-P1;