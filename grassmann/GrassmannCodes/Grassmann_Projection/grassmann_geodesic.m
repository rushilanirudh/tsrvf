function alpha_t = grassmann_geodesic(P1,P2,t)
U = phi_inv(P1);
[A X] = findVelocity_A_P1toP2(P1,P2);
alpha_t = (U*expm(t*X)*U')*P1*(U*expm(-t*X)*U');
end