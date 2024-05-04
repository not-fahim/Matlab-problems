%n = input('enter number of drops: ');
k = 0;
for n = [10, 100, 1000, 10000]
nedlen = 1; %length of needle
linegap = 2; %gap between lines
grid= 11;
points1 = zeros(1,2);
points2 = zeros(1,2);
gridpoints = -(grid-1)/2*linegap : linegap :(grid-1)/2*linegap; 
intercept = 0;
k = k+1;
 
midp = -((grid-1)/2*linegap) + ((grid-1)*linegap)*rand(n,2);
angles = 0 + pi*rand(n,1);

figure (k)
for i = 1:n
    points1(i,:) = [midp(i,1) + nedlen / 2 * cos(angles(i)), midp(i,2) + nedlen / 2 * sin(angles(i))];
    points2(i,:) = [midp(i,1) - nedlen / 2 * cos(angles(i)), midp(i,2) - nedlen / 2 * sin(angles(i))];
    for g = gridpoints
        if((points1(i,1)<g & points2(i,1)>g) | (points1(i,1)>g & points2(i,1)<g))
            intercept = intercept + 1;
        end
    end
    length(i) = norm(points1(i,:) - points2(i,:));
    
    plot([points1(i,1), points2(i,1)],[points1(i,2), points2(i,2)])
    
    hold on
end
 
 
for g = gridpoints
    xline(g)
end
title(["Buffon's needle tossing experiment with ", num2str(n), 'needles'])
xlabel('grid lines')
hold off
 
p = 2*nedlen * n / (intercept*linegap);
 
error = abs(p-3.14159)/3.14159 *100;
p_error(k, :) = [n , p , error];
disp(['with ',num2str(n) , ' random neeadle drops , p = ',num2str(p_error(k,2)),' with error = ' , num2str(num2str(p_error(k,3))),'%'])
 
end