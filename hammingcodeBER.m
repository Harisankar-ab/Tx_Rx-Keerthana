% hamming code with data 4 bits parity 3 bits at transmitter
k=[1 0 1 1];
j=1;
disp('the bts going to transmit');
disp(k);
lenk=length(k);
f=0;
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
%original data with parity [7 6 5 4 3 2 1] =1 0 1 0 1 0 1
% for pos 4 r =[7 6 5 4 3 2 1] =[1 0 1 1 1 0 1 ];

% without error 
r = [1 0 1 0 1 0 1];

% error in pos 1 
%r = [1 0 1 0 1 0 0];

% error in pos 2 
%r = [1 0 1 0 1 1 1];

% error in pos 3 
 %r = [1 0 1 0 0 0 1];

% error in pos 4
%r = [1 0 1 1 1 0 1];

% error in pos 5 
%r = [1 0 0 0 1 0 1];

% error in pos 6
%r = [1 1 1 0 1 0 1];

% error in pos 7
%r = [0 0 1 0 1 0 1];
 

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
 
p1chk=R(1)+R(3)+R(5)+R(7);

if(mod(p1chk,2)~=0)
 
    P1=1;
   
 
end
 
p2chk=R(2)+R(3)+R(6)+R(7);

if(mod(p2chk,2)~=0)
 
    P2=1;
    
 
end
 
p4chk=R(4)+R(5)+R(6)+R(7);

if(mod(p4chk,2)~=0)
 
    P4=1;
    
end
 
 disp('p1 value')
    disp(P1)

disp('p2 value')
     disp(P1)

disp('p3 value')
     disp(P1)
 

o=2;
disp('error bit position ');
bitpos=0;
P=[P4 P2 P1];
disp(P);
for i=1:1:length(P)
   bitpos = bitpos + P(i)*2.^(o);
   o=o-1;
   
end
disp('bit position');
disp(bitpos);
 
disp('receiver side data...');
disp(R);

for i=1:length(R)
 
    if(i==bitpos)
       %R(i)= flip(R(i));
         R(i)=~(R(i));
         f=1;
        
    end
    
end
disp('the data transmitted');
disp(data);
if(bitpos)
 disp('corrected data');
disp(R);   
 
 
else
disp('Data received correctly without any error');
disp(R);
end

Ber=f/length(R);
disp('bit error rate');
disp(Ber);
disp('bit error rate in percentage');
inper=Ber*100;
disp(inper);
 


