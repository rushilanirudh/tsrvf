% Feb 22-10
% map from subspace to landmark space by calculating the afffine matrix

function  L = subspace2image(P, imgSpace)
% L = subspace2image(P, L_part, RigidIndex)
% P is the projection matrix which represents a subspace on Grassmann
% L_part is the landmarks we already have on the image (with RigidIndex as their indices)
% L is the full landmark matrix from transforming P to the image

L_part = imgSpace.L;
RigidIndex = imgSpace.indx;

[U,Y] = phi_inv(P); 

% find A(3*2) such that: L = Y1*A where Y1=[Y,1]
Y_append = [Y, ones(size(Y,1),1)];
Y_part = Y_append(RigidIndex,:);

A = Y_part\L_part;

L = Y_append*A;
L = round(L);





