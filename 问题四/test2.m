d = load('预处理后的地形测量数据.mat');
d = d.dCopy;
x = d(1,2:end);
y = d(2:end,1);
z = d(2:end,2:end)'/1852;
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
        temp = [temp(1),temp(2),-1]';
        temp = 4*temp./norm(temp);
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
%% 
Table = zeros(lenX*lenY,6);
count = 0;
for i = 1:lenX
    for j = 1:lenY
        count = count + 1;
        Table(count,1:6) = [x(i),y(j),100*z(i,j),A(i,j),B(i,j),C(i,j)];
    end
end
inc=zeros(lenX*lenY,1);
count=0;
s=0;
for i=1:141
    for j=(143+round(0.4*x)):200
        count=count+1;
        if Table(count,4)^2+Table(count,5)^2~=0
            inc(count)=atan(sqrt(Table(count,4)^2+Table(count,5)^2)/-Table(count,6))*180/pi;
            s=s+inc(count);
        end
    end
end
s=s/count;
s