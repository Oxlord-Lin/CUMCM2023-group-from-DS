options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
n=16;
l=2.02;
w=2.82;
x0 = linspace(0,l,n)';
A=[];
b=[];
Aeq=[];
beq=[];
lb=zeros(n,1);
ub=l*ones(n,1);
nonlcon=@cons5;
fun=@(x)(w*n+x(n)-x(1));
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
fun(x)
% for i=2:n
% overlap1(x(i-1),x(i))
% end