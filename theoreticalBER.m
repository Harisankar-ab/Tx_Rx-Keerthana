clc;
clear all;
close all;
snr=0:1:18;
bnondiff=berawgn(snr,'',2,'nondiff');
bdiff=berawgn(snr,'psk',4,'diff');
semilogy(snr,bnondiff,'r');
hold on;
semilogy(snr,bdiff,'g');