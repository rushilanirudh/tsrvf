function [V,mu] = ShootingVectorPCA(Reg_S,mu)
%%calculate the PC from shooting vectors

T = length(mu);
N = length(Reg_S);

for i = 1:100
    for t = 1:T
        p1 = mu{t}*mu{t}';
        p2 = Reg_S{i}{t}*Reg_S{i}{t}';
        vi = findVelocity_A_P1toP2(p1,p2);
        tmp(:,t) = vi(:);
    end
     
    V(:,i) = tmp(:);
end
