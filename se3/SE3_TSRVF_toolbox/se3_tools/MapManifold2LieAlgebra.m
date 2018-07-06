function out = MapManifold2LieAlgebra(reg_seq)
N= length(reg_seq);
J = length(reg_seq{1});
T = size(reg_seq{1}{1},3);
for i = 1:N
    i
    for t= 1:T
        for j = 1:J
        V(:,j) = log_map_se3(eye(4),reg_seq{i}{j}(:,:,t));
        end
        L(:,t) = V(:);
    end
    WS{i} = L;
end
out = WS;