function out = get_se3_shooting_features_per_action(nominal_features,warped_features)
Reg_S = warped_features;
mu = nominal_features;
N = length(Reg_S);% number of sequences
T = size(mu,3);

for t = 1:T
        p1 = mu(:,:,t);
        p2 = Reg_S(:,:,t);
       tmp(:,t) = log_map_se3(p1,p2)';
       %tmp(:,t) = vi;
end
%[tmp2] =  get_fourier_coeffs_pyramid(tmp,T);
%out = tmp2(:);
out = tmp(:);