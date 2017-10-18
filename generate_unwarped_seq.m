function out = generate_unwarped_seq(seq,cT)
N = length(seq);
seq_out = cell(1,N);
K = 40;
idx = sort(randperm(K,cT));


for i = 1:N
    x = rand(1);
    if x<0.5
        s = sample_frame_rate({seq{i}(1:40)},1);
    elseif x>=0.5
        s = sample_frame_rate({seq{i}([1:3,24:60])},1);
    end
     seq_out{i} = s{1}(idx);
end
out = seq_out;