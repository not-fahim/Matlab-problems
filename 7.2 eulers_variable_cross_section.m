k=0;
n_dx_er_Ia = zeros(1,4);
n=1;
err= inf;
while (err>0.0005)
    k=k+1;
    a = 10;
    delx = a/n;
   
    
    I = zeros(n+1,1);
    I(1)= 1000;
    
    anI = I(1) * exp(exp(-0.1*a) - 1) ;
     sigma(1) =2/delx*(1 - exp(-0.1*(delx/2)));
    for i = 1:n
    
        sigma(i+1) = 1/delx*(exp(-0.1*(i*delx - delx/2)) - exp(-0.1*(i*delx + delx/2)));
        I(i+1) = I(i) + delx * ( - sigma(i)*I(i));
    
    end
    err =100*abs(I(n+1) - anI)/anI; 
    n_dx_er_Ia(k,:) = [n, delx, err, I(n+1)];
    
    
    n=n+1;
    
end

disp(['for mesh size = ',num2str(delx),', beam exiting intensity I(a)=',num2str(I(n)),'n/cm2s with error = ' , num2str(err)])
