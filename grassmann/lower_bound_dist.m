function [E_pre E_post E_dtw] =  lower_bound_dist()

load('UMD_Actions_data.mat');
load('avg_shape.mat');
%load avg_shape.mat  %%common point onto which all the TSRVFs are transported
%C = data{1};
k = 2;
m = 4;
idx = [1:k:10 21:k:30 31:k:40 41:k:50 51:k:60];
D = sample_sequence(data_split(idx),m);
N = size(D,2);
E_pre = zeros(N,N);
E_post = zeros(N,N);
E_post = zeros(N,N);
for i = 1:N
    for j = 1:i
        [E_post(i,j) E_pre(i,j)] = Grassmann_warp_dist(D{i},D{j},C);
        E_dtw(i,j) = dtw(D{i},D{j}); 
    end
    i
end
E_dtw = E_dtw+E_dtw';
E_post = E_post+E_post';
E_pre = E_pre+E_pre';
E_pre(E_pre<1e-10) = 0;
E_post(E_post<1e-10) = 0;
E_dtw(E_dtw<1e-10) = 0;
file_name = sprintf('DistMat_%d_%d.mat',m,k);
save(file_name,'E_dtw','E_post','E_pre');

end