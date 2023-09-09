function [c,ceq]=cons(x)
[n,~]=size(x);
c=zeros(n,1);
alpha=pi/120;
theta=pi/3;
d0=110;
l=4;
D=d0+(l/2-x(1))*1852*tan(alpha);
B1=x(1)*1852-D*cos(alpha)*sin(theta)/cos(alpha+theta);
c(1)=B1;
D=d0+(l/2-x(n))*1852*tan(alpha);
B2=x(n)*1852+D*cos(alpha)*sin(theta)/cos(theta-alpha);
c(2)=l*1852-B2;
for i=2:n
    d=(x(i)-x(i-1))*1852;
    D=d0+(l/2-x(i-1))*1852*tan(alpha);
    W=D*(sin(theta)/cos(theta+alpha)+sin(theta)/cos(theta-alpha));
    y=1-d*cos(theta)/(W*cos(theta+alpha));
    c(i+1)=y*(y-0.2);
end
ceq=[];