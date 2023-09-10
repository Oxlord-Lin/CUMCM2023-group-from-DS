options = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations',15000);
l=2.02;
n=15;
x0 = linspace(0,l,n)';
A=[];
b=[];
Aeq=[];
beq=[];
lb=zeros(n,1);
ub=l*ones(n,1);
nonlcon=@cons5;
fun=@(x)(2.82*n-2.4727*sum(x(find(x<=1.14))));
% fun=@(x)(2.82*n);
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
% fun(x)
for i=2:n
overlap1(x(i-1),x(i))
end