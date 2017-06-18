clc;
clear all;
close all;
n=input('Enter the length of bit stream: ');
for i=1:n
 b(i)=input('Enter the bit stream: ');
end
UNRZ=0;
PNRZ=0;
URZ=0;
BRZ=0;
MNRZ=0;
count=0;
for i=1:n
 if b(i)==0
 UNRZ=[UNRZ 0];
 PNRZ=[PNRZ -5];
 URZ=[URZ 0 0];
 BRZ=[BRZ 0 0];
 MNRZ=[MNRZ -5 5];
 else
 count=count+1;
 UNRZ=[UNRZ 5];
 PNRZ=[PNRZ 5];
 URZ=[URZ 5 0];
 if((mod(count,2))==0)
 BRZ=[BRZ -5 0];
 else
 BRZ=[BRZ 5 0];
 end
 MNRZ=[MNRZ 5 -5];
 end
end
UNRZ=UNRZ(2:length(UNRZ));
PNRZ=PNRZ(2:length(PNRZ));
URZ=URZ(2:length(URZ));
BRZ=BRZ(2:length(BRZ));
MNRZ=MNRZ(2:length(MNRZ));
x1=0;
x2=0;
x3=0;
x4=0;
x5=0;
t=0:0.01:n;
for i=1:n
 x1=[x1 UNRZ(i)*(ones(1,100))];
 x2=[x2 PNRZ(i)*(ones(1,100))];
end
x1=[x1(2:length(x1)) 0];
x2=[x2(2:length(x2)) 0];
i=1;
while(i<=length(URZ))
 x3=[x3 URZ(i)*ones(1,50) URZ(i+1)*ones(1,50)];
 x4=[x4 BRZ(i)*ones(1,50) BRZ(i+1)*ones(1,50)];
 x5=[x5 MNRZ(i)*ones(1,50) MNRZ(i+1)*ones(1,50)];
 i=i+2;
end
x3=[x3(2:length(x3)) 0];
x4=[x4(2:length(x4)) 0];
x5=[x5(2:length(x5)) 0];
figure;
subplot(3,1,1);
plot(t,x1);title('UNRZ');
subplot(3,1,2);
plot(t,x2);title('PNRZ');
subplot(3,1,3);
plot(t,x3);title('URZ');
figure;
subplot(3,1,1);
plot(t,x4);title('BRZ');
subplot(3,1,2);
plot(t,x5);title('MNRZ');
%PSD of UNRZ
f=0:0.001:2000;
A=5;
Tb=0.001;
s1=(((A^2)*Tb)/4).*((sinc(f.*Tb)).^2).*(1+(((1/Tb).*dirac(f))));
s1=s1/((A^2)*Tb);
f1=f*Tb;
figure;
plot(f1,s1);title('PSD of UNRZ');
%PSD of PNRZ signal
s2=((A^2)*Tb).*((sinc(f.*Tb)).^2);
s2=s2/((A^2)*Tb);
figure;
plot(f1,s2);title('PSD of PNRZ');
%PSD of Bipolar RZ Signal
s3=(((A^2)*Tb)/4).*((sinc((f.*Tb)/2)).^2).*((sinc(pi.*f.*Tb)).^2
);
s3=s3/((A^2)*Tb);
figure;
plot(f1,s3);title('PSD of BRZ');
%PSD of Manchester Coding
s4=((A^2)*Tb).*((sinc((f.*Tb)/2)).^2).*((sinc((pi.*f.*Tb)/2)).^2
);
s4=s4/((A^2)*Tb);
figure;
plot(f1,s4);title('PSD of MNRZ');
%PSD of URZ Signal
s5=(((A^2)*Tb)/16).*((sinc((f.*Tb)/2)).^2).*(1+(((1/Tb).*dirac(f
))));
s5=s5/((A^2)*Tb);
figure;
plot(f1,s5);title('PSD of URZ');
