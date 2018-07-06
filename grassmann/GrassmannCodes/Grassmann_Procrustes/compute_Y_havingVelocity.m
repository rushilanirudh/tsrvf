function out = compute_Y_havingVelocity(Y0,A, t)
% moving along the geodesic starting from Y0, with direction A, get the
% output at time t


[n,k] = size(Y0);

%%%% Now move mu in the direction of A

[U2,theta,U1] = svds(A,k);
thetas = diag(theta);

gamma = diag(cos(t*thetas));
sigma = diag(sin(t*thetas));

new_mat = [U1*gamma;-U2*sigma];

%%%Now apply orthogonal completion Q of Y0 to new_mat
% S0 = Y0;
% S1 = new_mat;
% S0_1 = S0(1:k,1:k);
% S0_2 = S0(k+1:end,:);
% 
% S1_1 = S1(1:k,:);
% S1_2 = S1(k+1:end,:);
% 
% I_k = eye(k);
% %Z = [S1'*S0 - S1_1']*inv(I_k - S0_1');
% Z = [S1'*S0 - S1_1']/(I_k - S0_1');
% temp = [S0'*S1; S1_2 - S0_2*Z'];
% 
% out = temp*U1';


[Q_comp,R] = qr(Y0);

out = Q_comp*new_mat;

return;
