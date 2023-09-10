%本文件用于计算漏测面积
slope = load('法向量（doing）.mat');
A = slope.A;
B = slope.B;
C = slope.C;
d = load('预处理后的地形测量数据.mat');
Deep = d.dCopy(2:end,2:end)';

%%
% 建立网格
X_range=[0,4]*1852;
Y_range=[0,5]*1852;
X=linspace(X_range(1),X_range(2),16000);
Y=linspace(Y_range(1),Y_range(2),20000);
lenX=length(X);
lenY=length(Y);
dX=(X_range(2)-X_range(1))/(lenX-1);
dY=(Y_range(2)-Y_range(1))/(lenY-1);
Table=zeros(lenX,lenY);

%%
% left-up
x_input =[0.0769
    0.2096
    0.3374
    0.4603
    0.5787
    0.6927
    0.8024
    0.9091
    1.0159
    1.1186
    1.2174
    1.3119];
e=[1;0;0];
y = (5-x_input)*1852;
x_range = [0,1.98]*1852;
xx = linspace(x_range(1),x_range(2),4000);


for j = 1:length(y)
    count = 0;
    for i = 1:length(xx)-1
        M = weight(xx(i),y(j));
        index = M(:,1:2);
        w = M(:,3);
        for k = 1:4
            Cor(1,k) = A(index(k,1),index(k,2));
            Cor(2,k) = B(index(k,1),index(k,2));
            Cor(3,k) = C(index(k,1),index(k,2));
            Cor(4,k) = Deep(index(k,1),index(k,2));
        end
        vec = Cor*w;
        n = vec(1:3);
        D = vec(4);
        [B1,B2] = wid3(n,e,D);
        LU=[xx(i),y(j)+B2];
        LD=[xx(i),y(j)-B1];
        RU=[xx(i+1),y(j)+B2];
        RD=[xx(i+1),y(j)-B1];

        x_index_l = max(ceil(LU(1)/dX)+1,1);  
        x_index_r = min(floor(RU(1)/dX)+1,lenX);
        y_index_d = max(ceil(LD(2)/dY)+1,1);
        y_index_u = min(floor(LU(2)/dY)+1,lenY);

        Table(x_index_l:x_index_r,y_index_d:y_index_u)=1;

    end
end


%%
% left-mid
x_input =[  0.0464
    0.1282
    0.2081
    0.2875
    0.3677
    0.4460
    0.5224
    0.5970
    0.6698
    0.7409
    0.8103
    0.8780
    0.9441
    1.0087
    1.0717
    1.1332
    1.1932
    1.2518
    1.3090
    1.3649
    1.4194
    1.4727];
e=[1;0;0];
y = (3.64-x_input)*1852;
x_range = [0,1.98]*1852;
xx = linspace(x_range(1),x_range(2),4000);


for j = 1:length(y)
    count = 0;
    for i = 1:length(xx)-1
        M = weight(xx(i),y(j));
        index = M(:,1:2);
        w = M(:,3);
        for k = 1:4
            Cor(1,k) = A(index(k,1),index(k,2));
            Cor(2,k) = B(index(k,1),index(k,2));
            Cor(3,k) = C(index(k,1),index(k,2));
            Cor(4,k) = Deep(index(k,1),index(k,2));
        end
        vec = Cor*w;
        n = vec(1:3);
        D = vec(4);
        [B1,B2] = wid3(n,e,D);
        LU=[xx(i),y(j)+B2];
        LD=[xx(i),y(j)-B1];
        RU=[xx(i+1),y(j)+B2];
        RD=[xx(i+1),y(j)-B1];

        x_index_l = max(ceil(LU(1)/dX)+1,1);     
        x_index_r = min(floor(RU(1)/dX)+1,lenX);
        y_index_d = max(ceil(LD(2)/dY)+1,1);      
        y_index_u = min(floor(LU(2)/dY)+1,lenY);

        Table(x_index_l:x_index_r,y_index_d:y_index_u)=1;
    end
end

%%
% left-down
x_input =[ 0.0314
    0.0901
    0.1477
    0.2043
    0.2599
    0.3145
    0.3681
    0.4209
    0.4727
    0.5236
    0.5716
    0.6184
    0.6648
    0.7123
    0.7590
    0.8049
    0.8500
    0.8942
    0.9378
    0.9805
    1.0225
    1.0638
    1.1043
    1.1441
    1.1833
    1.2217
    1.2595
    1.2966
    1.3330
    1.3689
    1.4040
    1.4386
    1.4726
    1.5060
    1.5388
    1.5710
    1.6026
    1.6337
    1.6643
    1.6943
    1.7238
    1.7528
    1.7812
    1.8092
    1.8367
    1.8637
    1.8902
    1.9162
    1.9418
    1.9670];
e=[0;1;0];
x = (1.98-x_input)*1852;
y_range = [0,2.14]*1852;
yy = linspace(y_range(1),y_range(2),4000);


