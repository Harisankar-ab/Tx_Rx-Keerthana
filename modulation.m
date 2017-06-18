function modulation = 
b=input('Enter the bit stream: ');
Tb=input('Enter the bit duration: ');
n=length(b);
d=0;
i=1;
while(i<=n)
if ((b(i)==1)&&(b(i+1)==0))
temp=1;
d=[d temp];
end
if ((b(i)==0)&&(b(i+1)==0))
temp=2;
d=[d temp];
end
if ((b(i)==0)&&(b(i+1)==1))
temp=3;
d=[d temp];
end
if ((b(i)==1)&&(b(i+1)==1))
temp=4;
d=[d temp];
end
i=i+2;
end
d=d(2:length(d));

t=0:0.01:Tb;
qp=0;
for i=1:length(d)
for j=1:2*(length(t)-1)
qp=[qp d(i)];
end
end
qp=qp(2:length(qp));
t1=0:0.01:(n*(Tb))-0.01;
qp1=0;
for i=1:length(b)
for j=1:(length(t)-1)
qp1=[qp1 b(i)];
end
end
qp1=qp1(2:length(qp1));
figure;
subplot(2,1,1);
plot(t1,qp1);
title('Bit Stream');
qps=0;
for i=1:length(qp)
if(qp(i)==1)
qps=[qps cos(2*pi*5*t1(i)+(pi/4))];
end
if(qp(i)==2)
qps=[qps cos(2*pi*5*t1(i)+((3*pi)/4))];
end
if(qp(i)==3)
qps=[qps cos(2*pi*5*t1(i)+((5*pi)/4))];
end
if(qp(i)==4)
qps=[qps cos(2*pi*5*t1(i)+((7*pi)/4))];
end
end
qps=qps(2:length(qps));