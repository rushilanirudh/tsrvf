function mu = unwarped_mean(S)
N = length(S);
K = size(S{1},3);

for j = 1:K
    for i = 1:N
        tmp(:,:,i) = S{i}(:,:,j);
    end
    mu(:,:,j) = SE3_mean(tmp);
end
out = mu;
end