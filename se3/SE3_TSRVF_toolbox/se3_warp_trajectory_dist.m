function [ Epost ] = se3_warp_trajectory_dist( p1,p2 )
%%for any two trajectories on se(3)x se(3)x se(3)..x se(3), this function
%%will align them and compute the best distance between them. 
h1 = Combine_joint_seq_H(p1);
h2 = Combine_joint_seq_H(p2);
K = length(p1);

gam = DynamicProgrammingQ(h1,h2,0,0);
 for k = 1:K
            Reg_S{k} = warp_with_gamma(p1{k},gam);
            
 end
 
Reg_h2 = Combine_joint_seq_H(Reg_S);
Epost = distance_tsrvf_se3(h1,Reg_h2);
end