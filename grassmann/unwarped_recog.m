%clc
clear
cT = 30;
%cT = 0:0.1:1;
%cT = 1:10;
load('UMD_actions_data.mat')

load('avg_shape.mat');
max_iter = 1;
Reg_S = sample_frame_rate(data_split,2);
for iter = 1:max_iter
    iter
    rng(iter)
    for i = 1:length(cT)
        %Reg_S = arbitrary_sample(data_split,cT(i));
        % seqs = sample_frame_rate(seqs,2);
        %Reg_S = generate_unwarped_seq(data_split,cT(i));
        disp('Generated Arbitrary Sequence')
        % Reg_S = sample_frame_rate(seqs,cT(i));
        %filename = sprintf('revision/UMD_FR_rfpca_%.2d.mat',cT(i));
        %load(filename);
        %Reg_S = AddNoiseGrassmann(seqs,cT(i));
        %seqs = load(filename);
        acc = overnight_batch(Reg_S);
        filename = sprintf('revision/tsrvf3/UMD_original_FR_%.2d_%.2d.mat',cT(i),iter);
        save(filename,'acc','Reg_S');
    end
    
end
