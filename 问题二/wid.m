function [W]=wid(beta,l)
theta=pi/3;
alpha=pi/120;
beta1=beta*pi/180;
% l=(h-120)/(cos(beta)*y);
A=120*tan(theta)*sin(beta1);
B=l*cos(beta1);
C=tan(theta)*tan(alpha)*sin(beta1);
D=tan(theta)*cos(beta1)*(120+l*tan(alpha)*cos(beta1));
gamma=cos(alpha)/sqrt(1-sin(alpha)^2*cos(beta1)^2);
W=2*sqrt((A+B*C)^2+D^2)/abs(cos(alpha)*(C^2-1))*gamma;
end