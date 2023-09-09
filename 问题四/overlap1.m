function [y]=overlap1(x1,x2)
alpha=0.6996*pi/180;
theta=pi/3;
d=(x2-x1)*1852;
D=66.84+(0.68-x1)*1852*tan(alpha);
W=D*(sin(theta)/cos(theta+alpha)+sin(theta)/cos(theta-alpha));
y=1-d*cos(theta)/(W*cos(theta+alpha));