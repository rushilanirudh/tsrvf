function out = log_map_norm(X1,X2)

A = compute_velocity_grassmann_efficient(X1,X2);

out = trace(A'*A);

return;