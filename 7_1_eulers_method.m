k=0;
n_dx_er_Ia = zeros(1,4);
for n = [4,8,16,32,64]
    k=k+1;
    a = 10;
    delx = a/n;
    S = 1000*ones(n+1,1);
    sigma = 0.1*ones(n+1,1);
    I = zeros(n+1,1);
    I(1)= 1000;
    
    anI = S(1)/sigma(1) + (I(1) -S(1)/sigma(1))*exp(-sigma(1)*a); 
    for i = 1:n
        
    I(i+1) = I(i) + delx * (S(i) - sigma(i)*I(i));
    
    end
    err = abs(I(n+1) - anI)/anI; 
    n_dx_er_Ia(k,:) = [n, delx, err, I(n+1)];
    
    disp(['for n = ',num2str(n),', beam exiting intensity I(a)=',num2str(I(n+1)),'n/cm2s'])

end
figure(1)
loglog(n_dx_er_Ia(:,2),n_dx_er_Ia(:,3))
m = polyfit(n_dx_er_Ia(:,2),n_dx_er_Ia(:,3),1);
title("error vs mesh size")
xlabel('dx (cm)')
ylabel('relative error')
legend(["slope = "+num2str(m(1))])
