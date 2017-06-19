function pnrz(s1)

n=length(s1);
PNRZ=0;

count=0;
for i=1:n
 if s1(i)==0
 
 PNRZ=[PNRZ -5];
 
 else
 count=count+1;
 
 PNRZ=[PNRZ 5];
 
 
 end
end

PNRZ=PNRZ(2:length(PNRZ));

x2=0;
t=0:0.01:n;
for i=1:n

 x2=[x2 PNRZ(i)*(ones(1,100))];
end

x2=[x2(2:length(x2)) 0];



 




%PSD of PNRZ signal
f=0:0.001:2000;
A=5;
Tb=0.001;
s2=((A^2)*Tb).*((sinc(f.*Tb)).^2);
s2=s2/((A^2)*Tb);

f1=f*Tb;
figure;
subplot(2,1,1);
plot(t,x2);title('PNRZ');


subplot(2,1,2);
plot(f1,s2);title('PSD of PNRZ');
bpsk(x2,t);
end
