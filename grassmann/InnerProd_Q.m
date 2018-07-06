function val = InnerProd_Q(q1,q2)
[~,q2,~] = procrustes(q1,q2);
val = acos(trace(q1*q2'));
return;