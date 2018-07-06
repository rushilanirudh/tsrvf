% Feb 21-10
% Given point P1 and velocity A, find point P2 reached in unit time by
% following a geodesic starting at P1 and having velocity A
% input: P1,A,U (can be tensors) where and Q is the identity component on
% Projection group
% P2 = findP2_from_P1_A(P1, A, U, t)
% inputs can be a batch of matrices in tensor format
% p2 = U*expm(tX)*U'*P1*U*expm(tX')*U';

function P2 = findP2_from_P1_A(P1, A, U, t)


n = size(A,2)+2;
for i = 1: size(A,3)    
    
    A_1 = A(:,:,i);
    U_1= U(:,:,i);
    P_1 = P1(:,:,i);
    
    X = [zeros(2) , A_1 ;
         -A_1' zeros(n-2)];
    
    V = U_1*expm(t*X)*U_1';
    
    P2(:,:,i) = V*P_1*V'; 
    
end
  
        


