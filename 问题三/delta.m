function [S]=delta(beta,x)
% b:区域宽度
% beta1:beta的弧度值
% w1:梯形下底
% w2:梯形上底
% h:梯形的高
% w3:浪费的面积
% w:beta取90°时的覆盖面积
b=2*1852;
beta1=pi*beta/180;
w1=wid2(beta,x);
w2=wid2(beta,x-b*cot(beta1));
h=b/sin(beta1);
w3=0;
if beta~=90
    w3=(w1^2+w2^2)*abs(cos(2*beta1))/8;
end
w=wid2(90,x-b*cot(beta1)/2)*b;
S=(w1+w2)*h/2-w3-w;