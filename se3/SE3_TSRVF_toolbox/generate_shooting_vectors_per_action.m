clc
%clear
dataset = {'Florence3D','UTKinect','MSRActions3D'};
dataset_ind = 1;
%load(fullfile(dataset{dataset_ind},'MSR_may15.mat'));
%mu = avgseq;
%reg_seq = reg_seq;
N = length(reg_seq);
K = length(mu);

for j = 1:N

     tic
    for k = 1:K 
    avg = mu{k};
    Reg_S = reg_seq{j}{k};
    tmp(:,k) = get_se3_shooting_features_per_action(avg,Reg_S);
    end
    V(:,j) = tmp(:);
       toc
end
       
save(fullfile(dataset{dataset_ind},'ShootingVectors_05152015.mat'),'V');