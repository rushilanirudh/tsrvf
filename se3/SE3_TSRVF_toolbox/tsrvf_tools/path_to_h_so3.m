function h = path_to_h_so3(p)


T = size(p,3);

h=zeros(3,3,T);

for i=1:T-1 
    vec = log_map_so3(p(:,:,i),p(:,:,i+1))';
    vecmat = vrrotvec2mat([vec/norm(vec);norm(vec)]);
    alphadot = p(:,:,i)'*vecmat;
    h(:,:,i)=alphadot;
    
end

alphadot = ParallelTransport_so3(p(:,:,T-1),h(:,:,T-1),p(:,:,T));
h(:,:,T) = alphadot;