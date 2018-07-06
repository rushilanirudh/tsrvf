function h= path_to_h_r(p)

[n,T]= size(p);

h=zeros(n,T);

for i=1:T-1 
    alphadot=T*(p(:,i+1)-p(:,i));
    if norm(norm(alphadot,2))>0.0001
        h(:,i)=alphadot/sqrt(  sqrt(3)* norm(alphadot,2)  );%phi=sqrt(3)
%     else
%         h(:,i)=[0;0];
    end
end

h(:,T) = h(:,T-1);