function [p_hat,theta] = distort_shape_grassmann(p,THETA_MAX)

%p is a trajectory
T = length(p);
M2 = p{1}*p{1}';
theta = 0+THETA_MAX*rand(1,T);

for i = 1:T
    M1 = p{i}*p{i}';
    [u1,a1]= phi_inv(M1);
    %[A1,alphadot] = findVelocity_A_P1toP2(M1,M2);
    A1 = randn(2,98);
    tmp1 = findP2_from_P1_A(M1,A1,u1,theta(i));
    [um,M] = phi_inv(tmp1);
    p_hat{i} = M;    
end

end
