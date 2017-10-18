function [R S] = PCADistortionVisual(V,mu,act_idx)
%load('Warped_Sequences.mat')
%Reg_S = seqs_warp;
%mu = unwarped_mean(Reg_S,20);

[w pc ev] = princomp(V);
count = 1;
for i = [20]
    count
    w_econ = w(:,1:i);
    z = squareform(pdist(w_econ));
    %R(count) = recog_expt(z);
    pc_econ = pc(:,1:i);
    x_econ = pc_econ*w_econ';
    a1 = x_econ(:,act_idx);
    A1 = reshape(a1,196,20);
    S{count} = findS2_from_S1_A_seq(mu,A1);
    count = count+1;
end
%plot([1 4 7 20],R);
S{count} = seqs_warp{act_idx};
R = 0;
Sp = sample_sequence(S,2);
viz_trajectory(Sp)
