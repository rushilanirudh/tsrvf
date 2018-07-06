function [gam,Final_E] = DynamicProgrammingQ_1(h1_SO,h1_R,h2_SO,h2_R,Rot1,Trans1,Rot2,Trans2)

N = size(h1_R,2);
M = size(h2_R,2);


Nbrs = [1 1; 1 2; 2 1; 2 3; 3 2; 1 3; 3 1; 1 4; 3 4; 4 3; 4 1; 1 5; 2 5; 3 5; 4 5; 5 4; 5 3; 5 2; 5 1; 1 6; 5 6; 6 5; 6 1];
%     1 7;2 7;3 7;4 7;5 7;6 7;7 6;7 5;7 4;7 3;7 2;7 1;1 8;3 8;5 8;7 8;8 7;8 5;8 3;8 1];

CandE = zeros(size(Nbrs,1),1);
E = zeros(N,N);
Path = zeros(N,N,2);
E(1,:) = inf;
E(:,1) = inf;

E1=0;
vec1=h1_R(:,1)-h2_R(:,1);
vec2=h1_SO(:,:,1)-ParallelTransport_so3(Rot2(:,:,1),h2_SO(:,:,1),Rot1(:,:,1));
E1 = E1 + trace(vec2'*vec2)+vec1'*vec1;
E(1,1) = E1/N;


for i=2:N
    for j=2:N
        for Num = 1:size(Nbrs,1)
            k = i - Nbrs(Num,1);
            l = j - Nbrs(Num,2);
            if (k > 0 && l > 0)
                CandE(Num) = E(k,l) + CostFn2_1(h1_SO,h1_R,h2_SO,h2_R,Rot1,Trans1,Rot2,Trans2,k,l,i,j,N);
            else
                CandE(Num) = 100000;
            end
        end
        [E(i,j),idx] = min(CandE);
        Path(i,j,1) = i - Nbrs(idx,1);
        Path(i,j,2) = j - Nbrs(idx,2);

    end
end

Final_E=sqrt(E(N,N));

% Displaying the energies and the minimum path
clear x; clear y;
x(1) = N; y(1) = N;
cnt = 1;
while x > 1
    y(cnt+1) = Path(y(cnt),x(cnt),1);
    x(cnt+1) = Path(y(cnt),x(cnt),2);
    cnt = cnt + 1;
end

[x,idx] = sort(x);
y = y(idx);

yy = zeros(1,N);
for i=1:N
    F = abs(i - x);
    [~,idx] = min(F);
    if x(idx) == i
        yy(i) = y(idx);
    else
        if x(idx) > i
            a = x(idx) -i;      
            b = i - x(idx-1);
            yy(i) = (a*y(idx-1) + b*y(idx))/(a+b);
        else
            a = i - x(idx);
            b = x(idx+1) - i;
            yy(i) = (a*y(idx+1) + b*y(idx))/(a+b);
        end
    end
end

% gam = round((yy-1)*(M-1)/(N-1))+1;
gam = (yy)/(N);
gam=(gam-gam(1))/(gam(end)-gam(1));



