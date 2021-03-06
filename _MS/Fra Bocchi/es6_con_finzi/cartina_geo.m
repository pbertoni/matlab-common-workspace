%         CARTINA GEOGRFICA
%Di una fotografia scattata da un elicottero � nota la relazione
%tra coordinate sulla fotografia (pixel(x,y)) e coordinate geografiche
%(u,v) per quattro punti:
%punto 1: x1=3  x2=5  u=7  v=10
%punto 1: x1=2  x2=2  u=4  v=5
%punto 1: x1=1  x2=2  u=2  v=3
%punto 1: x1=3  x2=3  u=6  v=6
%Si ipotizza che le relazioni tra i due sistemi di coordinate
%siano del tipo:
%  u=ax+by
%  v=cx+dy
%il programma seguente permette di stimare i parametri delle
%due relazioni.
% Le due relazioni sono lineari nei parametri allora l'approcio 
%seguito � analogo agli esercizi precedenti ( vedi Pressione Arteriosa).

%definizione dei vettori x1,x2 ed il vettore delle uscite y
x1=[3 2 1 3]';
x2=[5 2 2 3]';
y=[7 10;4 5;2 3;6 6];



% NB!!!!!!!!!!!!!!!!!!!!!!! la def della matrice M
%definizione della Matrice M
M=[x1 x2];  %nn c'� il vettore di 1 perch� nn c'� il termine noto

% Calcolo del vettore contenente i parametri del modello (t)
t = (inv(M'*M))*M'* y;

%coefficienti delle due curve
a=t(1,1)
b=t(2,1)
c=t(1,2)
d=t(2,2)
  
% 
% %grafico rappresentante la retta di regressione dei dati iniziali
% plot (x,y,'b.');
% xlabel('et�');
% ylabel('pressione');
% hold on;
% ys=a*M(:,1)+ b;     %espressione della retta di regressione
% plot(M(:,1),ys,'g-');
% hold off;
% grid;
% 
% 
% %statistical index
% r=corrcoef(x,y);
% r=r(1,2);
% mx=mean(x);
% my=mean(y);
% sx=std(x);
% sy=std(y);
% a_stat=r*sy/sx
% b_stat = my-a_stat*mx