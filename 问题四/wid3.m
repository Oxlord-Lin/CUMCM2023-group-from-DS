function [W]=wid3(n,D)
e1=[0;0;1];
e2=[0;1;0];
theta=pi/3;
salpha=n'*e1/norm(n);
calpha=sqrt(1-salpha^2);
cbeta=n'*e2/norm(n);
gamma=cos(alpha)/sqrt(1-sin(alpha)^2*cbeta^2);
W=D*calpha^2*sin(2*theta)/(cos(theta)^2*calpha^2-sin(theta)^2*salpha^2)*gamma;
end