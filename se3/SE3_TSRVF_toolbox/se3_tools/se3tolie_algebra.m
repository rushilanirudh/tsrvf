function h = se3tolie_algebra(H)
T = size(H,3);
for i = 1:T
    tmp = H(:,:,i);
    vec = [tmp(2,3) tmp(1,3) -tmp(1,2) tmp(1,4) tmp(2,4) tmp(3,4)]';
    %vec = tmp(:);
    h(:,i) = vec;
end