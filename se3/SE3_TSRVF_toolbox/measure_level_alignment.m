function rho =  measure_level_alignment(mu,reg_s)

J = length(mu);
T = size(mu,3);
N = length(reg_s);

for i = 1:N
V{i} = get_se3_shooting_features_per_action(mu,reg_s{i});
end


for t = 1:T
    K = zeros(6,6);
    for n = 1:N
        v = V{n}(:,t);
        K = K + 1/(N-1)*v*v';
    end    
    rho(t) = real(trace(K));
end
%plot(rho)