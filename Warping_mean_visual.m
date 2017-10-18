function s = Warping_mean_visual(p1,p2,c)
h1 = path_to_h_Grassmann(p1,c);
h2 = path_to_h_Grassmann(p2,c);
Epre = calc_dist_tangent(h1,h2);

H1 = cell2mat(cellfun(@(x) x(:),h1,'UniformOutput', false));
H2 = cell2mat(cellfun(@(x) x(:),h2,'UniformOutput', false));
gam = DynamicProgrammingQ(H1,H2,0,0);
Reg_p2 = warp_with_gamma(p2,gam);
Reg_h2 = path_to_h_Grassmann(Reg_p2,c);
s{2} = p1;
s{1} = p2;
s{3} = Reg_p2;
s{5} = unwarped_mean(s(1:2),10);s{4} = unwarped_mean(s(2:3),10);
viz_trajectory(s)