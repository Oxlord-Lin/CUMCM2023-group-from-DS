D=zeros(1,9);
w=zeros(1,9);
k=zeros(1,9);
alpha=pi/120;
theta=pi/3;
for i=1:9
    D(i)=70+200*sin(alpha)*(5-i);
    w(i)=D(i)*(sin(theta)/cos(theta+alpha)+sin(theta)/cos(theta-alpha))*cos(alpha);
    k(i)=100*(1-200*cos(theta)*cos(alpha)/(w(i)*cos(theta+alpha)));
end
