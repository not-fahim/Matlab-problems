

function main
p1 = 1

nodes = input(" number of nodes: ")

a = zeros(nodes-2)
limits = input ("enter start and end value as an array")
h = ((limits(2) - limits (1)) / (nodes - 1))

b = zeros(nodes - 2 , 1)

b(1,1) = 2 * h * q1(limits(1) + h) + exp(-limits(1)) * cos( 5 * limits(1))
for i = 2:(nodes-2)
    b(i,1) = 2 * h * q1(limits(1) + h * i)
end

for i = 1:(nodes-2)
    for  j = 1 : (nodes-2)
        if( j == i+1)
                a(i,j) = 1
        
        
        elseif (j==i)
            a(i,j) = 2 * h *p1
           
        
            elseif(j == i - 1)
            a(i,j) = -1
        end
    end
end

xp = zeros(nodes-2, 1)

for i = 1 : (nodes-2)
    xp(i,1) =limits(1)+ h*i
end

x = linsolve(a,b)

plot(xp, x)
            
end

function p = q1(x)

    p = -5* exp(-x) * sin(5*x)
end