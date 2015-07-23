clc; %cancella la command window
close all; %chiude tutte le figure
clear all; %cancella tutte le varibili

% Simulazione di un corpo di massa m soggetta a una forza u e una forza elastica e una viscosa.
% m*a=u-k*y-b*v
% a accelerazione
% v velocita'
% y posizione
% k costante elastica
% b costante smorzamento

% Nei sistemi meccanici, normalmente si considerano come grandezze di stato
% la posizione e la velocita.
% Si definisce quindi x1=y e x2=v
% la velocita' e' la derivata della posizione quindi
% Dx1=x2 (dove con Dx1 intendo la derivata di x1)
% Dx2=a=-k/m*x1-b/m*x2+u/m

% definiamo x il vettore x=[x1;x2] e quindi
% Dx=[0 1;-k/m -c/m]*x+[0;1/m]*u

% l'uscita sara'
%y=[1 0]*x+0*u

% per cui
% A=[0 1;-k/m -b/m], B=[0;1/m], C=[1 0], D=0


% Dati m=1, k=0.25, c=4, u=2, tempo di simulazione 10

%------------------------------------INIZIO SOLUZIONE------------------------------
m=1;
k=0.25;
b=1;
A=[0 1;-k/m -b/m];
B=[0;1/m];
C=[1 0];
D=0;
x0 = [0 0]';
ueq = 2;
%calcolare il punto di equilibrio del sistema
%porre la derivata dello stato =0
%Dx=0 -> Dx=A*x+B*u=0 -> A*x = -B*u
%x=-inv(A)*B*u se det(A) != 0

if det(A)==0
   disp('La matrice A non e'' invertibile, non si pu� calcolare xeq'); 
else
    xeq = -inv(A)*B*ueq
end

%% Simulazione
sys=ss(A,B,C,D);
[y,t,x] = lsim(sys,u,t,x0);

plot(t,x); legend('x_1(t)','x_2(t)');

figure
plot(t,y); legend('y(t)');

figure
plot(x(:,1),x(:,2)); legend('traiettoria');