% Feb 24-10
% find velocity X, from Q to given P

function [A,X] = findVelocity_A_QtoP(Q,P)

B = Q - P;

[W,D] = eig(B);
W = real(W);
D = real(D);

eig_values = diag(D);
temp = abs(eig_values);
temp(temp<1e-5)=0;
eig_values(temp==0)=0;

% D must be in the format diag(a,-a,b,-b,.,0,0..);
[sEig,Ind]=sort(eig_values,'descend');
W = W(:,Ind);
i=1;  Ind = []; 
n = length(temp); 
while (sEig(i)>0)
    Ind=[Ind,i,n-i+1];
    i=i+1;
end
Ind=[Ind i:n-i+1];
W = W(:,Ind);
D = diag(sEig(Ind));
eig_values = diag(D);

omega = zeros(size(D));
omega_tild = eye(size(D));
for i=1:2:nnz(temp)
    
    r1 = eig_values(i);
    r2 = eig_values(i+1);
      
    if (r1+r2 < 1e-6) % must be otherwise sth is wrong (r1=-r2)
        lambda = abs(r1);
        replacement1 = [0 -asin(lambda) ; asin(lambda) 0];
        replacement2 = [sqrt(1-lambda^2) -lambda ; lambda sqrt(1-lambda^2)];
        
        % fix Q.wj
        c = W(1,i+1)/W(1,i);
        c_tild = c/abs(c);
        W(:,i) = c_tild*W(:,i);
    else
        disp('ERROR')
        return;
    end
    
    omega(i:i+1,i:i+1) = replacement1;
    omega_tild(i:i+1,i:i+1) = replacement2;
    
end

X = W*omega*W'; 
X(abs(X)<1e-5)=0;
A = X(1:2,3:end);
% for check: expm(X) =  W*omega_tild*W';
