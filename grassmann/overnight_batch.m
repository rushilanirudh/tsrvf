function out = overnight_batch(reg_s)

C_hat = load('avg_shape.mat');
%seqs = sample_frame_rate(reg_s,1);
seqs = reg_s;

for i = 1:100
    disp(i)
    for j = 1:i
        
        %D_w(i,j) = Grassmann_warp_dist(seqs{i},seqs{j},seqs{1}{1});
        
           D_w(i,j) = GrassSeqDist(seqs{i},seqs{j});
        
    end
    
end

out = recog_expt(D_w+D_w',10,10);

%save('unWarped_Distance_Matrix.mat','D_uw');