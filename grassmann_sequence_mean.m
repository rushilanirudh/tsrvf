function [mu_out,Reg_S_out,error] = grassmann_sequence_mean(S,c,ITER)
%%S is a 1xN cell which contains N sequences of points on the
%%Grassmannian
%%ITER - max number of iterations if no convergence criterion is met
N = length(S);
[k,n] = size(c);
mu = S{randi(N,1)}; %initialize
K = length(mu);
h_bar = zeros(k*k,K,N);
for i = 1:ITER
    
    tic
    h_mu = path_to_h_Grassmann(mu,c);
    H_mu = cell2mat(cellfun(@(x) x(:),h_mu,'UniformOutput', false));
    
    for j = 1:N
        h{j} = path_to_h_Grassmann(S{j},c);
        H1 = cell2mat(cellfun(@(x) x(:),h{j},'UniformOutput', false));
        gam = DynamicProgrammingQ(H_mu,H1,0,0);
        Reg_S{j} = warp_with_gamma(S{j},gam);
        j;
        
    end
    mu = unwarped_mean(Reg_S,20);
    error(i) = WarpError(mu,Reg_S);
    disp(error(i))
    
    
    %       [V,~] = ShootingVectorPCA(Reg_S,mu);
    %       [pc,w,ev] = pca(V');
    %       acc(i) = recog_expt(squareform(pdist(w(:,1:10))),10,10);
    
    toc
end
mu_out = mu;
Reg_S_out = Reg_S;
end