y=zeros(360);
for i=1:360
    y(i)=wid(i,120,0);
end
plot(1:360,(y-sum(y)/length(y)))


