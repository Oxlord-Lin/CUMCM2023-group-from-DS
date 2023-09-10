options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
n=50;
l=1.98;
w=2.14;
x0 = linspace(0,l,n)';
A=[];
b=[];
Aeq=[];
beq=[];
lb=zeros(n,1);
ub=l*ones(n,1);
nonlcon=@cons1;
fun=@(x)(w*n+x(n)-x(1));
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
x
fun(x)