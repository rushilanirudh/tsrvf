function out = exp_map_grassmann(X,delta)
[~,k] = size(X);
%%Exponential map using the point X in the direction of delta.

   [U2,theta,U1] = svds(delta,k);
    thetas = diag(theta);
    %cur_t = 0.1*(1/N);
    cur_t = 1;

    gamma = diag(cos(cur_t*thetas));
    sigma = diag(sin(cur_t*thetas));

    new_mat = [U1*gamma;-U2*sigma];

    %%%Now apply orthogonal completion Q of mu to new_mat
    S0 = X;
    S1 = new_mat;
    S0_1 = X(1:k,1:k);
    S0_2 = X(k+1:end,:);

    S1_1 = new_mat(1:k,:);
    S1_2 = new_mat(k+1:end,:);



    I_k = eye(k);
    Z = [S1'*S0 - S1_1']*inv(I_k - S0_1');
    temp = [S0'*S1; S1_2 - S0_2*Z'];

    out = temp;
