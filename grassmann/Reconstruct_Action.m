function Reconstruct_Action(mu,V)

N = size(V,2);
for n = 1:N
A = reshape(V(:,n),196,20);
S1 = findS2_from_S1_A_seq(mu,A);
S{n} = S1;
end
viz_trajectory(S);