clc;
clear all;
close all;

pkg load queueing; 

lambda = 5;
mu = 10;
states = [0, 1, 2, 3, 4];
initial_state = [1, 0, 0, 0, 0];
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu, mu];

transition_matrix = ctmcbd(births_B, deaths_D);
display(transition_matrix);
P = ctmc(transition_matrix);
for i=1:5
 display(P(i));
endfor
figure(1);
bar(states, P, "r", 0.5);
title("M/M/1/4");
xlabel("Balance states");
ylabel("Balance propabilities");

% mean number of clients in the system
mean_clients = 0;
for i = 1 : 1 : 5
  mean_clients = mean_clients + P(i)*(i-1);
endfor
display(mean_clients);

display("Blocking probability = ");
display(P(5));

for j = 1:1:5
  index = 0;
  for T = 0 : 0.01 : 50
    index = index + 1;
    P0 = ctmc(transition_matrix, T, initial_state);
    Prob0(index) = P0(j);
    if P0 - P < 0.01
      break;
    endif
  endfor
  
  t = 0 : 0.01 : T;
  figure(j+1);
  plot(t, Prob0, "r", "linewidth", 1.3);
  xlabel("time");
  ylabel("Balance propability");
endfor