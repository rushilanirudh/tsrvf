function [labels,Exemplars] = sequence_kmeans_grassmann(seqs,N_clusters,max_iter)
%%'points/seqs'  is a cell of sequences which needs to be clustered
points = seqs;
Npts = length(points);
load('avg_shape.mat');

rand_pts = randperm(Npts);

clust_idx = rand_pts(1:N_clusters);
dist_Mat = zeros(Npts,N_clusters);

clust_centers = points([clust_idx]);
labels = [];
cur_iter = 1;
eps=1.0000e-007;
while(cur_iter <=max_iter)
    
    %%%%% Assign each point to a cluster
    for i = 1:Npts
        
        clust_dists = zeros(1,N_clusters);
        
        for j = 1:N_clusters
            clust_dists(j) = Grassmann_warp_dist(points{i},clust_centers{j},C);
            
        end
        
        closest = find(clust_dists == min(clust_dists));
        
        labels(i) = closest;
        
    end
    
    
    %%%%% Compute clustering cost
    
    
%     for i = 1:N_clusters
%         
%         clust_members = find(labels == i);
%         
%         clust_points = points([clust_members]);
%         temp = 0;
%         
%         
%         for j = 1:length(clust_points)
%             
%             %temp  = temp + subspace_angles(clust_centers{i},clust_points{j});
%             temp  = temp + Grassmann_warp_dist(clust_centers{i},clust_points{j},C);
%         end
%         
%         
%         cost = cost + temp;
%         
%     end
%     cc(cur_iter)=cost;
%     cost
    %%%%%% Now recompute cluster centers
    
    n_iter_karcher = 10;
    
    for i = 1:N_clusters
        
        clust_members = find(labels == i);
        
        clust_points = points([clust_members]);
        
        if(length(clust_points) == 0)
            rand_pt_idx = round(1 + (length(points) - 1) *rand(1));
            clust_center = points{rand_pt_idx};
        else
            %clust_center = compute_grassmann_mean(clust_points,n_iter_karcher);
            clust_center = grassmann_sequence_mean(clust_points,C,5);
        end
        
        clust_centers{i} = clust_center;
    end
    
    cur_iter = cur_iter + 1
    %disp('Iteration %d',cur_iter);
    
end

for m = 1:N_clusters
    for n = 1:Npts
        dist_Mat(m,n) = Grassmann_warp_dist(points{n},clust_centers{m},C);
    end
    [val loc] = min(dist_Mat(m,:));
    Exemplars{m} = seqs{loc};
end
end
