function covM = compute_grassmann_std(sample,mu)
% find the cov of the points on Grassmann, having the mean
% sample is a cell

tanV = zeros(length(sample),(size(mu,1)-size(mu,2))*size(mu,2));
for i = 1:length(sample)
    
    Y = sample{i};
    A = compute_velocity_grassmann_efficient(mu,Y);
    tanV(i,:) = A(:);
    %sum = sum + A*A';
end

covM = diag(cov(tanV));