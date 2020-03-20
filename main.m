clear all;clc;close all;


h = 0.01;
tFinal = 60;
t = 0:h:tFinal;
passo=1;
passos=tFinal/h;
teta = [0;0];
tetaLinha = [0.4;-0.1]

teta2Linha = calcTeta2Linha (teta, tetaLinha);

[passo, Eteta, EtetaLinha, Eteta2Linha] = eulerRecursivo (passo, teta, tetaLinha, teta2Linha, passos, h);
passo=1;
[passo, R2teta, R2tetaLinha, R2teta2Linha] = RK2Recursivo (passo, teta, tetaLinha, teta2Linha, passos, h);
passo=1;
[passo, R4teta, R4tetaLinha, R4teta2Linha] = RK4Recursivo (passo, teta, tetaLinha, teta2Linha, passos, h);

figure1 = figure(1)
hold on
plot(t, Eteta(1,:), 'r')
plot(t, R4teta(1,:), 'g')
plot(t, R2teta(1,:), 'b')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\theta_{1}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\theta_{1} [rad]$', 'Interpreter','latex');

figure2 = figure(2)
hold on
plot(t, Eteta(2,:), 'r')
plot(t, R4teta(2,:), 'g')
plot(t, R2teta(2,:), 'b')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\theta_{2}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\theta_{2} [rad]$', 'Interpreter','latex');

figure3 = figure(3)
hold on
plot(t, EtetaLinha(1,:), 'r')
plot(t, R4tetaLinha(1,:), 'g')
plot(t, R2tetaLinha(1,:), 'b')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\dot{\theta}_{1}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\dot{\theta}_{1} [rad/s]$', 'Interpreter','latex');

figure4 = figure(4)
hold on
plot(t, EtetaLinha(2,:), 'r')
plot(t, R4tetaLinha(2,:), 'g')
plot(t, R2tetaLinha(2,:), 'b')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\dot{\theta}_{2}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\dot{\theta}_{2} [rad/s]$', 'Interpreter','latex');

figure5 = figure(5)
hold on
plot(t, EtetaLinha(1,:), 'r')
plot(t, R4tetaLinha(1,:), 'g')
plot(t, R2tetaLinha(1,:), 'b')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\ddot{\theta}_{1}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\ddot{\theta}_{1} [rad/s^{2}]$', 'Interpreter','latex');

figure6 = figure(6)
hold on
plot(t, EtetaLinha(2,:), 'r')
plot(t, R4tetaLinha(2,:), 'g')
plot(t, R2tetaLinha(2,:), 'b')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\ddot{\theta}_{2}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\ddot{\theta}_{2} [rad/s^{2}]$', 'Interpreter','latex');


saveas(figure1,'Theta1.jpg');
saveas(figure2,'Theta2.jpg');
saveas(figure3,'Theta11ponto.jpg');
saveas(figure4,'Theta21ponto.jpg');
saveas(figure5,'Theta12pontos.jpg');
saveas(figure6,'Theta22pontos.jpg');

%str = {'$$ x1 $$', '$$ x2 $$', '$$ x3 $$', '$$ x4 $$', '$$ x5 $$'};
%h = legend(str, 'Interpreter','latex', 'Location','NW');
%set(h, 'FontSize', 12);