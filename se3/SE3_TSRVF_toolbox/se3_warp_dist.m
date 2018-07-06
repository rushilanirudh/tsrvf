function [ Epost ] = se3_warp_dist( p1,p2 )
%This function computes the best warped distance across a single trajectory
%on se(3). Different from se3_warp_dist_trajectory which computes distance
%across all joints. This is for one joint. 
%Input expected to be - 4 x 4 x T.
h1 = se3tolie_algebra(path_to_h_se3(p1));
h2 = se3tolie_algebra(path_to_h_se3(p2));
H1 = h1;
H2 = h2;

gam = DynamicProgrammingQ(H1,H2,0,0);
Reg_p2 = warp_with_gamma(p2,gam);
Reg_h2 = se3tolie_algebra(path_to_h_se3(Reg_p2));
Epost = distance_tsrvf_se3(h1,Reg_h2);
end