function pca2Shape(p,mu,coeff)
d = length(p);
A1 = reshape(coeff(:,1:d)*(p),196,20);
S = findS2_from_S1_A_seq(mu,A1);
seq{1} = cell(S);
h_seq = figure('Position',[420   558   900   200]);
viz_trajectory(seq);
end
