
 function gamI = invertGamma(gam)

N = length(gam);
% x = [1:N]/N;
x=[1:N]/(N);

% xx=[1:N-1]/(N-1);
gamI=interp1(gam,x,x,'linear');
% gamI = spline(gam,x,x);
% idx=find(gamI>1);
% gamI(idx)=1;