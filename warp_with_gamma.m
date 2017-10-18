function p_warp = warp_with_gamma(p,gam)
%%takes sequence on Grassmann and warps it with "gamma"
%returns "p2_warp".

T = length(p);

gamI = invertGamma(gam);
gamI = (gamI-gamI(1))/(gamI(end)-gamI(1));

for j = 1:T
    y=gamI(j)*(T-1)+1;
    
    y1=floor(y);
    y2=ceil(y);
    if y1==y2
        Reg_p{j} = p{y};
    else
        tau=(y-y1)/(y2-y1);
        if tau>0.999
            M = p{y2};
        else
            w1 = p{y1};
            w2 = p{y2};
            [A X] = findVelocity_A_P1toP2(w1*w1',w2*w2');
            [u1 a1]= phi_inv(w1*w1');
            tmp1 = findP2_from_P1_A(w1*w1',A,u1,tau);
            [um M] = phi_inv(tmp1);
            %M = compute_grassmann_mean(w,[1-tau tau],10);%% the weighted Karcher mean
        end
        Reg_p{j} = M;
        
    end
    
end
p_warp = Reg_p';

end