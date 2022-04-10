function P=invar(bis_1q,w_nr,m)
%Calcolo dell' invarainte bispettrale P(m)=arctan(Ii(m)/Ir(m))
%   bis_nr :1° quadrante del bispettro
%   w_nr   :assi del bispettro
%   m      :coefficente angolare della retta su cui si calcola l'invariatne
%
%   P      :invariante
%
%I(m)=integrale di linea di B(f1,m*f1)

%Controllo che la retta sia adatta
if(m>1 || m<0)
    error('retta non valida');
end

P=0;
I=0;
% Retta di coefficiente m
f=@(w) m*w;
% Funzione valutata nei punti di w_nr 
y=f(w_nr);
% Implementazione integrale di linea 
for k=1:length(w_nr)
    j=1;
    while (y(k)-w_nr(j)>=0) % Verifica passagio per punti noti del bispettro 
        d=y(k)-w_nr(j);
        j=j+1;
    end
    if(d==0)
        I=I+bis_1q(k,j); % Se y(k) è un punto del bispettro allora I somma il valore del bispettro in quel punto 
    else
        % Media pesata nel caso in cui y(k) non sia un punto del bispettro 
        add=(bis_1q(k,j)*((1-d)/(w_nr(j+1)-w_nr(j)))+bis_1q(k,j+1)*(d/(w_nr(j+1)-w_nr(j))))/2;
        I=I+add;
    end
end
P=atan(imag(I)/real(I)); % Formula analitica dell'invariante 