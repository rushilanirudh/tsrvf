function out = compute_grassmann_mean(samples,tau,n_iter)
% samples: cell of size N, each cell had the [x,y] component of one shape
%tau: weigting factor must be an array size of samples

N = length(samples);
[n,k] = size(samples{1});

rand_init = round(1 + (N-1)*rand(1));
mu = samples{rand_init};
%mu = samples{1};

count = 1;
while( count <=n_iter)
    sum_vel = 0;

    cost = 0;
    for i = 1:length(samples)
        cur_sample = samples{i};
        cur_vel = compute_velocity_grassmann_efficient(mu,cur_sample);
        sum_vel = sum_vel + tau(i)*cur_vel;
        cost = cost + sum(cur_vel(:).^2);
    end

    cost;
    
    %%%% Now move mu in the direction of sum

    [U2,theta,U1] = svds(sum_vel,k);
    thetas = diag(theta);
    if N==2
        cur_t = 0.1;
    else
    cur_t = 0.1*(1/N);
    end

    gamma = diag(cos(cur_t*thetas));
    sigma = diag(sin(cur_t*thetas));

    new_mat = [U1*gamma;-U2*sigma];

    %%%Now apply orthogonal completion Q of mu to new_mat
%     S0 = mu;
%     S1 = new_mat;
%     S0_1 = mu(1:k,1:k);
%     S0_2 = mu(k+1:end,:);
% 
%     S1_1 = new_mat(1:k,:);
%     S1_2 = new_mat(k+1:end,:);
% 
%     I_k = eye(k);
%     Z = [S1'*S0 - S1_1']*inv(I_k - S0_1');
%     temp = [S0'*S1; S1_2 - S0_2*Z'];
% 

    [Q,R] = qr(mu);
    temp = Q*new_mat*U1';
    
    new_mu = temp;
    
    %stiefel_procrustes_distance(mu,new_mu)
    mu = new_mu;
    count = count + 1;
    
end
out = mu;

return;

