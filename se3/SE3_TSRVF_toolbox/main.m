%%main

clc
addpath('se3_tools');
addpath('tsrvf_tools');
data = load('Florence3D/se3_actions_dataset.mat');
parpool local
ITER = 1;
%%computing the mean trajectory also aligns all of them
[mu,Reg_S] = se3_sequence_mean_combined_joints(data.se3_interp,ITER);