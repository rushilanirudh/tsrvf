function [centers,S] = kmeans_sequence_warp(S,K,ITER)
N = length(S);
clus_idx = randi(N,[1,K]);
centers = S(clus_idx);
%%initialization
load('avg_shape.mat');

for j = 1:ITER
    cost = 0;

    for i = 1:N
        for k = 1:K
            dis(k) = GrassSeqDist(S{i},centers{k});
        end
        [~,id] = min(dis);
        clus_id(i) = id(1);
    end
    %%update step
    
    for m = 1:N
        cost = cost+ GrassSeqDist(S{m},centers{clus_id(m)});
    end
    cc(j) = cost;
    sprintf('clustering cost: %.2f',cost)
    plot(cc)
    pause(0.00001)
    hold on;
    
    for k = 1:K
        ids = find(clus_id == k);
        cluster = S(ids);
        [mu,Reg_S] = grassmann_sequence_mean(cluster,C,10);
        if isempty(cluster)
            cluster{1} = S{randi(N,1)};
        end
       % mu = unwarped_mean(cluster,10);
        centers{k} = mu';
        S(ids) = Reg_S;
    end
    
end
