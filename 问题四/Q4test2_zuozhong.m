options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
% options=optimoptions(@fmincon,'MaxFunctionEvaluations',150000);
<<<<<<<< HEAD:问题四/Q4test_zuozhong.m
n=22;
========
n=20;
>>>>>>>> 8dff34a3346a6dd4ce6cd3849fb75afdf1d364c8:问题四/Q4test2_zuozhong.m
l=1.5;
w=1.98;
% x0=zeros(n,1);
x0 = linspace(0,l,n)';
A=[];
b=[];
Aeq=[];
beq=[];
lb=zeros(n,1);
ub=l*ones(n,1);
nonlcon=@cons2;
fun=@(x)(w*n+x(n)-x(1));
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
x
fun(x)
% for i=2:n
% overlap1(x(i-1),x(i))
% end