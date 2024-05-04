A = input("enter A matrix: ");
b = input( "enter b matrix: ");
x_0 = input("enter initial guess: ");

D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
count = 0;

err = inf;
E= input("enter allowed error: ");
while(err > E)
    x_1 = inv(D)*(b - (L*x_0 + U*x_0));
    
    err = norm(x_1 - x_0)/ norm(x_1);
    count = count + 1;
    x_0 = x_1;
end

disp("Final result:")
disp(x_1)
disp("number of iteration: " + count)   
    