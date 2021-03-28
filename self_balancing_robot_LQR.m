M = 1;    % mass of the chassis  
m = 0.2;  % mass of the wheels and shaft
b = 0.1;  % estimate of viscous friction coefficient (N-m-s)
I = 0.0005;% moment of inertia of the pendulum
g = 9.8;  %acceleration due to gravity (m/s^2)
l = 0.125;  %length to pendulum center of mass

p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];
B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];
C = [1 0 0 0;
     0 0 1 0];
D = [0;
     0];


Q = [1     0     0     0
     0     0     0     0
     0     0     1     0
     0     0     0     0]
 
R = 1;

K = lqr(A,B,Q,R)
