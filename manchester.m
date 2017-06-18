function manchester(b1)

n=length(b1); 
Tb=1;

MNRZ=0; 
count=0; 
for i=1:n 
if b1(i)==0 
MNRZ=[MNRZ -5 5]; 
else 
MNRZ=[MNRZ 5 -5]; 
end 
end 
MNRZ=MNRZ(2:length(MNRZ)); 
x1=0; 

t=0:0.01:n;  
i=1; 
while(i<=length(MNRZ)) 
x1=[x1 MNRZ(i)*ones(1,50) MNRZ(i+1)*ones(1,50)]; 
i=i+2; 
end 
x1=[x1(2:length(x1)) 0]; 
figure; 
subplot(3,1,1); 
plot(t,x1);
title('MNRZ'); 
%PSD of Manchester Coding 
f=0:0.001:2000;
A=5;
Tb=0.001;
f1=f*Tb;
s1=((A^2)*Tb).*((sinc((f.*Tb)/2)).^2).*((sinc((pi.*f.*Tb)/2)).^2);
s1=s1/((A^2)*Tb); 
figure; 
plot(f1,s1);
title('PSD of MNRZ');
bpsk(x1,t);

end