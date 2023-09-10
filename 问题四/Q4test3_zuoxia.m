options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
% options=optimoptions(@fmincon,'MaxFunctionEvaluations',150000);
<<<<<<<< HEAD:问题四/Q4test_zuoxia.m
n=50;
========
n =46;
>>>>>>>> 8dff34a3346a6dd4ce6cd3849fb75afdf1d364c8:问题四/Q4test3_zuoxia.m
% x0=zeros(n,1);
l=1.98;
w=2.14;
x0 = linspace(0,l,n)';
A=[];
b=[];
Aeq=[];
beq=[];
lb=zeros(n,1);
ub=l*ones(n,1);
nonlcon=@cons3;
fun=@(x)(w*n+x(n)-x(1));
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
x
fun(x)
% for i=2:n
% overlap1(x(i-1),x(i))
% end