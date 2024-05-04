A= input("enter the matrix A in Ax=b: ")
b= input("enter the vector b in Ax=b: ")

for i = 1 : size(b)
    if(i~=size(b))
        b(i+1) = b(i+1) - (A(j,i) / A(i,i))*b(i)
    end
    for j = i+1 : size(b)
        A(j,:) = A(j,:) - (A(j,i) / A(i,i))*A(i,:)
    end
end

x = b
