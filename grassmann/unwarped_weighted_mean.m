function out = unwarped_weighted_mean(S,tau,ITER)

N = length(S);
K = length(S{1});
for j = 1:K
    for i = 1:N
        tmp{i} = S{i}{j};
    end
    mu{j} = compute_grassmann_mean(tmp,tau,ITER);
end
out = mu;
end