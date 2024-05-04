A = input("enter A matrix: ");
b = input( "enter b matrix: ");
x_0 = input("enter initial guess: ");
w = input("enter the value of w: "); %manually taking the value of w from user **
tol= input("enter tolerence:");

D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

count = 0;
err = inf;


%T = (-1) * inv(D)* (L+U); %calculating the jacobi T_j matrix *
%p = max(abs(eig(T))) %spectral radius of T_j *
%w = 2 / ( 1 + sqrt(1 - p*p)) %calculation for optimum value of w *

while(err > tol)
    x_1 = (D+w*L)\(w*b - (w*U + (w-1)*D)*x_0);
    
    err = norm(x_1 - x_0)/ norm(x_1) ;
    count = count + 1;
    x_0 = x_1;
end

x = x_1
disp("number of iteration : " + count)