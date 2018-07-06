function [ sample_mean ] = SE3_mean( samples )
%SE3_MEAN Summary of this function goes here
%   Extrinsic mean of samples on SE3
N = size(samples,3);
x = zeros(1,6);

for i = 1:N
    vec = log_map_se3(eye(4),samples(:,:,i));
x = x + 1/N*vec;

end

sample_mean = exp_map_se3(eye(4),x);