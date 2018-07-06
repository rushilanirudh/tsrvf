function h = path_to_h_Grassmann(p,c)

%p is a trajectory
T = length(p);
C = c*c'; %%common point to which TSRVFs are transported.
for i = 1:T-1
    M1 = p{i}*p{i}';
    M2 = p{i+1}*p{i+1}';
    
    [A1 alphadot] = findVelocity_A_P1toP2(M1,M2);
    alpha_norm = trace(alphadot'*alphadot);
    [a1 h_tmp] = Grassmann_ParallelTranslate_proj(M1, alphadot, C, 1);
    h{i} = h_tmp/sqrt(alpha_norm);
    %Grassmann_ParallelTranslate(Y_M1, alphadot', X1', 1)/sqrt(norm(alphadot,'fro'));
end
[a2 h_tmp] = Grassmann_ParallelTranslate_proj(M1, alphadot, M2, 1);
[a3 h_tmp2] = Grassmann_ParallelTranslate_proj(M2, h_tmp, C, 1);
h{T} =  h_tmp2/sqrt(trace(h_tmp2'*h_tmp2));
end
    