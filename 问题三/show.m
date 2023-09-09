function [z]=show()
beta=85:0.5:95;
x=-2:0.2:2;
z=zeros(21,21);
for i=1:21
    for j=1:21
        z(i,j)=delta(beta(i),x(j)*1852);
    end
end
[X,Y]=meshgrid(x,beta);
mesh(X,Y,z);