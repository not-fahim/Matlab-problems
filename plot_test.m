functio

x_0 = zeros(numel(b));


D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

count = 0;
err = inf;

T = (-1) * D\ (L+U);
p = max(abs(eig(T)));
%w = 2 / ( 1 + sqrt(1 - p*p))
w = 1.2;
while(err > E)
    x_1 = inv(D+w*L) * (w*b - (w*U + (w-1)*D)*x_0);
    
    err = norm(x_1 - x_0)/ norm(x_1) ;
    count = count + 1;
    x_0 = x_1;
end

x = x_0;
end