options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
n=12;
l=1.36;
w=1.98;
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