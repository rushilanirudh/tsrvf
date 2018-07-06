function Mu_extrinsic = compute_extrinsic_grassmann_mean(clust_points)
 
 
 N_pts = length(clust_points);
 
 [m,n] = size(clust_points{1});
 Mu = 0;
 for i = 1:N_pts
     
     P = clust_points{i};
     
     Mu = Mu + P*P';
 end
 
 Mu = Mu/N_pts; %%%% vector space mean
 
 %%%% Project it to manifold
 
 [U,S,V] = svds(Mu,n);
 
 Mu_extrinsic = U;
 
 return;
 
 