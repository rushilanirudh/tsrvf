function [tVa tVx] = Grassmann_ParallelTranslate_proj(P1,X,P3,t)
U1 = phi_inv(P1);
U3 = phi_inv(P3);
V = U1*expm(t*X)*U1';
P4 = V*P3*V';
[tVa tVx]= findVelocity_A_P1toP2(P3,P4);
end