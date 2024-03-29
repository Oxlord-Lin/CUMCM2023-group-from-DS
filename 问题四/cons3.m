function [c,ceq]=cons3(x)
[n,~]=size(x);
c=zeros(n,1);
alpha=0.6995*pi/180;
theta=pi/3; 
d0=67.03;
l=1.36;
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
    c(i+1)=(y-0.05)*(y-0.1);
end
ceq=[];