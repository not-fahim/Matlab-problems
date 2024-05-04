A = input("enter A matrix")


D= diag(diag(A))
L = tril(A,-1)
U = triu(A,1)
count = 0;
err = inf;
T = (-1) inv(D)* (L+U);
p = max(abs(eig(T)))
w = 2 / ( 1 + sqrt(1 - p*p))
