function unrz(s1)

n=length(s1);

UNRZ=0;


count=0;
for i=1:n
 if s1(i)==0
 UNRZ=[UNRZ 0];
 
 
 else
 count=count+1;
 UNRZ=[UNRZ 5];

 
 end
end
UNRZ=UNRZ(2:length(UNRZ));

x1=0;
t=0:0.01:n;
for i=1:n
 x1=[x1 UNRZ(i)*(ones(1,100))];
 
end
x1=[x1(2:length(x1)) 0];
i=1;


figure;
subplot(2,1,1);
plot(t,x1);title('UNRZ');

subplot(2,1,2);

%PSD of UNRZ
f=0:0.001:2000;
A=5;
Tb=0.001;
s1=(((A^2)*Tb)/4).*((sinc(f.*Tb)).^2).*(1+(((1/Tb).*dirac(f))));
s1=s1/((A^2)*Tb);
f1=f*Tb;
figure;
plot(f1,s1);
title('PSD of UNRZ');
bpsk(x1,t);
end

