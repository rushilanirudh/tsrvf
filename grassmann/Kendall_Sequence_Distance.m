function di = Kendall_Sequence_Distance(S1,S2)
N = length(S1);
d = 0;
for i = 1:N
    X = S1{i};
    Y = S2{i};
    normX = sqrt(trace(X*X'));
    normY = sqrt(trace(Y*Y'));
    X0 = X / normX;
    Y0 = Y / normY;
    [~,Y0_T,~] = procrustes(X0,Y0);
     d = d+acos(InnerProd_Q(X0,Y0_T));
end
di = sqrt(abs(d)/N);

end
