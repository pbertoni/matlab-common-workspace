%%es2
close all
clc 
clear


%prima conf k1 < epsilon2/(e_p)
epsilon1 = 40;
epsilon2 = 20;
e_ = 0.2;
p = 0.3;
k1 = 150;



%prima conf k1 < epsilon2/(e_p)
epsilon1 = 40;
epsilon2 = 10;
e_ = 0.1;
p = 0.2;
k1 = 800;


%%punti di equilibrio

xeq1 = [0 0]'
xeq2 = [k1 0]'
xeq3 = [epsilon2/(e_*p) epsilon1/p*(1-epsilon2/(e_*p*k1))]'
x0 = [25 -10]'


%linearizzo il sistema con i tre punti di equilibrio
%linearizzo il sistema
[A B C D] = linmod('es3_sim',xeq1)
%autovalori e autovettori
[autovet_xeq1,autoval_xeq1] = eig(A);

%linearizzo il sistema
[A B C D] = linmod('es3_sim',xeq2)
%autovalori e autovettori
[autovet_xeq2,autoval_xeq2] = eig(A);


%linearizzo il sistema xeq3
[A B C D] = linmod('es3_sim',xeq3)
%autovalori e autovettori
[autovet_xeq3,autoval_xeq3] = eig(A);

%simulare T tempo
[T,xout,simout] = sim('es3_sim');

%traettoria e movimento
plot(xout(:,1),xout(:,2),'b-');
axis([0 100 0 100])

figure
plot(T,xout(:,1),'b-');
hold on
plot(T,xout(:,2),'r-');
hold off



%isocline************************

%Disegno x1=0

x2_iso1 = [-500:1:500];%x2 � qualsiasi, quindi faccio da -500 a 500
x1_iso1 = zeros(length(x2_iso1));%x1� zero
figure
plot(x1_iso1,x2_iso1,'r-');

hold on;
% Disegno x2=1/(pe1)-e1/(pk1)n1 => � una retta
x1_iso1=[0,500];
x2_iso1=[];
x2_iso1(1)=epsilon1/(p)-epsilon1/(p*k1)*x1_iso1(1);%NB
x2_iso1(2)=epsilon1/(p)-epsilon1/(p*k1)*x1_iso1(2);
plot(x1_iso1,x2_iso1,'r-');

% Disegno delle isocline dell'equazione 2
% Disegno x1=e2/(ep)
x2_iso2 = [-500,500];
x1_iso2 = [];
x1_iso2(1) = epsilon2/(e_*p); 
x1_iso2(2) = epsilon2/(e_*p); 

plot(x1_iso2,x2_iso2,'b-');% il - connette i punti!!!!!

% Disegno x2=0
x1_iso2=[0:1:500];
x2_iso2(1:length(x1_iso2))=0;

plot(x1_iso2,x2_iso2,'b-');


hold off;




