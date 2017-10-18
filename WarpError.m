function err = WarpError(mu,seqs)
N = length(seqs);
d = 0;
for i = 1:N
    tmp =  GrassSeqDist(mu,seqs{i});
    d = d + tmp*tmp;
end
err = d;
