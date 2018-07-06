%clc
clear
%cT = [30:2:40];
%cT = 0:0.2:1;
cT = 15:5:40;

load('UMD_Actions_data.mat');
THETA_MAX = 1;
ITER = 20;
load('avg_shape.mat');
max_iter = 1;
%seqs = sample_frame_rate(seqs,4);
for iter = 1:max_iter
    disp(iter)
    rng(iter);
    for i = 1:length(cT)
        %Reg_S = generate_unwarped_seq(data_split,cT(i));
        S = generate_unwarped_seq(data_split,cT(i));
        filename = sprintf('revision/tsrvf/UMD_FR_%.2d_%.2d.mat',cT(i),iter);
        
        disp('generated new sequence')
        
        %[mu,S] = grassmann_sequence_mean(Reg_S,C,ITER);
        mu = unwarped_mean(S,ITER);
        [V,~] = ShootingVectorPCA(S,mu);
        [pc,w,ev] = pca(V');
        rec_acc(iter,i) = recog_expt(squareform(pdist(w(:,1:15))),10,10);
        save(filename,'rec_acc','S','mu');
    end
    
end
