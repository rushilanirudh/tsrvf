function out = grassmann_farthest_neighbor(q,dat)
N = length(dat);
parfor i = 1:N
    tic
    d(i) = log_map_norm(q,dat{i});
    toc
end
[val,idx] = max(d);
out = dat(idx);