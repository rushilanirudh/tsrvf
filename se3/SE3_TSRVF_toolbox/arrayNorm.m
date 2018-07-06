function out = arrayNorm(A)

[R,C] = size(A);

for c = 1:C
    N(c) = norm(A(:,c));
end
out = N;
