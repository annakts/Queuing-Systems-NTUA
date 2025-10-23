clc;
clear all;
close all;
pkg load queueing

#Δίκτυο με εναλλακτική δρομολόγηση

#2

a = 0.001:0.001:0.999;
l = 10000;
l1 = 10000*a;
m1 = 14650;
l2 = 10000*(1-a);
m2 = 11720;

[U1, R1, Q1, X1, P1] = qsmm1(l1, m1);
[U2, R2, Q2, X2, P2] = qsmm1(l2, m2);

totalClients = Q1 + Q2;
totalTime = totalClients/l;
figure(1);
plot(a, totalTime,"g","linewidth",2);
xlabel("a");
ylabel("Average response time");

[minval, mina] = min(min(totalTime,[],1));
display("Minimun value of E(T)")
disp(minval)
display("for a=")
disp(0.001*(mina+1))