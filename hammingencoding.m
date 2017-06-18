% hamming code with data 4 bits parity 3 bits at transmitter
k=[1 0 1 1];
j=1;
disp('the bts received');
disp(k);
lenk=length(k);
% creating a hamming code word matrix
data=zeros(1,length(k)+3);
disp('data matrix');
disp(data);
for i=(length(k)+3):-1:1
    disp('i value');
    disp(i);
    
    if((i==1) || (i==2) ||  (i==4) )
    
      continue; 
    
    end
     data(i)=data(i)+k(j);
        disp(data(i));
         
        j=j+1;
    
end

disp('data without parity bit' );
disp(data);

% calculating parity bit and appending

parcal1=data(3)+data(5)+data(7);
parcal2=data(3)+data(6)+data(7);
parcal3=data(5)+data(6)+data(7);

if(mod (parcal1,2)~=0)
    data(1)=1;
end

if(mod (parcal2,2)~=0)
    data(2)=1;
end
if(mod (parcal3,2)~=0)
    data(4)=1;
end

disp('data with parity bit' );
disp(data);


% hamming code with data 4 bits parity 3 bits at receiver 

r= [1 2 1 1 0 1 1];
R=zeros(1,length(r));
disp('receiver matrix');
j=1;
for i=length(r):-1:1
    
    R(j)=  R(j)+ r(i);
    j=j+1;
    
end
disp('receiver matrix in rev order like D7...');
disp(r);

disp('receiver matrix in order D1...');
disp(R);

% identifying the error position
P1=0;
P2=0;
P4=0;

p1chk=r(1)+r(3)+r(5)+r(7);
if(mod(p1chk,2)~=0)

    P1=1;

end

p2chk=r(2)+r(3)+r(6)+r(7);
if(mod(p2chk,2)~=0)

    P2=1;

end

p4chk=r(4)+r(5)+r(6)+r(7);
if(mod(p4chk,2)~=0)

    P4=1;

end

o=0;
disp('error bit position ');
bitpos=0;
P=[P4 P2 P1];
disp(P);
for i=1:length(P)
   bitpos = bitpos + P(i)*2.^(o);
   o=o+1;
   
end
disp('bit position');
disp(bitpos);


disp('received  data');
disp(R);

for i=1:length(R)

    if(i==bitpos)
       %R(i)= flip(R(i));
         R(i)=~(R(i));
        
    end
    
end
if(bitpos)
 disp('corrected data');
disp(R);   


else
disp('Data received correctly without any error');
disp(R);
end
function [t,x] = prz(bits, bitrate)
% PRZ Encode bit string using polar RZ code.
%   [T, X] = PRZ(BITS, BITRATE) encodes BITS array using polar RZ
%   code with given BITRATE. Outputs are time T and encoded signal
%   values X.

% Copyright (c) 2013 Yuriy Skalko <yuriy.skalko@gmail.com>

T = length(bits)/bitrate; % full time of bit sequence
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*n+1:(i+0.5)*n) = 1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+0.5)*n) = -1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  end
end





