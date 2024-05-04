A = input("enter A matrix:");
b = input( "enter b matrix:");
x_0 = input("enter initial guess:");

D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
count = 0;

err = inf;
E = input("enter tolerance: ");

while(err > E)
    x_1 = inv(D+L)*(b - U*x_0);
    err = norm(x_1 - x_0)/ norm(x_1); 
    count = count + 1;
    x_0 = x_1;
end

disp("final result: ")
disp(x_1)
disp("number of iteration: " +count)