function [W]=wid2(beta,x)
theta=pi/3;
alpha=pi/120;
beta1=beta*pi/180;
A=110*tan(theta)*sin(beta1);
B=-x;
C=tan(theta)*tan(alpha)*sin(beta1);
D=tan(theta)*cos(beta1)*(110-x*tan(alpha));
gamma=cos(alpha)/sqrt(1-sin(alpha)^2*cos(beta1)^2);
W=2*sqrt((A+B*C)^2+D^2)/abs(cos(alpha)*(C^2-1))*gamma;
end