function out = unwarped_mean(S,ITER)

N = length(S);
K = length(S{1});
for j = 1:K
    for i = 1:N
        tmp{i} = S{i}{j};
    end
    mu{j} = compute_grassmann_mean(tmp,ones(1,N),ITER);
end
out = mu;
end