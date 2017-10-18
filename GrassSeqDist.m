function out = GrassSeqDist(p1,p2)
N = length(p1);
for i = 1:N
    d(i) = log_map_norm(p1{i},p2{i});
end
out = 1/N*sum(d);
