options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
% options=optimoptions(@fmincon,'MaxFunctionEvaluations',150000);
n=34;
% x0=zeros(n,1);
x0 = linspace(0,4,n)';
A=[];
b=[];
Aeq=[];
beq=[];
lb=zeros(n,1);
ub=4*ones(n,1);
nonlcon=@cons;
fun=@(x)(2*n+x(n)-x(1));
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
fun(x)