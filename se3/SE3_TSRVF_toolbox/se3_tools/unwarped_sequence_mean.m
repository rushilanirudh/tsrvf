function mu = unwarped_sequence_mean(seq)
N = length(seq);
J = length(seq{1});
T = size(seq{1}{1},3);

for j = 1:J
   
    for n = 1:N
        tmp{j}{n} = seq{n}{j};
    end
    mu{j} = unwarped_mean(tmp{j});
end

end