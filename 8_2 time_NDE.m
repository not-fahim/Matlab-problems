a_ = 10*pi;
 
v = 2.2*10^5;
D=2;
sigma_a = 0.1;
vsigma=0.13;
phi_0 = 1;
 
for t= 10^-6*[0 1 10 100 1000 10000]
    n=100;
 
x=linspace(-a_/2 , a_/2)
count = 0;
for K = x
    count = count + 1;
    for i = 1:n
        A(i) = (2*phi_0)/((2*i-1)*pi)*2 *sin((2*i-1)*pi/2);
        B(i) = (2*i-1)*pi/a_;
        alpha(i) = v*(vsigma-(D*B(i)*B(i)+sigma_a));
        to_sum(i) = A(i)*exp(alpha(i)*t)* cos((2*i-1)*pi*K/a_); 
    end
    flu(count) = sum(to_sum);
end
 
plot(x,flu);
hold on
title('flux vs position with vsigma=.11')
xlabel('position x(cm)')
ylabel('flux #/cm^2s')
 
 
end
hold off
 
legend('0 micro seconds','1 micro seconds','10 micro seconds','100 micro seconds','1000 micro seconds','10000')