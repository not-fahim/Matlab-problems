%n = input('enter number of points');
count_in = 0;
k = 0;
th = 0 : .01 : 1;
for i = 1:numel(th)
    func(i) = 1 / (1+ (th(i))^2);
end


for n = [10 100 1000 10000]
    k = k+1;
    A = rand(n,2);
   
    figure(k)
    
    hold on
    rectangle('position', [ 0,0,1,1])%making rectangle for plotting
    
    for i = 1:n
        plot(A(i,1), A(i,2), 'r*');
        if(A(i,2)< (1/(1+A(i,1)^2)))
            count_in = count_in + 1;
        end
    end
    
   plot(th,func) 
   title(["Rejection Method with ", num2str(n), 'random points'])
   hold off 
    p = 4 * count_in / n;
    error = abs(p - 3.14159)/ 3.14159 * 100;
    p_error(k,:) = [n, p , error];
    disp(['with ',num2str(n) , ' random points , p = ',num2str(p_error(k,2)),' with error = ' , num2str(num2str(p_error(k,3))),'%'])
end