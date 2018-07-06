function PCA_Space_To_Sequences()
d=2;

load('UMD_TangentBundle.mat')
tr_subject_ind = [1:5 11:15 21:25 31:35 41:45 51:55 61:65 71:75 81:85 91:95];
te_subject_ind = 1:100;
te_subject_ind(tr_subject_ind) = [];
[coeff score latent] = princomp(V(:,tr_subject_ind)','econ');
save('PCA_Basis.mat','coeff');
V_te = V(:,te_subject_ind);
Vpcate = coeff'*V;
close all
%d =2;
V_lowdim = Vpcate(1:d,:);
P = size(V_lowdim,2);
X = [];
for i = 1:P
    X = [X bsxfun(@plus,V_lowdim(:,i),0.0*rand(d,5))];% )V_lowdim(:,i)+0.1*randn(3,20)];
end

h=figure('Position',[30   58   860   820]);
az = -160;
el = 24;
view(az,el);
%figure('units','normalized','outerposition',[0 0 1 1])
%
if d ==3
    plot3(X(1,:),X(2,:),X(3,:),'ko','MarkerFace','g','MarkerSize',10);grid on;axis square
elseif d ==2
    plot(X(1,:),X(2,:),'ko','MarkerFace','g','MarkerSize',10);grid on;axis square
elseif d==1
    plot(X(1,:),'ko','MarkerFace','g','MarkerSize',10);grid on;axis square
end
title('Low Dimensional Latent Variable Space')

NumPoints = 50;
iter = 1;
h_seq = figure('Position',[920   558   860   250]);

while(1)

       set(0,'CurrentFigure',h)
     if mod(iter,5)==0;
         az = az - 3*5;
       % view(az,el);
     end
     if d == 3
        [x y z] = ginput(1);
        A1 = reshape(coeff(:,1:d)*([y;x;z]),196,20);
     elseif d == 2
         [x y] = ginput(1);
         A1 = reshape(coeff(:,1:d)*[y;x],196,20);
     elseif d ==1
         [x y] = ginput(1);
         A1 = reshape(coeff(:,1:d)*[y],196,20);
     end
    
    S = findS2_from_S1_A_seq(mu,A1);
    seq{1} = cell(S);
    set(0,'CurrentFigure',h_seq)
    viz_trajectory(seq);
    iter = iter+1;
    
end

end