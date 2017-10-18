function p  = arbitrary_sample(S,K)
N = length(S);
mu = length(S{1})-K-10;
if mu<0
    mu = 0;
end
%lens = round(K+10+mu*rand(1,N));
lens = length(S{1});
for i = 1:N
    
    s = S{i};
    %e = lens(i);
    e = lens;
    idx = sort(randperm(e,K));
    if idx(1) ~= 1
        idx(1) = 1;
    end
    p{i} = s(idx);
   % viz_trajectory({s(idx)})
   % pause(0.1)
    
end