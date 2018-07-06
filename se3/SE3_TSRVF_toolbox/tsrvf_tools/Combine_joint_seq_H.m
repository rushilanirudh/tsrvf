function H = Combine_joint_seq_H(seqs)
N = length(seqs);
H = [];
for i = 1:N
    h{i} = se3tolie_algebra(path_to_h_se3(seqs{i}));
    H = [H;h{i}];
end