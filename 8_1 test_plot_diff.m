a =25;
D = .1;
sigma = 0.02;
s = 10;
L = sqrt(D / sigma);

th = -a:.01:a
flu = -s/(sigma) *(cosh(th/L)/(cosh(a/L )+ 2 *D/L *sinh(a/L))-1)
flu1 = -(s )/(sigma)*(cosh(th/L)/cosh((a+2*D)/L) - 1)
err = (flu1 - flu)./flu *100

er =@(x) 100.*abs((-s./(sigma) .*(cosh(1./L.*x)./(cosh(a./L )+ 2 .*D./L .*sinh(a./L))-1)) - (-(s )./(sigma).*(cosh(1./L.*x)./cosh((a+2.*D)./L) - 1))) ./ (-s./(sigma) .*(cosh(1./L.*x)/(cosh(a./L )+ 2 .*D./L .*sinh(a./L))-1))
avg_er = integral(er,0,a) / a;

figure(1)
plot(th,flu)
title('flux vs position(x)')
subtitle(['a = ',num2str(a) ,'cm, D = ',num2str(D),'cm, sigma = ' , num2str(sigma)])
xlabel('position x (cm)')
ylabel('flux #/cm^2s')
hold on
plot(th, flu1)
legend('with zero negative going current at boundary','with zero flux at etrapolated length')
hold off
figure(2)
plot(th, err)
title('error vs position')
subtitle(['a = ',num2str(a) ,'cm, D = ',num2str(D),'cm, sigma = ' , num2str(sigma)])
xlabel('position (cm)')
ylabel('%error')
legend(['average error = ', num2str(avg_er)])