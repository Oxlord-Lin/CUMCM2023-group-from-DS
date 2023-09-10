beta = linspace(0,360,361);
f = zeros(1,length(beta));
theta = 2*pi/3;
alpha = pi*1.5/180;
s1 = sin(theta/2);
s2 = sin(alpha);
c1 = cos(theta/2);
c2 = cos(alpha);
for i = 1:length(beta)
    f(i) = (s1*c1)/((c1*c2)^2 - (s1*s2*sin(pi*beta(i)/180))^2);
end

plot(beta,f,'r',LineWidth=1);
xlabel('\beta/°')
ylabel('函数值')
title('$f(\beta)=\frac{1}{(\cos\frac{\theta}{2}\cos\alpha)^2-(\sin\frac{\theta}{2}\sin\alpha\sin\beta)^2}$','Interpreter','latex')
