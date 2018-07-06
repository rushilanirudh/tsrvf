function out = inverse_tsrvf(H,C,U)
%%function takes the TSRVF function and returns the curve
%%'U' - starting condition.
%%H is the tangent bundle at 'C'.

N = length(H);
%[tmpu tmpa] = phi_inv(U);
U_i{1} = U;
for i = 2:N
    H_tilde{i-1} = Grassmann_ParallelTranslate_proj(C, H{i-1}, U_i{i-1}*U_i{i-1}', 1);
    [u a] = phi_inv(U_i{i-1}*U_i{i-1}');
    A = H_tilde{i-1};%/norm(H_tilde{i-1},'fro');
    tmp = findP2_from_P1_A(U_i{i-1}*U_i{i-1}',A,u,1);
    [x U_i{i}] = phi_inv(tmp);
end
out = U_i;
end

