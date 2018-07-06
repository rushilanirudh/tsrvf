% Feb 21-10
% compute the exterinsic mean of a set of projection matrix

function Pmean = extrinsicMean(Pt)
% Pt = tensor, each 2D matrix is a P

n = size(Pt,1);
Q = [eye(2) ,zeros(2,n-2);zeros(n-2,2) zeros(n-2)];
G = sum(Pt,3)/size(Pt,3);

[U,S,V] = svd(G);

Pmean = U * Q * U';