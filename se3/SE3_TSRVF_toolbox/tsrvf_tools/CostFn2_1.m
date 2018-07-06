function E = CostFn2_1(h1_SO,h1_R,h2_SO,h2_R,Rot1,Trans1,Rot2,Trans2,k,l,i,j,N)


% M = size(q2L,2);
% 
% x = [k:1:i];
% m = (j-l)/(i-k);
% y = (x-k)*m + l;
% 
% idx = round(y*M/N);
% vec = sqrt(m)*q2L(:,idx);
% 
% E = norm(q1(:,x) - vec,'fro')^2/N;
M = size(h2_R,2);
E=0;
for x=(k+1):1:i
    m = (j-l)/(i-k);
    y = (x-k)*m + l;
    idx = round((y-1)*(M-1)/(N-1))+1;
    vec1=h1_R(:,x)-h2_R(:,idx)*sqrt(m);
%     vec2=h1_SO(:,:,x)-ParallelTransport(Rot2(:,:,idx),h2_SO(:,:,idx)*sqrt(m),Rot1(:,:,x));
    vec2=Rot1(:,:,x)'*h1_SO(:,:,x)-Rot2(:,:,idx)'*h2_SO(:,:,idx)*sqrt(m);
    E = E + trace(vec2'*vec2)+vec1'*vec1;
end
E=E/N;
