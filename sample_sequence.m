function out = sample_sequence(p,m)
N = length(p);
if m>length(p{1})
    m = length(p{1});
end
for i = 1:N
    p_new{i} = p{i}(1:m)';
end
out = p_new;