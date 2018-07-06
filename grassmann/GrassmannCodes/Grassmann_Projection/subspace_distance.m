function out = subspace_distance(P1,P2,method)
% distancce between two subspaces

n = size(P1,1);
if strcmp(method,'angle')
    out = subspace(P1,P2);
elseif strcmp(method,'norm')    
    Q = [eye(2), zeros(2,n-2);zeros(n-2,2) zeros(n-2)];
    [A,X] = findVelocity_A_P1toP2(P1, P2);
    out = trace(X*X');
end
    