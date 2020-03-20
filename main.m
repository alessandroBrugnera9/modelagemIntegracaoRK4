clear all;clc;close all;

h = 0.001;
m2 = 650;
vel = 80/3.6;
fprop = -1;
tFinal = 60;
t = 0:h:tFinal;

[Eulerx1,Eulerv1,Eulera1,Eulerx2,Eulerv2,Eulera2] = Euler (h,tFinal,m2,vel,fprop);
[RK2x1,RK2v1,RK2a1,RK2x2,RK2v2,RK2a2] = RK2 (h,tFinal,m2,vel,fprop);

figure1 = figure(1)
hold on
plot(t, Eulerx1, 'r')
plot(t, RK2x1, 'b')
%plot(t, R4teta(1,:), 'g')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\theta_{1}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\theta_{1} [rad]$', 'Interpreter','latex');

figure2 = figure(2)
hold on
plot(t, Eulerx2, 'r')
plot(t, RK2x2, 'b')
%plot(t, R4teta(2,:), 'g')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\theta_{2}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\theta_{2} [rad]$', 'Interpreter','latex');

figure3 = figure(3)
hold on
plot(t, Eulerv1, 'r')
plot(t, RK2v1, 'b')
%plot(t, R4tetaLinha(1,:), 'g')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\dot{\theta}_{1}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\dot{\theta}_{1} [rad/s]$', 'Interpreter','latex');

figure4 = figure(4)
hold on
plot(t, Eulerv2, 'r')
plot(t, RK2v2, 'b')
%plot(t, R4tetaLinha(2,:), 'g')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\dot{\theta}_{2}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\dot{\theta}_{2} [rad/s]$', 'Interpreter','latex');

figure5 = figure(5)
hold on
plot(t, Eulera1, 'r')
plot(t, RK2a1, 'b')
%plot(t, R4tetaLinha(1,:), 'g')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\ddot{\theta}_{1}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\ddot{\theta}_{1} [rad/s^{2}]$', 'Interpreter','latex');

figure6 = figure(6)
hold on
plot(t, Eulera2, 'r')
plot(t, RK2a2, 'g')
%plot(t, R2tetaLinha(2,:), 'b')
legend('Euler','RK2','RK4', 'Location','NW');
grid on
title({'Compara\c{c}\~{a}o de $\ddot{\theta}_{2}$ com diferentes m\''etodos num\''ericos'}, 'Interpreter','latex');
hold off
xlabel('Tempo [s]', 'Interpreter','latex');
ylabel('$\ddot{\theta}_{2} [rad/s^{2}]$', 'Interpreter','latex');


%saveas(figure1,'Theta1.jpg');
%saveas(figure2,'Theta2.jpg');
%saveas(figure3,'Theta11ponto.jpg');
%saveas(figure4,'Theta21ponto.jpg');
%saveas(figure5,'Theta12pontos.jpg');
%saveas(figure6,'Theta22pontos.jpg');