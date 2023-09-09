d = load('预处理后的地形测量数据.mat');
d = d.dCopy;
x = d(1,2:end);
y = d(2:end,1);
z = d(2:end,2:end)';
lenX = length(x);
lenY = length(y);
A = zeros(lenX,lenY);
B = A;
C = A;
%%
for i = 2 : lenX - 1
    for j = 2 : lenY - 1
        xx = [x(i-1),x(i-1),x(i-1),x(i),x(i),x(i),x(i+1),x(i+1),x(i+1)]';
        yy = [y(j-1),y(j),y(j+1),y(j-1),y(j),y(j+1),y(j-1),y(j),y(j+1)]';
        zz = [z(i-1,j-1),z(i-1,j),z(i-1,j+1),z(i,j-1),z(i,j),z(i,j+1),z(i+1,j-1),z(i+1,j),z(i+1,j+1)]';
        temp = [xx,yy,ones(9,1)]\zz;
        temp = 20*temp./norm(temp).*sign(temp(1));
        A(i,j) = temp(1);
        B(i,j) = temp(2);
        C(i,j) = temp(3);
    end
end

% 先偷个懒
A(1,1:end) = A(2,1:end);
B(1,1:end) = B(2,1:end);
C(1,1:end) = C(2,1:end);
A(end,1:end) = A(end,1:end);
B(end,1:end) = B(end,1:end);
C(end,1:end) = C(end,1:end);
A(1:end,1) = A(1:end,1);
B(1:end,1) = B(1:end,1);
C(1:end,1) = C(1:end,1);
A(1:end,end) = A(1:end,end);
B(1:end,end) = B(1:end,end);
C(1:end,end) = C(1:end,end);

% S = sign(A);
% B = S.*B;
% C = S.*C;

Table = zeros(lenX*lenY,6);
count = 0;
for i = 1:lenX
    for j = 1:lenY
        count = count + 1;
        Table(count,1:6) = [5*x(i),5*y(j),0.3*z(i,j),A(i,j),B(i,j),C(i,j)];
    end
end

%%
class = 6;
[idx,C] = kmeans(Table,class,'Replicates',4);
figure;
for i = 1:class
    plot(Table(idx==i,1),Table(idx==i,2),'.','MarkerSize',12)
    hold on
end
axis equal

