% Author: Pritesh Kanani
% Finals
% Problem 6
clc;
clear all;

t= 0:0.01:15;
u=zeros(size(t));


% Part 1
A = [-0.0507 -3.861 0 -32.2; -0.00117 -0.5164 1 0; -0.000129 1.4168 -0.4932 0;0 0 1 0];
a = eig(A);

% Part 2
B = [0 ;-0.0717 ;-1.645; 0];
C = [0 0 1 0];
D = 0;
sys = ss(A,B,C,D);

CM = [B A*B A*A*B A*A*A*B];
rankCM = rank(CM);
if rankCM == 4
    disp 'Full Rank and controllable'
else
    disp 'System is not controllable'
end

%%Observability Matrix
OM = [C' (C*A)' (C*A*A)' (C*A*A*A)']';
rankOM= rank(OM);
if rankOM == 4
    disp 'Full Rank and observable'
else
    disp 'System is not observable'
end

%%%%%%Problem 4
c1= -1.25 + 2.2651j;
c2= -1.25 - 2.2651j;
c3= -0.01 + 0.095j;
c4= -0.01 - 0.095j;

F = [c1 0 0 0; 0 c2 0 0; 0 0 c3 0; 0 0 0 c4];


kbar = [ 1 1 1 1 ];
%kbar and F are observable
Obs = [ kbar' , (kbar*F)', (kbar*F*F)', (kbar*F*F*F)']';
rankObs = rank(Obs)
if rankObs == 4
    disp 'Full Rank and observable. Continue with the kbar selected'
else
    disp 'System is not observable'
end

Clya = -B*kbar;
Blya= -F;
Alya= A;

T=lyap(Alya,Blya,Clya);

k=kbar* inv(T);
% The solution

e1= 0;
e2= -0.421;
e3= -0.587;
e4= -1;


F1 = [e1 0 0 0; 0 e2 0 0; 0 0 e3 0; 0 0 0 e4];
lbar= [1;1;1;1];


Con = [lbar F1*lbar F1*F1*lbar F1*F1*F1*lbar];
rankCon = rank(Con)

if rankCon == 4
    disp 'Full Rank and controllable. Continue with the lbar selected'
else
    disp 'System is not controllable.'
end

Clya1= (lbar*C)';
Blya1 = - F1';
Alya1 =  A';

T1=(lyap(Alya1,Blya1,-Clya1))';
l= inv(T1) * lbar;
% the Answer
