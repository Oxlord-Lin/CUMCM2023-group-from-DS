function [S]=delta(beta,x)
beta1=pi*beta/180;
w1=wid2(beta,x);
w2=wid2(beta,x-2*1852*cot(beta1));
w3=0;
if beta~=90
    w3=(w1^2+w2^2)*abs(sin(2*beta1))/8;
end
if beta<90
    w=wid2(90,x+w1*sin(beta1)/2);
else
    w=wid2(90,x-2*1852*cot(beta1)+w2*sin(beta1)/2);
end
S=w1+w2-w3-2*w;