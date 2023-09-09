function [W]=wid(beta,l)
theta=2*pi/3; %theta角（120度）
alpha=pi/120; %alpha角
beta1=beta*pi/180; %beta角转化为弧度
h0=120;%中心点处海水深度
A=h0*tan(theta/2)*sin(beta1);
B=l*cos(beta1);
C=tan(theta/2)*tan(alpha)*sin(beta1);
D=tan(theta/2)*cos(beta1)*(h0+l*tan(alpha)*cos(beta1));
gamma=cos(alpha)/sqrt(1-sin(alpha)^2*cos(beta1)^2);
W=2*sqrt((A+B*C)^2+D^2)/abs(cos(alpha)*(C^2-1))*gamma; %以上均为公式
end