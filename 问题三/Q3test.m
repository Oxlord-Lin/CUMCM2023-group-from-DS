options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
% options=optimoptions(@fmincon,'MaxFunctionEvaluations',150000);
n=34;
l=4;
w=2;
% x0=zeros(n,1);
x0 = linspace(0,l,n)';
A=[];
b=[];
Aeq=[];
beq=[];
lb=zeros(n,1);
ub=l*ones(n,1);
nonlcon=@cons;
fun=@(x)(w*n+x(n)-x(1));
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
x;
fun(x)