% Feb 23-10
% compute velocity matrix, A, between two subspace having projeciton
% matrices ans subspaces representation
% [A,X] = findVelocity_A_P1toP2(P1, P2, Q)

function [A,X] = findVelocity_A_P1toP2(P1, P2)
% P1 = U.Q.U'

n = size(P1,1);
Q = [eye(2), zeros(2,n-2);zeros(n-2,2) zeros(n-2)]; % Q is fixed for the entire program

%[U,Y] = phi_inv(P1);
[U,uu,vv] = svd(P1);

P = U'*P2*U;

[A,X] = findVelocity_A_QtoP (Q,P);

