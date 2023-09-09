function [W]=wid2(beta,x)
theta=pi/3;
alpha=pi/120;
beta1=beta*pi/180;
l=0;
if beta~=90
    l=x/cos(beta1);
end
A=110*tan(theta)*sin(beta1);
B=l*cos(beta1);
C=tan(theta)*tan(alpha)*sin(beta1);
D=tan(theta)*cos(beta1)*(110+l*tan(alpha)*cos(beta1));
gamma=cos(alpha)/sqrt(1-sin(alpha)^2*cos(beta1)^2);
W=2*sqrt((A+B*C)^2+D^2)/abs(cos(alpha)*(C^2-1))*gamma;
end