for i = 1:length(x)
    count = 0;
    for j = 1:length(yy)-1
        M = weight(x(i),yy(j));
        index = M(:,1:2);
        w = M(:,3);
        for k = 1:4
            Cor(1,k) = A(index(k,1),index(k,2));
            Cor(2,k) = B(index(k,1),index(k,2));
            Cor(3,k) = C(index(k,1),index(k,2));
            Cor(4,k) = Deep(index(k,1),index(k,2));
        end
        vec = Cor*w;
        n = vec(1:3);
        D = vec(4);
        [B1,B2] = wid3(n,e,D);
        LU=[x(i)-B1,yy(j+1)];
        LD=[x(i)-B1,yy(j)];
        RU=[x(i)+B2,yy(j+1)];
        RD=[x(i)+B2,yy(j)];

        x_index_l = max(ceil(LU(1)/dX)+1,1);     
        x_index_r = min(floor(RU(1)/dX)+1,lenX);
        y_index_d = max(ceil(LD(2)/dY)+1,1);      
        y_index_u = min(floor(LU(2)/dY)+1,lenY);

        Table(x_index_l:x_index_r,y_index_d:y_index_u)=1;
    end
end

%%
% right-down
x_input =[0.1270
    0.3356
    0.5276
    0.7044
    0.8672
    1.0171
    1.1551
    1.2822
    1.3992
    1.5069
    1.6061
    1.6975
    1.7816
    1.8590
    1.9303
    1.9959];
e=[0;1;0];
x = (4-x_input)*1852;
y_range = [0,2.82]*1852;
yy = linspace(y_range(1),y_range(2),4000);


for i = 1:length(x)
    count = 0;
    for j = 1:length(yy)-1
        M = weight(x(i),yy(j));
        index = M(:,1:2);
        w = M(:,3);
        for k = 1:4
            Cor(1,k) = A(index(k,1),index(k,2));
            Cor(2,k) = B(index(k,1),index(k,2));
            Cor(3,k) = C(index(k,1),index(k,2));
            Cor(4,k) = Deep(index(k,1),index(k,2));
        end
        vec = Cor*w;
        n = vec(1:3);
        D = vec(4);
        [B1,B2] = wid3(n,e,D);
        LU=[x(i)-B1,yy(j+1)];
        LD=[x(i)-B1,yy(j)];
        RU=[x(i)+B2,yy(j+1)];
        RD=[x(i)+B2,yy(j)];

        x_index_l = max(ceil(LU(1)/dX)+1,1);     
        x_index_r = min(floor(RU(1)/dX)+1,lenX);
        y_index_d = max(ceil(LD(2)/dY)+1,1);      
        y_index_u = min(floor(LU(2)/dY)+1,lenY);

        Table(x_index_l:x_index_r,y_index_d:y_index_u)=1;
    end
end

%%
% right-up
x_input =[    2.84
        2.9725
        3.105
        3.2375
        3.37
        3.5025
        3.635
        3.7675
        3.9
        4.0325
        4.165
        4.2975
        4.43
        4.5625
        4.695
        4.8275];
e=[1;0;0];
y = x_input*1852;
x_range = [0,1.98]*1852;
xx = linspace(x_range(1),x_range(2),4000);


for j = 1:length(y)
    count = 0;
    for i = 1:length(xx)-1
        M = weight(xx(i),y(j));
        index = M(:,1:2);
        w = M(:,3);
        for k = 1:4
            Cor(1,k) = A(index(k,1),index(k,2));
            Cor(2,k) = B(index(k,1),index(k,2));
            Cor(3,k) = C(index(k,1),index(k,2));
            Cor(4,k) = Deep(index(k,1),index(k,2));
        end
        vec = Cor*w;
        n = vec(1:3);
        D = vec(4);
        [B1,B2] = wid3(n,e,D);
        LU=[xx(i),y(j)+B2];
        LD=[xx(i),y(j)-B1];
        RU=[xx(i+1),y(j)+B2];
        RD=[xx(i+1),y(j)-B1];

        x_index_l = max(ceil(LU(1)/dX)+1,1);     
        x_index_r = min(floor(RU(1)/dX)+1,lenX);
        y_index_d = max(ceil(LD(2)/dY)+1,1);      
        y_index_u = min(floor(LU(2)/dY)+1,lenY);

        Table(x_index_l:x_index_r,y_index_d:y_index_u)=1;
    end
end

miss=sum(sum(Table==0))/(lenX*lenY)


function M = weight(x,y)
% input:当前点坐标
% output:寻找当前点到邻近点的权重
    x = x/0.02/1852; y = y/0.02/1852;
    x_index_le = floor(x);      x_index_rt = ceil(x);
    y_index_bt = floor(y);      y_index_tp = ceil(y);
    M = [x_index_le,y_index_tp;
        x_index_le,y_index_bt;
        x_index_rt,y_index_bt;
        x_index_rt,y_index_tp];
    w = zeros(4,1);
    for i = 1:4
        w(i) = 1/(norm([x,y] - M(i,:)));
    end
    w = w./sum(w);
    M = [M+1,w];
end
