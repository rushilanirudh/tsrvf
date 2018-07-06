function out = sample_frame_rate(p,m)
N = length(p);

for i = 1:N
    p_new{i} = p{i}(1:m:end);
end
out = p_new;