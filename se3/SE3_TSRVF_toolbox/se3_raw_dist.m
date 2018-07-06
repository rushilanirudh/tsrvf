function [ Epre ] = se3_raw_dist( p1,p2 )
%computes distance between two 4 x 4 x T sequences without any warping. 
h1 = se3tolie_algebra(path_to_h_se3(p1));
h2 = se3tolie_algebra(path_to_h_se3(p2));
gam = DynamicProgrammingQ(H1,H_mu,0,0);


% gam = DynamicProgrammingQ(H1,H2,0,0);
% Reg_p2 = warp_with_gamma(p2,gam);
% Reg_h2 = se3tolie_algebra(path_to_h_se3(Reg_p2));
Epre = distance_tsrvf_se3(h1,h2);
end