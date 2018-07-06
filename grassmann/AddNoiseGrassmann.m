function out = AddNoiseGrassmann(seq,THETA_MAX)
N = length(seq);
T = length(seq{1});

parfor n = 1:N
    
    seq_new{n} = distort_shape_grassmann(seq{n},THETA_MAX);
    
end
out = seq_new;
