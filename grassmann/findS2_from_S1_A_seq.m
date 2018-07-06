function out = findS2_from_S1_A_seq(mu,A)
%%mu is the average sequence
%%A is the tangent bundle

for i = 1:length(mu)
    p1 = mu{i}*mu{i}';
    [u1 a1]= phi_inv(p1);
    v = reshape(A(:,i),2,98);
    tmp1 = findP2_from_P1_A(p1,v,u1,1);
    [um M] = phi_inv(tmp1);
    S2{i} = M;
end
out = S2;
S{1} = mu;
S{2} = S2;
%viz_trajectory(S)