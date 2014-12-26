% HW 6 Problem 5 Abhishek Rao
clc;clear;

% Global constants
dt = 1e-3;
tstop = 5
t=0:dt:tstop % simulate from time 0 to tstop sec

% Part 1: Eigen values
%% 
A = [-1.7 -2.13e-4 0; 696 2.9 2.4; 0 6.5 -19.5];
eig(A)

% Part 2: Step response
B = [0 0 -0.16]';
C = [0 1 0];
D = [];
sys = ss(A,B,C,D);

u=ones(size(t));
[y,t,x] = lsim(sys,u,t);
plot(t,x);
title(' step input');
%%
% Part 3: Initial Condition, ref http://www.mathworks.com/help/control/ref/initial.html
x0 = [0.1 0 0]'; % Initial condition
figure();
u=zeros(size(t));
[y,t,x] = lsim(sys,u,t,x0);
plot(t,x);
title('zero input and initial state not zero'); % Simulate with initial condtion

% Part 4: Controllability and Obseravibilty 
CM = ctrb(sys)
rhoCM = rank(CM)
if rhoCM == 3 
    disp 'Matrix is controllable'
else
    disp 'System is not controllable'
end
OM = obsv(sys)
rhoOM = rank(OM)
if rhoOM == 3 
    disp 'Matrix is Observable'
else
    disp 'System is not Observable'
end



%% Part 5
k=place(A,B,[-2-j, -2, -2+j]);
Ab=A-B*k
sys2 = ss(Ab, B, C,D);
x0 = [0.1 0 0]'; % Initial condition
figure();
u=zeros(size(t));
[y,t,x] = lsim(sys2,u,t,x0);
plot(t,x);
title('After feedback, zero input, initial state not zero');