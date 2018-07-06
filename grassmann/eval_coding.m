function out = eval_coding(Gamma,D,mu)
F = full(Gamma);
A1 = squareform(pdist(F'));
C = recog_expt(A1,10,10);
out = sum(diag(C))/100;

Reconstruct_Action(mu,D)