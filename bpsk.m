function bpsk(x1,t)
c=sin(2*pi*10*t); 
p=x1.*c;  
figure;
subplot(3,1,1);
plot(t,x1);
title('Digital signal'); 
subplot(3,1,2); 
plot(t,c);
title('Carrier Wave');
subplot(3,1,3); 
plot(t,p);
title('PSK Modulated Signal'); 
end