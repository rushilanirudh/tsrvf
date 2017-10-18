function out = Grassmann_warp_dist(p1,p2,c)
h1 = path_to_h_Grassmann(p1,c);
h2 = path_to_h_Grassmann(p2,c);
Epre = calc_dist_tangent(h1,h2);

%Epost = Epre;
% % % 
  H1 = cell2mat(cellfun(@(x) x(:),h1,'UniformOutput', false));
  H2 = cell2mat(cellfun(@(x) x(:),h2,'UniformOutput', false));
  gam = DynamicProgrammingQ(H2,H1,0,0);
  Reg_p2 = warp_with_gamma(p2,gam);
  Reg_h2 = path_to_h_Grassmann(Reg_p2,c);
  out = calc_dist_tangent(h1,Reg_h2);
end