function R = KSVDDistortionVisual(V)
load('Warped_Sequences.mat')
params.data = V;
params.Tdata = 3;
params.iternum = 50;
params.memusage = 'high';
count = 1;
for i = [1 2 7 10 15 25]
params.dictsize = i;
[Dksvd,g,err] = ksvd(params,'');
z = squareform(pdist(g'));
R(count) = sum(diag(recog_expt(z,10,10)));
count = count+1
end
%a1 = V_hat(:,act_idx);
%A1 = reshape(a1,196,20);
%S{1} = findS2_from_S1_A_seq(mu,A1);
%S{2} = seqs_warp{act_idx};
%Sp = sample_sequence(S,2);
%viz_trajectory(Sp)
