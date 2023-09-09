W=zeros(8,8); %结果表格
for i=1:8
    for j=1:8
        l=0.3*(j-1)*1852; %到中心点距离
        b=45*(i-1);     %beta角（角度）
        W(i,j)=wid(b,l);
    end
end
W

