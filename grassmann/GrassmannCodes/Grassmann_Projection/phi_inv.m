% Feb 24-10
% function phi: SO(3)-->P
% phi(U) = UQU'
% [U,Y] = phi_inv(P)

function [U,Y] = phi_inv(P)
% P = U.Q.U'
n = size(P,1);

if (0)
    colSpc = rref(P);
    tmp = eye(size(P));
    flag = (colSpc == repmat(tmp(:,1),1,size(P,2)));
    ind1 = find(sum(flag,1)==size(P,2));
    
    flag = (colSpc == repmat(tmp(:,2),1,size(P,2)));
    ind2 = find(sum(flag,1)==size(P,2));
    Y1 = P(:,[ind1,ind2]);
else
    Y1 = P(:,[1,2]);
end    


[Y,uu,vv] = svd(Y1,'econ');


[U,uu,vv] = svd(P);

%U = [Y,rand(n,n-2)]; ---> bad-bad-bad-bad
%[U,R] = qr(U);