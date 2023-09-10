function [W1,W2]=wid3(n,e2,D)
e1=[0;0;-1]; 
% n:坡面法向量
% e1:海平面法向量
% e2:船行进方向
% D:水深
% e2=[1;0;0] 水平向右
% e2=[0;1;0] 竖直向上
theta=pi/3;
calpha = n'*e1/norm(n);
salpha = sin(acos(calpha));
cbeta = (n*salpha)'*e2/norm(n);
cgamma = calpha/sqrt(1-salpha^2*cbeta^2);
sgamma = sin(acos(cgamma));
W1 = D*cgamma*sin(theta)/(cos(theta)*cgamma-sin(theta)*sgamma)*cgamma;
W2 = D*cgamma*sin(theta)/(cos(theta)*cgamma+sin(theta)*sgamma)*cgamma;
end