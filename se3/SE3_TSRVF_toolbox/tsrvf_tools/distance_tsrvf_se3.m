function E = distance_tsrvf_se3(h1,h2)
%h1 is a point on the lie algebra, expected to be 6xT matrix
% T = size(h1,2);
% d = 0;
% for t = 1:T
%     d = d + h1(:,t)'*h2(:,t);
% end
% E = d;
% E = sqrt(E/T);
E = norm(h1(:) - h2(:));
T = size(h1,2);
E = sqrt(E/T);