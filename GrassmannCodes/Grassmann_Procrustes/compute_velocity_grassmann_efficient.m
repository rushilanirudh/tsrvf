function out = compute_velocity_grassmann_efficient(X1,X2)
%%% Takes subspace X1 to X2

[n,k] = size(X1);

S0 = X1;
S1 = X2;

S0_1 = S0(1:k,1:k);
S0_2 = S0(k+1:end,:);

S1_1 = S1(1:k,:);
S1_2 = S1(k+1:end,:);

I_k = eye(k);
%Z = inv(I_k - S0_1)*[S0'*S1 - S1_1];
Z = [I_k - S0_1]\[S0'*S1 - S1_1];
%Z = pinv([I_k - S0_1])*[S0'*S1 - S1_1];
temp = [S0'*S1; S1_2 - S0_2*Z]; 

%Qt = eye(n) - [S0_1 - I_k;S0_2]*pinv(I_k - S0_1)*[S0_1' - I_k,S0_2'];
%temp = Qt*S1;
%Qt*S0

X = temp(1:k,:);
Y = -temp(k+1:end,:);

[U1,U2,V,T,Sig] = gsvd(X,Y,0); %%% Thin CS decomposition


theta = acos(T);
theta = asin(Sig);

sinthetas = diag(Sig);

theta = diag(asin(sinthetas));

A = U2*theta*U1';

out = A;