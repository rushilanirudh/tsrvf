function B = lie_algebra_to_Matrix_SO3(vec)
u1 = vec(1);
u2 = vec(2);
u3 = vec(3);
B = [0 -u3 u2; u3 0 -u1; -u2 u1 0];

