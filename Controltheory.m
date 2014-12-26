% Author: Pritesh Kanani
% Homework 6
% Problem 4

% dt = 1e-3;
% tstop = 5
% t=0:dt:tstop % simulate from time 0 to tstop sec


A = [-1.7,-2.13e-4,0;696,2.9,2.4;0,6.5,-19.5];
eig(A)
%  Answer to question 1

B = [0;0;-0.16];
C = [0,1,0];
D = 0;
sys = ss(A,B,C,D);
[a,b,c]=step(sys);
plot(c);
% u=ones(size(t));
% [y,t,x] = lsim(sys,u,t);
% plot(t,x);
% title('x(t) for step input')



%  Answer to question 2


x0 = [0.1 0 0]'; 
figure,
[d e f]= initial(sys,x0) % Simulate with initial condtion
%  Answer to question 3
% 
% 
% % controllability Matrix
% CM = [B A*B A*A*B];
% rankCM = rank(CM);
% if rankCM == 3 
%     disp 'Full Rank and controllable'
% else
%     disp 'System is not controllable'
% end
% 
% % Observability Matrix
% OM = [C' (C*A)' (C*A*A)']';
% rankOM= rank(OM);
% if rankOM == 3 
%     disp 'Full Rank and observable'
% else
%     disp 'System is not observable'
% end
% % Answer to question 4
% 
% 
% k=place(A,B,[-1-2j, -2, -1+2j]);
% Abar=A-B*k;
% sys2 = ss(Abar, B, C,D);
% x0 = [0.1 0 0]'; % Initial condition
% figure()
% initial(sys2,x0);
% % Answer to question 5
