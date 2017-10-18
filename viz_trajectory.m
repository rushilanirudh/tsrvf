function viz_trajectory(P)
K = length(P);
%N = length(P{1});
%n = ceil(sqrt(T));
load('Warped_Sequences.mat');
tmp = seqs_warp{1}{1};
del_true = max(tmp(:,1))-min(tmp(:,1));

count = 0;
for m = 1:K
    %s_short = sample_sequence(P(m),1);
    s_short = P(m);
    s = s_short{1};
    N = length(s);
    for i = 1:N
        x = s{i};
        del = 2*del_true/(max(x(:,1))-min(x(:,1)));
        
        count = count+1;
        subtightplot(K,N,count,[0.01 0.01], [0.01 0.01], [0.01 0.01]),plot(del*x(:,2),-del*x(:,1),'k','LineWidth',1.5);
        axis([-.5 .5 -.5 .5])
       % pause(0.1);
        axis off
    end
end
