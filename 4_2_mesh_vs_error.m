a = 5 ;
D = 1;
Sigma_a = .2;
L = sqrt(D / Sigma_a);
Q = 10;
mesh_error = zeros(1,3);

k = 1;

for n = 3:1000

    h = 2*a / n;
nodes = (-a) : h : (a) ;

A = zeros(numel(nodes));
b = zeros(numel(nodes),1);
y = zeros(numel(nodes),1);

A(1,1) = 1;
b(1) = 0;
A(numel(nodes), numel(nodes)) = 1;
b(numel(nodes)) = 0;

for i =  2 : numel(nodes)-1
  b(i,1) = h*h*Q/D;

  
 
    A(i,i-1) = -1;
    A(i,i)   = 2 + h*h/(L*L);
    A(i,i+1) = -1;

  

end
y = transpose( -(Q*L*L/D)*((sinh(a/L)/sinh(2*a/L))*(cosh(nodes/L)*2)-1));

x = linsolve(A,b);

error = max( abs(x-y)./y);
mesh_error(k,:) = [n error h];
k = k+1;

end


figure(2)
plot(mesh_error(:,1), mesh_error(:,2)  )