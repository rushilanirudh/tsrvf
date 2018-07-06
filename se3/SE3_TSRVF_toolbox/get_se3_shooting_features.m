function out = get_se3_shooting_features(nominal_features,warped_features)
Reg_S = warped_features;
mu = nominal_features;
N = length(Reg_S);% number of sequences
T = size(mu,3);
for i = 1:N
    for t = 1:T
        p1 = mu(:,:,t);
       % p1 = eye(4,4);
        p2 = Reg_S{i}(:,:,t);
        v = log_map_se3(p1,p2)';
        tmp(:,t) = v;
    end
    V{i} = tmp;
end
%[tmp2] = generate_fourier_features(V);
%out = tmp2(:);
out = V;