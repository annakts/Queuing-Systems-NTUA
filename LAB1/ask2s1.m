clc;
clear all;
close all;

pkg load statistics;
#A Erwthma
k = 0:0.0001:8;
lambda = [0.5,1,3];

for i=1:columns(lambda)
  exp(i,:) = exppdf(k,lambda(i));
endfor

colors="rgb";
figure(1);
hold on;
for i=1:columns(lambda)
  plot(k,exp(i,:),colors(i),"linewidth",1.2);
endfor

hold off;

title("Probability Density Function of Exponential distribution");
xlabel("k values");
ylabel("probability");
legend("lambda=0.5","lambda=1","lambda=3");


#B Erwthma
k = 0:0.0001:8;
lambda = [0.5,1,3];

for i=1:columns(lambda)
  exp(i,:) = expcdf(k,lambda(i));
endfor

colors="rgb";
figure(2);
hold on;
for i=1:columns(lambda)
  plot(k,exp(i,:),colors(i),"linewidth",1.2);
endfor

hold off;

title("Probability Cumulative Function of Exponential distribution");
xlabel("k values");
ylabel("probability");
legend("lambda=0.5","lambda=1","lambda=3");

#C Erwthma


k = 0:0.00001:8;


exp = expcdf (k,2.5);
p1=1 - exp(30000);
#"P(X>30000)="
display(p1);
p2=(1-exp(50000))./(1-exp(20000));
#"P(X>50000|X>20000)="
display(p2);