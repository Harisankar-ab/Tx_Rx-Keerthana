clc; 
clear all;
close all;  
Tb=input('Enter the Bit duration: ');  
t=0:0.001:4; 
x=square(2*pi*(1/(2*Tb))*t);  
c=sin(2*pi*10*t); 
p=x.*c;  
subplot(3,1,1); 
plot(t,x);
title('Bit stream'); 
subplot(3,1,2);
plot(t,c);
title('Carrier Wave'); 
subplot(3,1,3);
plot(t,p);
title('PSK Modulated Signal');   

% demodoutput = zeros(1,4);

y=[];
%We begin demodulation by multiplying the received signal again with 
%the carrier (basis function)
demodulated=p.*square(2*pi*(1/(2*Tb))*t);
%Here we perform the integration over time period T using trapz 
%Integrator is an important part of correlator receiver used here
for i=1:1000:4000
    disp('it entered')
 y=[y trapz(t(i:i+1000),demodulated(i:i+1000))]
 disp(y);
 
end
received = y>0;
figure;
stem(received)
title('Impulses of Received bits');
xlabel('Time (seconds)-->');
ylabel('Amplitude (volts)')


