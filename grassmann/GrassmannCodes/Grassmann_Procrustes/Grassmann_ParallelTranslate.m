function tB = Grassmann_ParallelTranslate(Y, B, A, t)
% Sep-21-10, by Sima
% Parallel translate of B, along the geodesic direction A, to time t
% where B and A are both tangent vector to the grassmann manifold at Y

% A_{n-p,p} = U_{n-p,p}S_{p,p}V'_{p,p}
% tB = ( [0_{n-p,p} I_{n-p,n-p}] [V 0] [-sin(tS)] U' + (I_{n-p,n-p}-UU'))*B
%                                [0 U] [ cos(tS)]

[n,p] = size(Y);

[U,S,V] = svds(A,p);

thetas = diag(S);

gamma = diag(cos(t*thetas));
sigma = diag(sin(t*thetas));

new_mat = [-V*sigma;U*gamma]; % new_mat(1:2,1:2) isnt important

tmp1 = [zeros(n-p,p) eye(n-p,n-p)]*new_mat*U' ;
tmp2 = eye(n-p,n-p) - U*U';

tB = (tmp1 + tmp2) * B;