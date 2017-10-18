% Feb 17-10
% find the procrustes representation for landmark matrix on Grassmann
% Manifold
%[out, Rot, trans] = grassmannRep(L)
% out*Rot+repmat(trans,size(out,1),1) = L;

function [out, Rot, trans] = grassmannRep(L) 

L_mz = L - repmat(mean(L),length(L),1);
[U,S,V] = svd(L_mz,'econ'); 
out = U;

Rot = S*V';
trans = mean(L);