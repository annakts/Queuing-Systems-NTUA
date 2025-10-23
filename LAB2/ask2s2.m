clc;
close all;
clear all;

pkg load queueing;

lambda = 5;
mu = 5.0001 : 0.0001 : 10;

[U, R, Q, X, p0] = qsmm1 (lambda, mu);

figure(1);
hold on;
plot(mu,U,"r","linewidth",1.2);
hold off;

title("Server Utilization and Service Rate Diagram");
xlabel("Service Rate (m)");
ylabel("Server Utilization");


figure(2);
hold on;
plot(mu,R,"r","linewidth",1.2);
axis([5 10 0 100]);
hold off;
title("Server Respose Time and Service Rate Diagram");
xlabel("Service Rate (m)");
ylabel("Server Response Time");

figure(3);
plot(mu,Q,"r","linewidth",1.2);
axis([5 10 0 100]);
title("Average number of requests and Service Rate Diagram");
xlabel("Service Rate (m)");
ylabel("Average number of requests in the system");

figure(4);
plot(mu,X,"r","linewidth",1.2);
title("Server throughput and Service Rate Diagram");
xlabel("Service Rate (m)");
ylabel("Server throughput");