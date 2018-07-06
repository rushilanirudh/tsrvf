
clear
cT = 40;
iter = 1;
d = 1;
for i = 1:length(cT)
    i
    filename = sprintf('revision/tsrvf3/UMD_FR_PCA_%.2d_%.2d.mat',cT(i),iter);
    load(filename)
    [V,~] = ShootingVectorPCA(Reg_S,mu);
    [pc,w,ev] = pca(V');
    acc(i) = recog_expt(squareform(pdist(w(:,1:3))),10,10);
end
