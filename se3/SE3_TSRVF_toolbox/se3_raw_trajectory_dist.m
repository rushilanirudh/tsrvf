function [ Epre ] = se3_raw_trajectory_dist( p1,p2 )
%%for any two trajectories on se(3)x se(3)x se(3)..x se(3), this function
%%will align them and compute the best distance between them. 
h1 = Combine_joint_seq_H(p1);
h2 = Combine_joint_seq_H(p2);
K = length(p1); 
Epre = distance_tsrvf_se3(h1,h2);
end