function out = grass_seq_weighted_mean(S,tau,c,ITER)
%%S is a 1xN cell which contains N sequences of points on the
%%Grassmannian
%%ITER - max number of iterations if no convergence criterion is met
%%weighted mean for TWO SEQUENCES, weights specified by 'tau'
N = length(S);
[k,n] = size(c);
mu = S{1}; %initialize
K = length(mu);
h_bar = zeros(k*k,K,N);
if N~=2
    error('Cannot perform weighted mean for more than two sequences');
end

for i = 1:ITER
    h_mu = path_to_h_Grassmann(mu,c);
    H_mu = cell2mat(cellfun(@(x) x(:),h_mu,'UniformOutput', false));
    %i
    for j = 1:N
        %mu_tmp{j} = S{j}{1};
        h{j} = path_to_h_Grassmann(S{j},c);
        H1 = cell2mat(cellfun(@(x) x(:),h{j},'UniformOutput', false));
        gam = DynamicProgrammingQ(H1,H_mu,0,0);
        Reg_S{j} = warp_with_gamma(S{j},gam);
        Reg_h{j} = path_to_h_Grassmann(Reg_S{j},c);
        % hbar(:,:,j) = cell2mat(cellfun(@(x) tau(j)*x(:),Reg_h{j},'UniformOutput', false));
        
    end
    % tmp = sum(hbar,3);
    %   tmp2 = num2cell(tmp,1);
    %  h_bar = cellfun(@(x) reshape(x,100,100),tmp2,'UniformOutput', false);
    %  mu_i = compute_grassmann_mean(mu_tmp,ones(1,N),10);
    %  mu = inverse_tsrvf(h_bar,c*c',mu_i);
    mu = unwarped_weighted_mean(Reg_S,tau,ITER);
end
out = mu;
end