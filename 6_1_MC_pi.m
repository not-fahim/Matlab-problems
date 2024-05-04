%n= input('enter number of random points');
p_error = zeros(1,3);
k=0;

th = 0:pi/50:2*pi;% data for plotting circle
xunit =  cos(th) ;% data for plotting circle
yunit =  sin(th) ; % data for plotting circle

for n = [10, 100, 1000, 10000]
    k=k+1;
A = -1 + 2*rand(n,2);
count_in = 0;

figure(k)

hold on
for i = 1:n
    if(norm(A(i,:)) < 1)
        count_in = count_in+1;
        plot(A(i,1),A(i,2),'b.')
   
    
    else
    plot(A(i,1),A(i,2),'r.')
    end
end
plot(xunit, yunit);
rectangle('position', [-1,-1,2,2])
title(['number of points = ' , num2str(n)])

hold off
p_error(k,:) = [n, 4*count_in / length(A), abs((4*count_in / length(A)) - 3.14159)/3.14159 *100];
disp(['with ',num2str(n) , ' random points , p = ',num2str(p_error(k,2)),' with error = ' , num2str(num2str(p_error(k,3))),'%'])
end