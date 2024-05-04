a = 5 ;
xy = 0;
counting = zeros(5,1);
D = 1;
Sigma_a = .2;
L = sqrt(D / Sigma_a);
Q = 10;
track = zeros(1,2)

relmaxerror = 0
for n = 3:100
    h = 2*a / n;

nodes = (-a+h) : h : (a-h) ;

A = zeros(numel(nodes));
b = zeros(numel(nodes),1);
y = zeros(numel(nodes),1);

for i =  1 : numel(nodes)
  b(i,1) = h*h*Q/D;

  
  if(i~= 1 && i~= numel(nodes))
    A(i,i-1) = -1;
    A(i,i)   = 2 + h*h/(L*L);
    A(i,i+1) = -1;
  end
  
  if(i==1)
      A(i,i) = 2 +h*h/(L*L);
      A(i,i+1) = -1;
  end
  
  if(i == numel(nodes))
      A(i,i) = 2 +h*h/(L*L);
      A(i,i-1) = -1;
  end

end

y = transpose( -(Q*L*L/D)*((sinh(a/L)/sinh(2*a/L))*(cosh(nodes/L)*2)-1));

%k = input("Choose iteration method. Enter 1 for jacobi, 2 for gauss seidel, 3 for SOR,  4 for linsolve:");
k = 3;
if( k == 4)
    flu = A\b;
else
    %E = input("enter tolerance: ");
    E = 10^-3;
    if(k==1)
        [flu count] = jacobi(A,b,E);
    end

    if (k==2)
    [flu count] = gauss_seidel(A,b,E);
    end
    
    if (k == 3)
    [flu count] = SOR(A,b,E);
    end
end
relmaxerror(1,1) = max(abs(flu-y)./y);
track(n-2,:) = [ n , relmaxerror]

end


figure(1)
plot( track(:,1), track(:,2))
title('Maximum relative error vs Mesh number for Gauss-Seidel ', ['with tolerance = 1*e-', num2str(log(E)/log(10))])
xlabel('number of meshes')
ylabel('maximum relative error')



function [x count] = jacobi(A,b,E)
x_0 = zeros(numel(b),1) ;

D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
count = 0;

err = inf;

while(err > E)
    x_1 = inv(D)*(b - (L*x_0 + U*x_0));
    
    err = norm(x_1 - x_0)/ norm(x_1);
    count = count + 1;
    x_0 = x_1;
end

x = x_0  ;
end

function [x count] = SOR(A,b,E)
x_0 = zeros(numel(b),1);


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
    x_1 = (D+w*L)\(w*b - (w*U + (w-1)*D)*x_0);
    
    err = norm(x_1 - x_0)/ norm(x_1) ;
    count = count + 1;
    x_0 = x_1;
end

x = x_0;
end

function [x count] = gauss_seidel(A,b,E)
x_0 = zeros(numel(b),1);

D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
count = 0;

err = inf;


while(err > E)
    x_1 = inv(D+L)*(b - U*x_0);
    err = norm(x_1 - x_0)/ norm(x_1);
    count = count + 1;
    x_0 = x_1;
end
x = x_1;
end

