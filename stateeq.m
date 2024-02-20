%% 
% *制御対象*

A=[0 1 0;0 0 1;-2 -3 -1],B=[0;0;1],C=[2 1 1]
%% 
% 可制御性行列Ucとそのランク

Uc=[B,A*B,A^2*B], rank(Uc)
%% 
% 可観測性行列Uoとそのランク

Uo=[C;C*A;C*A^2], rank(Uo)
%% 
% システムの固有値（極）

eig(A)
%% 
% インパルス応答

sys0 = ss(A,B,C,0);
impulse(sys0,10)
%% 
% *極配置*

p1 =-8.88
p2 = -10.6
p3 = -35.6
p = [p1,p2,p3];
K1 = place(A,B,p)
sys1 = ss(A-B*K1,B,C,0);
impulse(sys1,10)
%% 
% *最適レギュレータ*

Q = 10*eye(3);
R = 9.2;
K2 = lqr(sys0,Q,R)
sys2 = ss(A-B*K2,B,C,0);
impulse(sys2,10)