function  out = PGA_ShootingVectors(V)

[m,n] = size(V);
[coeff score latent] = princomp(V','econ');
out = score';
end
