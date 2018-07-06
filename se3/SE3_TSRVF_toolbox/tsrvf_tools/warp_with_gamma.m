function p_warp = warp_with_gamma(p,gam)
%%takes sequence on Grassmann and warps it with "gamma"
%returns "p2_warp".

T = length(p);

%gamI = invertGamma(gam);
gamI = gam;
gamI = (gamI-gamI(1))/(gamI(end)-gamI(1));

for j = 1:T
    y=gamI(j)*(T-1)+1;
    
    y1=floor(y);
    y2=ceil(y);
    if y1==y2
        Reg_p(:,:,j) = p(:,:,y);
    else
        tau=(y-y1)/(y2-y1);
        if (tau>0.99)
            M = p(:,:,y2);
        elseif (tau<0.001)
             M = p(:,:,y1);
        else
            w1 = p(:,:,y1);
            w2 = p(:,:,y2);
            r1 = squeeze(w1(1:3,4,:));
            r2 = squeeze(w2(1:3,4,:));
            
            A = log_map_so3(w1(1:3,1:3),w2(1:3,1:3)); 
            tmpso3 = exp_map_so3(w1(1:3,1:3),tau*A);            
            tmpr = (1-tau)*r1 + tau*r2;
            
            M = [tmpso3 tmpr(1:3);0 0 0 1];
        end
        Reg_p(:,:,j) = M;
        
    end
    
end
p_warp = Reg_p;

end