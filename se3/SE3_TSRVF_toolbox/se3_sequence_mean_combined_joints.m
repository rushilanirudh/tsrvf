function [mu_out,Reg_S_out,WarpGamma] = se3_sequence_mean_combined_joints(S,ITER)
%%S is a 1xN cell which contains N sequences of points on the
%%Grassmannian
%%ITER - max number of iterations if no convergence criterion is met
N = length(S);
mu = S{randi(N,1)}; %initialize
K = length(S{1});
for i = 1:ITER
    i
    H_mu = Combine_joint_seq_H(mu);
    
    parfor j = 1:N
        tic
        H1 = Combine_joint_seq_H(S{j});
        gam = DynamicProgrammingQ(H1,H_mu,0,0);
        for k = 1:K
            Reg_S{j}{k} = warp_with_gamma(S{j}{k},gam);
            
        end
        toc
    end
    
    mu = unwarped_sequence_mean(Reg_S);
end
mu_out = mu;
Reg_S_out = Reg_S;
end