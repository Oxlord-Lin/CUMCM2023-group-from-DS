W=zeros(8,8);
for i=1:8
    for j=1:8
        l=0.3*(j-1)*1852;
        b=45*(i-1);
        h=120+l*cos(b*pi/180)*tan(pi/120);
        W(i,j)=wid(b,h,l);
    end
end
W

