function Epre = calc_dist_tangent(h1,h2)
T = size(h1,2);
E = 0;
for i = 1:T
    vec = h1{i} - h2{i};
    E = E+trace(vec*vec');
end
Epre=sqrt(E/T);
end