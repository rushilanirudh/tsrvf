function [h1,h1_so3,h1_r,p1_so3,p1_r] = path_to_h_se3(p1)
T = size(p1,3);
h1 = zeros(4,4,T);
p1_so3 = p1(1:3,1:3,:);
p1_r = squeeze(p1(1:3,4,:));
h1_so3 = path_to_h_so3(p1_so3);
h1_r = path_to_h_r(p1_r); 
h1(1:3,1:3,:) = h1_so3;
h1(1:3,4,:) = h1_r;

end
