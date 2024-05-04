% 1D 1E non-multiplying finite slab 
% diffusion + FVM 
% fixed source steady-state problem

% from Vujic, J., NE 115/255 Homework Set IV (Question 1 to 3)
% attempt 1 on 28/03/22 @ DAK 

clear 
clc
%% Constants
D = 1;
Sa = 0.2;

%% Model param
a = 5; % slab legth (cm)
h = 0.1; % mesh size (cm)

x = -a:h:a; % mesh points with fixed interval 
m = length(x); % number of mesh points 
% m = m -1; % number of vlolume elements

%% System init 
% iIteration  = 2; % 
% nIterations = 1000; % max iteration  
% 
% flux = zeros(m,nIterations); % init flux iteration history matrix 
% flux(:,1) = ones(1,m); % initial guess 

%% Buckling 

A = zeros(m,m);
for i=2:m-1
    
    A(i,i-1) = -D/h^2;
    A(i,i) = Sa+2*D/h^2 ;
    A(i,i+1) = -D/h^2;
    
end


% degenerate vol element at edge i = 1
A(1,1) = Sa+2*D/h^2;
A(1,2) = -D/h^2;


% The other degenerate vol element at edge i = end

A(end,end-1) = -D/h^2;
A(end,end) = Sa+2*D/h^2;

%% Source 
Q = (10)*ones(m,1);

%% Solve the system
flux = A\Q;
% flux = Gauss(A,Q);
%[flux,iter] = Jacobi(A,Q,1e-5);
% [flux,iter] = GS(A,Q,1e-5);
% [flux,iter] = SOR(A,Q,1e-5,1.2);


figure;
% figure('visible','off');

% Draw each bin separately

hold on;

for i=1:length(x)

  % Draw horizontal line for the mean fission density of the bin

  plot([(x(i)-h/2) (x(i)+h/2)], [flux(i) flux(i)], 'k-')

  % Draw some vertical lines to make the plot nicer

  if (i > 1)
    % For mean:

    plot([(x(i)-h/2) (x(i)-h/2)], [flux(i-1) flux(i)], 'k-')
    plot([1 1]*x(i), [0 max(flux)], 'r-')

  end
  

end


plot([1 1]*x(1), [0 max(flux)], 'r-')
plot([1 1]*x(end), [0 max(flux)], 'r-')

title('diffusion + FVM')
% hold off 

%% plot the analytical soln 

L = sqrt(D/Sa);
Q = 10; 
f=@(x)-5.2835*exp(x/L)-5.2835*exp(-x/L)+Q/Sa;
plot(x,f(x),'r-')

hold off 

% 
figure(3)
rel_error=abs((f(x)-flux'))./f(x); % relative error
plot(x,log(rel_error));